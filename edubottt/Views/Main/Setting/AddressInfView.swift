//
//  AddressInfView.swift
//  edubottt
//
//  Created by Mochy on 2024-06-21.
//

import SwiftUI

struct AddressInfView: View {
    @StateObject var controler = UserInfViewModel()
    
    
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""
    @State private var isValid: Bool = false
    
    var body: some View {
        let userAddressInf = $controler.newUserInf.addressInf
    
        NavigationStack {
            Form {
                Section(header: Text("Address Information")) {
                    TextField("Address", text: userAddressInf.address)
                    TextField("City", text: userAddressInf.city)
                    TextField("Province", text: userAddressInf.state)
                    TextField("Country", text: userAddressInf.country)
                    TextField("Postal Code", text: userAddressInf.postalCode)
                }
            }
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button("Save") {
                        
                    }
                    .alert(isPresented: $showAlert, content: {getAlert()})
                    
                }
            }
            .navigationTitle("Address Information")
            .navigationBarTitleDisplayMode(.inline)
            .onTapGesture(count: 2) {
                self.collapseKeyboard()
            }
        }
    }
    
    private func collapseKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    private func getAlert() -> Alert {
        Alert(title: Text(alertMessage))
    }
}

#Preview {
    AddressInfView()
}
