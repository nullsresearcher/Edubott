//
//  SignUp.swift
//  edubottt
//
//  Created by Mochy on 2024-05-12.
//

import SwiftUI

struct SignUp: View {
    @StateObject var SignUpControler: SignUpWithEmailViewModel = SignUpWithEmailViewModel()
    @StateObject var KeyChainControler : KeyChainViewModel = KeyChainViewModel()
    
    @State private var confirmedPassword: String = ""
    @State private var isValid: Bool = false
    @State private var isSignIn: Bool = false
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""
    
    @Binding var showHomePage: Bool
    
    var body: some View {
        VStack {
            NavigationStack {
                VStack {
                    TextField("Email", text: $SignUpControler.email)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                    
                    SecureField("Password", text: $SignUpControler.password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                    
                    WarningBox(condition: !SignUpControler.validPassword, message: "Password must be at least 8 character!")
                    
                    SecureField("Confirm Password", text: $confirmedPassword)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                    
                    WarningBox(condition: SignUpControler.password != confirmedPassword, message: "Please reenter password!")
                    
                    Button("Sign Up") {
                        guard SignUpControler.validPassword(password: confirmedPassword), confirmedPassword == SignUpControler.password else {
                            print("invalid input")
                            return
                        }
                        
                        Task {
                            do {
                                try await SignUpControler.signUp()
                                isValid = true
                                KeyChainControler.set(SignUpControler.email, key: "email")
                                KeyChainControler.set(confirmedPassword, key: "password")
                                
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
                        SignIn(showHomePage: $showHomePage).environmentObject(UserRefViewModel())
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
    @State static private var showHomePage = false
    static var previews: some View {
        let userInfViewModel = SignInViewModel()
        return SignUp(showHomePage: $showHomePage)
            .environmentObject(userInfViewModel)
    }
}



