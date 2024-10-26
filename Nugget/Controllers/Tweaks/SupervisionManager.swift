//
//  SupervisionManager.swift
//  Nugget
//
//  Created by Efaz on 10/24/24.
//

import Foundation
import SwiftUI

class SupervisionManager: NSObject, ObservableObject {
    static let shared = SupervisionManager()
    @Published var supervisionEnabler: Bool = false
    @Published var supervisionName: String = ""
    
    func apply() throws -> Data {
        if let filePath = Bundle.main.path(forResource: "CloudConfigurationDetails", ofType: "plist", inDirectory: "Controllers/Tweaks/Supervision") {
            let overridesURL = URL(fileURLWithPath: filePath)
            guard let plist = NSMutableDictionary(contentsOf: overridesURL) else {
                print("Something went wrong reading CloudConfigurationDetails.plist. Returning empty data.")
                return Data()
            }
            plist["IsSupervised"] = supervisionEnabler
            plist["OrganizationName"] = supervisionEnabler ? supervisionName : ""
            let data = try PropertyListSerialization.data(fromPropertyList: plist, format: .xml, options: 0)
            try data.write(to: overridesURL)
            print("Successfully written data for \(overridesURL)")
            return data
        } else {
            print("Something went wrong finding CloudConfigurationDetails.plist. Returning empty data.")
            return Data()
        }
    }
    
    func reset() throws -> Data {
        return Data()
    }
    
    func toggleSupervision(_ enabled: Bool) {
        supervisionEnabler = enabled
    }
    
    func setDetails(_ organizationName: Any) {
        if let organizationNamee = organizationName as? String, organizationNamee != "-1" {
            supervisionName = organizationNamee
        }
    }
}
