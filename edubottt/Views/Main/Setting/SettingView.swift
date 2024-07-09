//
//  SettingView.swift
//  edubottt
//
//  Created by Mochy on 2024-06-12.
//

import SwiftUI

struct SettingView: View {
    @StateObject var authenController = AuthenticationViewModel()
    @EnvironmentObject var userInfController : UserInfViewModel
    @Binding var showHomepage: Bool
    
    var body: some View {
        
        NavigationStack {
            List {
                NavigationLink(destination: PersonalInfView().environmentObject(userInfController)) {
                    Button("Update personal information") {
                        // Your action here
                    }
                }
                
                NavigationLink(destination:
                    AddressInfView()
                    .environmentObject(userInfController)) {
                        Button("Update address") {
                            
                        }
                    }
                
                NavigationLink(destination: ChangePassword(showHomePage: $showHomepage)) {
                    Button("Change password") {
                            
                    }
                }
                
                
                Button("Delete account") {
                    // Your action here
                }
                Button("Log out") {
                    Task {
                        do {
                            try  authenController.signOut()
                            showHomepage = true
                        } catch {
                            print("Error: \(error)")
                        }
                    }
                }
                .navigationDestination(isPresented: $showHomepage) {
                    Root()
                }
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}


// Preview Provider
struct SettingView_Previews: PreviewProvider {
    @State static private var showHomepage = false
    
    static var previews: some View {
        SettingView(showHomepage: $showHomepage)
    }
}
