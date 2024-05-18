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


struct ConfirmEmail: View {
    @EnvironmentObject var userInfViewModel: UserInfViewModel
    @Binding var email: String
    @Binding var isValidEmail: Bool
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""
    var body: some View {
        VStack {
            TextField("Email", text: $email)
                .padding()
                .frame(width: 300, height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
            Button("Change Password") {
                validEmail()
            }
            .foregroundColor(.white)
            .frame(width: 300, height: 50)
            .background(Color.blue)
            .cornerRadius(10)
            .alert(isPresented: $showAlert, content: {
                getAlert()
            })
            
        }
    }
    func getAlert() -> Alert {
        return Alert(title: Text(alertMessage))
    }
    
    func validEmail() {
        if email == userInfViewModel.userInf.personalInf.email && !email.isEmpty {
            isValidEmail = true
        } else {
            alertMessage = "Email is invalid. Please try again!"
            showAlert.toggle()
        }
    }
}

struct ChangePassword: View {
    @EnvironmentObject var userInfViewModel: UserInfViewModel
    @Binding var password: String
    @Binding var confirmPassword: String
    @Binding var isMatch: Bool
    var body: some View {
        SecureField("Password", text: $password)
            .padding()
            .frame(width: 300, height: 50)
            .background(Color.black.opacity(0.05))
            .cornerRadius(10)
        
        SecureField("Confirm Password", text: $confirmPassword)
            .padding()
            .frame(width: 300, height: 50)
            .background(Color.black.opacity(0.05))
            .cornerRadius(10)
        
        Button("Update") {
            print("click")
        }
        .foregroundColor(.white)
        .frame(width: 300, height: 50)
        .background(Color.blue)
        .cornerRadius(10)
        .navigationDestination(isPresented: $isMatch) {
            MainView().environmentObject(UserRefViewModel())}
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
