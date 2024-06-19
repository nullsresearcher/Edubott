//
//  ChangePassword.swift
//  edubottt
//
//  Created by Mochy on 2024-05-17.
//

import SwiftUI

struct ChangePassword: View {
    @EnvironmentObject var userInfViewModel: UserInfViewModel
    @Binding var password: String
    @Binding var confirmPassword: String
    @Binding var isMatch: Bool
    @Binding var showHomePage: Bool
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""
    
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
            isMatchPassWord()
        }
        .foregroundColor(.white)
        .frame(width: 300, height: 50)
        .background(Color.blue)
        .cornerRadius(10)
        .alert(isPresented: $showAlert, content: {
            getAlert()
        })
        .navigationDestination(isPresented: $isMatch) {
            MainView(showHomePage: $showHomePage).environmentObject(UserRefViewModel())}
    }
    func getAlert() -> Alert {
        return Alert(title: Text(alertMessage))
    }
    
    func isMatchPassWord() {
        if password == confirmPassword {
            userInfViewModel.updatePassword(newPassword: password)
            isMatch = true
        } else {
            
        }
    }
}


