//
//  SignUp.swift
//  edubottt
//
//  Created by Mochy on 2024-05-12.
//

import SwiftUI

struct SignUp: View {
    @StateObject var controler: SignUpWithEmailViewModel = SignUpWithEmailViewModel()
    
    @State private var confirmedPassword: String = ""
    @State private var isValid: Bool = false
    @State private var isSignIn: Bool = false
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""
    
    var body: some View {
        VStack {
            NavigationStack {
                VStack {
                    TextField("Email", text: $controler.email)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                    
                    SecureField("Password", text: $controler.password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                    
                    SecureField("Confirm Password", text: $confirmedPassword)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                    
                    Button("Sign Up") {
                        Task {
                            do {
                                try await controler.signUp()
                                isValid = true
                                return
                            }
                            catch {
                                alertMessage = "The email is already taken. Please sign in!"
                                showAlert = true
                                print(error)
                            }
                        }
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .alert(isPresented: $showAlert, content: {getAlert()})
                    .navigationDestination(isPresented: $isValid) {
                        MainView().environmentObject(UserRefViewModel())
                    }
                    
                    
                    
                }
            }
            .navigationTitle("Welcome back!")
            .navigationBarTitleDisplayMode(.inline)
        }
    }


    private func getAlert() -> Alert {
        return Alert(title: Text(alertMessage))
    }
}



struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        let userInfViewModel = SignInViewModel()
        return SignUp()
            .environmentObject(userInfViewModel)
    }
}



