//
//  ConfirmEmail.swift
//  edubottt
//
//  Created by Mochy on 2024-05-17.
//

import SwiftUI

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

