//
//  SettingView.swift
//  edubottt
//
//  Created by Mochy on 2024-06-12.
//

import SwiftUI

struct SettingView: View {
    @StateObject var controler = AuthenticationViewModel()
    @Binding var showHomepage: Bool
    
    var body: some View {
        
        NavigationStack {
            List {
                Button("Update personal information") {
                    // Your action here
                }
                
                Button("Update address") {
                    // Your action here
                }
                
                Button("Change password") {
                    // Your action here
                }
                Button("Delete account") {
                    // Your action here
                }
                Button("Log out") {
                    Task {
                        do {
                            try  controler.signOut()
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
