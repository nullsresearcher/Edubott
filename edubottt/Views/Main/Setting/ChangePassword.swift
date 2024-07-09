//
//  ChangePassword.swift
//  edubottt
//
//  Created by Mochy on 2024-05-17.
//

import SwiftUI

struct ChangePassword: View {
    @StateObject private var controler = AuthenticationViewModel()
    @Binding var showHomePage: Bool
    @State private var password: String = ""
    @State private var confirmPassword : String = ""
    @State private var isUpdated: Bool = false
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""
    @State private var email: String = ""
    
    var body: some View {
        SecureField("New Password", text: $password)
            .padding()
            .frame(width: 300, height: 50)
            .background(Color.black.opacity(0.05))
            .cornerRadius(10)
        WarningBox(condition: !password.isEmpty && !controler.validPassword(password: password), message: "Password must be at least 8 character!")
        SecureField("Confirm Password", text: $confirmPassword)
            .padding()
            .frame(width: 300, height: 50)
            .background(Color.black.opacity(0.05))
            .cornerRadius(10)
        WarningBox(condition: !confirmPassword.isEmpty && confirmPassword != password, message: "Password must be matched!")
        Button("Update") {
            print("update")
            Task {
    
                do {
                    guard controler.validPassword(password: password), confirmPassword == password else {
                        return
                    }
                    try await controler.updatePassword(password: password)
                    alertMessage = "Password is updated!"
                    showAlert = true
                    isUpdated = true
                }
                catch {
                    print(error)
                    alertMessage = "Please try again!"
                    showAlert = true
                }
            }
        }
        .foregroundColor(.white)
        .frame(width: 300, height: 50)
        .background(Color.blue)
        .cornerRadius(10)
        .alert(isPresented: $showAlert, content: {
            getAlert()
        })
        .onAppear {
            do {
                email = try controler.getEmail()
            } catch {
                print("Failed to get email: \(error)")
            }
        }
        .navigationDestination(isPresented: $isUpdated) {
            MainView(showHomePage: $showHomePage, email: $email)}
    }
    func getAlert() -> Alert {
        return Alert(title: Text(alertMessage))
    }
    
}


