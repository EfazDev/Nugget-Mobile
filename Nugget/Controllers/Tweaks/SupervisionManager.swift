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

    func apply() throws -> Data? {
        let cloudData = try Data(contentsOf: URL(fileURLWithPath: "/var/containers/Shared/SystemGroup/systemgroup.com.apple.configurationprofiles/Library/ConfigurationProfiles/CloudConfigurationDetails.plist"))
        var plist = try PropertyListSerialization.propertyList(from: cloudData, options: [], format: nil) as! [String: Any]
        if supervisionEnabler {
            plist["IsSupervised"] = (supervisionEnabler == true)
            plist["OrganizationName"] = supervisionName
        } else {
            plist["IsSupervised"] = false
        }
        
        return try PropertyListSerialization.data(fromPropertyList: plist, format: .xml, options: 0)
    }
    
    func reset() -> Data {
        let cloudURL = URL.tweaksDirectory.appendingPathComponent("/var/containers/Shared/SystemGroup/systemgroup.com.apple.configurationprofiles/Library/ConfigurationProfiles/CloudConfigurationDetails.plist")
        try? FileManager.default.removeItem(at: cloudURL)
        return Data()
    }
}
