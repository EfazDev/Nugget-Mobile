//
//  SupervisionView.swift
//  Nugget
//
//  Created by Efaz on 10/24/24.
//

import SwiftUI

struct SupervisionView: View {
    @StateObject var manager = SupervisionManager.shared
    @State var supervisionEnabler: Bool = false
    @State var supervisionName: String = ""
    
    var body: some View {
        List {
            Section {
                
            } footer: {
                Text("Imported from Cowabunga Lite. However, it may have issues so have a backup just in case.")
            }
            
            if #available(iOS 18.1, *) {
                Section {
                    Toggle(isOn: $supervisionEnabler) {
                        HStack {
                            Text("Enable Supervision")
                            Spacer()
                            Button(action: {
                                showInfoAlert(NSLocalizedString("Enables Supervision", comment: "Supervision popup"))
                            }) {
                                Image(systemName: "info.circle")
                            }
                        }
                    }.onChange(of: supervisionEnabler) { nv in
                        manager.toggleSupervision(nv)
                    }
                    
                    
                    if supervisionEnabler {
                        TextField("Enter Supervision Name", text: $supervisionName).onChange(of: supervisionName) { nv in
                            manager.setDetails(supervisionName)
                        }
                    }
                }
            }
        }
        .tweakToggle(for: .Supervision)
        .navigationTitle("Supervision")
        .onAppear {
            supervisionEnabler = manager.supervisionEnabler
            supervisionName = manager.supervisionName
        }
    }
    
    func showInfoAlert(_ body: String) {
        UIApplication.shared.alert(title: "Info", body: body)
    }
}
