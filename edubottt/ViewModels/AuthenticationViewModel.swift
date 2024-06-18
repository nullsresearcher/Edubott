//
//  AuthenticationViewModel.swift
//  edubottt
//
//  Created by Mochy on 2024-06-12.
//

import Foundation
import FirebaseAuth
import GoogleSignInSwift

class AuthenticationViewModel: ObservableObject {
    
    static let shared = AuthenticationViewModel()
    
    func getAuthenticatedUser() throws -> UserAccount {
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badServerResponse)
        }
        return UserAccount(user: user)
    }
    
    func signOut() throws {
        try Auth.auth().signOut()
    }
}


class SignUpWithEmailViewModel: AuthenticationViewModel {
    @Published var email: String = ""
    @Published var password: String = ""
    
    func signUp() async throws {
        guard !email.isEmpty, !password.isEmpty else {
            return
        }
        try await self.newUser(email: email, password: password)
        
    }
}

class SignInWithEmailViewModel: AuthenticationViewModel {
    @Published var email: String = ""
    @Published var password: String = ""
    
    @discardableResult
    func signIn() async throws -> UserAccount {
        return try await self.signInUser(email: email, password: password)
    }
}


// SIGN IN EMAIL
extension AuthenticationViewModel {
    
    @discardableResult
    func newUser(email: String, password: String) async throws -> UserAccount {
        let authDataFetch = try await Auth.auth().createUser(withEmail: email, password: password)
        return UserAccount(user: authDataFetch.user)
    }
    
    @discardableResult
    func signInUser (email: String, password: String) async throws -> UserAccount {
        let authDataResult = try await Auth.auth().signIn(withEmail: email, password: password)
        return UserAccount(user: authDataResult.user)
    }
    
    func resetPassword(email: String) async throws {
        try await Auth.auth().sendPasswordReset(withEmail: email)
    }
    
    func updatePassword (password:
                         String) async throws {
        guard let user = Auth.auth() .currentUser else {
            throw URLError (.badServerResponse)
        }
        try await user.updatePassword(to: password)
    }
}

// SIGN IN SSO
extension AuthenticationViewModel {
    
    @discardableResult
    func signInWithGoogle(tokens: UserGoogleAccount) async throws -> UserAccount {
        let credential = GoogleAuthProvider.credential(withIDToken: tokens.idToken, accessToken: tokens.accessToken)
        return try await signIn(credential: credential)
    }
    
    func signIn(credential: AuthCredential) async throws -> UserAccount {
        let authDataResult = try await Auth.auth().signIn(with: credential)
        return UserAccount(user: authDataResult.user)
    }
}
