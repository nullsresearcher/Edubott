//
//  SettingView.swift
//  edubottt
//
//  Created by Mochy on 2024-06-12.
//

import SwiftUI

struct SettingView: View {
    @StateObject  var controler = AuthenticationViewModel()
    @Binding var showHomepage: Bool
    
    var body: some View {
        List {
            Button("Log out") {
                Task {
                    do {
                        try controler.signOut()
                        showHomepage = true
                    } catch {
                        print("Error: \(error)")
                    }
                }
            }
        }.navigationTitle("Settings")
    }
}


