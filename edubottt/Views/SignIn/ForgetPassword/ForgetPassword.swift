//
//  ForgetPassword.swift
//  edubottt
//
//  Created by Mochy on 2024-05-17.
//

import SwiftUI

struct ForgetPassword: View {
    @StateObject var controler: SignInWithEmailViewModel = SignInWithEmailViewModel()
    @State private var isMatch: Bool = false
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""
    @State private var isValidEmail: Bool = false
    @State private var email: String = ""
    
    @Binding var showHomePage: Bool
    
    var body: some View {
        VStack {
            NavigationStack {
                ConfirmEmail()
            }
            .navigationTitle("Change Password")
        }
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertMessage))
    }
}


struct ForgetPassword_Previews: PreviewProvider {
    @State static private var showHomePage = false
    static var previews: some View {
        let SignInWithEmailViewModel = SignInWithEmailViewModel()
       
        return ForgetPassword(showHomePage: $showHomePage)
            .environmentObject(SignInWithEmailViewModel)
      
    }
}
