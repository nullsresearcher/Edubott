//
//  LogIn.swift
//  edubottt
//
//  Created by Mochy on 2024-05-13.
//

import SwiftUI

struct LogIn: View {
    @EnvironmentObject var userInfViewModel: UserInfViewModel
    @State private var userEmail: String = ""
    @State private var password: String = ""
    @State private var isValid: Bool = false
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""
    
    var body: some View {
        VStack {
            Text("Welcome back!").font(.largeTitle)
            
            NavigationView{
                VStack {
                    
                    TextField("Email", text: $userEmail)
                        .frame(height:50)
                        .padding()
                        .border(Color.gray)
                        .cornerRadius(8)
                        .foregroundColor(.black)
                    SecureField("Password", text: $password)
                        .frame(height: 50)
                        .padding()
                        .border(Color.gray)
                        .cornerRadius(8)
                    
                    
                    
                    
                }
                .frame(height: 200)
                .listStyle(PlainListStyle())
                .background(Color.clear)
                .padding()
                .toolbar {
                    ToolbarItem(placement: .bottomBar) {
                        Button("Log In") {
                            
                        }
                        .alert(isPresented: $showAlert, content: getAlert)
                        
                    }
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
        return true
    }
    func getAlert() -> Alert{
        return Alert(title: Text(alertMessage))
    }
    
}

struct LogIn_Previews: PreviewProvider {
    static var previews: some View {
        let userInfViewModel = UserInfViewModel()
        return LogIn().environmentObject(userInfViewModel)
    }
}
