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
    
    @Binding var showHomePage: Bool
    
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
                    WarningBox(condition: !controler.validPassword, message: "Password must be at least 8 character!")
                    SecureField("Confirm Password", text: $confirmedPassword)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                    WarningBox(condition: controler.password != confirmedPassword, message: "Please reenter password!")
                    Button("Sign Up") {
                        Task {
                            do {
                                try await controler.signUp()
                                isValid = true
                                showHomePage = false
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
                        MainView(showHomePage: $showHomePage).environmentObject(UserRefViewModel())
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



