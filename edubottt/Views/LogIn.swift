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
               TextField("Email", text: $userEmail)
                   .padding()
                   .frame(minWidth: .infinity)
                   .frame(height: 50)
                   .textFieldStyle(RoundedBorderTextFieldStyle())
               SecureField("Password", text: $password)
                   .padding()
                   .frame(height: 50)
                   .textFieldStyle(RoundedBorderTextFieldStyle())
               
               Button("Log In") {
                   
               }
               .padding()
               .frame(width: 350, height: 50)
               .foregroundColor(.white)
               .background(Color.blue)
               .cornerRadius(8)
               .alert(isPresented: $showAlert) {
                   Alert(title: Text(alertMessage))
               }
           }
           .padding()
           .frame(width: 350)
           .background(Color.blue)
       }
}

struct LogIn_Previews: PreviewProvider {
    static var previews: some View {
        let userInfViewModel = UserInfViewModel()
        return LogIn().environmentObject(userInfViewModel)
    }
}
