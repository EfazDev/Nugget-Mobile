//
//  SupervisionManager.swift
//  Nugget
//
//  Created by Efaz on 10/24/24.
//

import Foundation
import UIKit

class SupervisionManager: ObservableObject {
    static let shared = SupervisionManager()
    @Published var supervisionEnabler: Bool = false
    @Published var supervisionName: String = ""
    
    func toggleSupervision(_ enabled: Bool) {
        supervisionEnabler = enabled
    }
    
    func setDetails(_ organizationName: Any) {
        if let organizationNamee = organizationName as? String, organizationNamee != "-1" {
            supervisionName = organizationNamee
        }
    }

    func apply() throws -> [String: Data] {
        var changes: [String: Data] = [:]
        let cloudPath = "/var/containers/Shared/SystemGroup/systemgroup.com.apple.configurationprofiles/Library/ConfigurationProfiles/CloudConfigurationDetails.plist"
        
        guard let url = Bundle.main.url(forResource: cloudPath, withExtension: "plist"),
            let data = try? Data(contentsOf: url) else {
            return changes
        }
        
        guard var plist = try? PropertyListSerialization.propertyList(from: data, options: [], format: nil) as? [String: Any] else {
            return changes
        }
        
        if supervisionEnabler {
            plist["IsSupervised"] = (supervisionEnabler == true)
            plist["OrganizationName"] = supervisionName
        } else {
            plist["IsSupervised"] = false
        }
        
        guard let modifiedData = try? PropertyListSerialization.data(fromPropertyList: plist, format: .xml, options: 0) else {
            return changes
        }
        
        changes[cloudPath] = modifiedData
        return changes
    }
    
    func revert() throws -> [String: Data] {
        return [:]
    }
}
