//
//  LogIn.swift
//  edubottt
//
//  Created by Mochy on 2024-05-13.
//

import SwiftUI

struct LogIn: View {
    @EnvironmentObject var userInfViewModel: UserInfViewModel
    @EnvironmentObject var userRefViewModel: UserRefViewModel
    @State private var userEmail: String = ""
    @State private var password: String = ""
    @State private var isValid: Bool = false
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Welcome back!")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                
                TextField("Email", text: $userEmail)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                
                SecureField("Password", text: $password)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                
                Button("Log In") {
                    print("click")
                    if isValidLogIn() {
                        print("Log in successfully")
                        isValid = true
                    } else {
                        print("try again")
                        print(userInfViewModel.userInf.personalInf.email)
                        print(userInfViewModel.userInf.personalInf.password)
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
    }


    
    func isValidLogIn() -> Bool {
        guard !userEmail.isEmpty && !password.isEmpty else {
            showAlert.toggle()
            alertMessage = "Please enter your email and password"
            return false
        }
                guard userEmail == userInfViewModel.userInf.personalInf.email && password == userInfViewModel.userInf.personalInf.password else {
                    showAlert.toggle()
                    alertMessage = "Invalid email or password! Please try again!"
                    return false
                }

//        guard userEmail == "H" && password == "Hi" else {
//            showAlert.toggle()
//            alertMessage = "Invalid email or password! Please try again!"
//            return false
//        }
        return true
    }
    func getAlert() -> Alert {
        return Alert(title: Text(alertMessage))
    }
    
}

struct LogIn_Previews: PreviewProvider {
    static var previews: some View {
        let userInfViewModel = UserInfViewModel()
        let userRefViewModel = UserRefViewModel()
        return LogIn()
            .environmentObject(userInfViewModel)
            .environmentObject(userRefViewModel)
    }
}



