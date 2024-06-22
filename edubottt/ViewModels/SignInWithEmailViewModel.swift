//
//  SignInWithEmailViewModel.swift
//  edubottt
//
//  Created by Mochy on 2024-06-12.
//

import Foundation
class SignInWithEmailViewModel: AuthenticationViewModel {
    @Published var email: String = ""
    @Published var password: String = ""
    
    func signIn() {
        guard !email.isEmpty, !password.isEmpty else {
            return
        }
        Task {
            do {
                let returnedData = try await SignInWithEmailViewModel.shared.newUser(email: email, password: password)
                print("success")
                print(returnedData)
            }
            catch {
                print("Error:  \(error)")
            }
        }
    }
}
