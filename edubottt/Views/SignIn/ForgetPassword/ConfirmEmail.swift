//
//  ConfirmEmail.swift
//  edubottt
//
//  Created by Mochy on 2024-05-17.
//

import SwiftUI

struct ConfirmEmail: View {
    @State var controler = SignInWithEmailViewModel ()
    @State var email: String = ""
  
    @State private var showHomePage: Bool = true
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""
    @State private var showSignIn: Bool = false
    var body: some View {
        VStack {
            TextField("Email", text: $email)
                .padding()
                .frame(width: 300, height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
            Button("Change Password") {
                Task {
                    do {
                        try await controler.resetPassword(email: email)
                        alertMessage = "Send the reset password request successfully!"
                        showAlert = true
                        showSignIn = true
                        
                    }
                    catch {
                        print(error)
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
            .navigationDestination(isPresented: $showSignIn) {
                SignIn(showHomePage: $showHomePage)
            }
            
        }
    }
    func getAlert() -> Alert {
        return Alert(title: Text(alertMessage))
    }
}


