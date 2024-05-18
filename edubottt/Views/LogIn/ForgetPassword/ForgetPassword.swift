//
//  ForgetPassword.swift
//  edubottt
//
//  Created by Mochy on 2024-05-17.
//

import SwiftUI

struct ForgetPassword: View {
    @EnvironmentObject var userInfViewModel: UserInfViewModel
    @State private var isMatch: Bool = false
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""
    @State private var isValidEmail: Bool = false
    @State private var email: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Change Password")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                Group {
                    if isValidEmail {
                        ChangePassword(password: $password, confirmPassword: $confirmPassword, isMatch: $isMatch)
                    } else {
                        ConfirmEmail(email: $email, isValidEmail: $isValidEmail)
                    }
                }
            }
        }
    }
    func validateEmail(_ email: String) -> Bool {
        return false
    }
    
    func isValid() -> Bool {
        if !password.isEmpty && password == confirmPassword {
            return true
        }
        return false
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertMessage))
    }
}


struct ForgetPassword_Previews: PreviewProvider {
    static var previews: some View {
        let userInfViewModel = UserInfViewModel()
        let userRefViewModel = UserRefViewModel()
        return ForgetPassword()
            .environmentObject(userInfViewModel)
            .environmentObject(userRefViewModel)
    }
}
