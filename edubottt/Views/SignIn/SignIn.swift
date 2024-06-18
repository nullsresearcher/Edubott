//
//  LogIn.swift
//  edubottt
//
//  Created by Mochy on 2024-05-13.
//

import SwiftUI

struct SignIn: View {
    @StateObject var controler: SignInWithEmailViewModel = SignInWithEmailViewModel()
    
    @State private var userEmail: String = ""
    @State private var password: String = ""
    @State private var isValid: Bool = false
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
                    
                    Button("Log In") {
                        print("click")
                        Task {
                            do {
                                try await controler.signIn()
                                isValid = true
                                return
                            }
                            catch {
                                alertMessage = "Email or password is not valid. Please try again!"
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
                    
                    
                    NavigationLink(
                        destination: ForgetPassword()) {
                            Text("Forget password")
                                .italic()
                                .underline()
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

struct LogIn_Previews: PreviewProvider {
    static var previews: some View {
        let userInfViewModel = UserInfViewModel()
        let userRefViewModel = UserRefViewModel()
        return SignIn()
            .environmentObject(userInfViewModel)
            .environmentObject(userRefViewModel)
    }
}



