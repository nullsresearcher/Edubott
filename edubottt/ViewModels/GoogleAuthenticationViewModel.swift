//
//  GoogleAuthenticationViewModel.swift
//  edubottt
//
//  Created by Mochy on 2024-06-14.
//

import Foundation
import GoogleSignIn
import GoogleSignInSwift
import FirebaseAuth

class GoogleAuthenticationViewModel: ObservableObject {
    
    
    func signInGoogle() async throws {
        guard let topVC = await Utilities.shared.topViewController() else {
            throw URLError(.cannotFindHost)
        }
        
        let gidSignInResult = try await GIDSignIn.sharedInstance.signIn(withPresenting: topVC)
        
        guard let idToken: String = gidSignInResult.user.idToken?.tokenString else {
            throw URLError(.badServerResponse)
        }
        
        let accessToken: String = gidSignInResult.user.accessToken.tokenString
        let tokens = UserGoogleAccount(idToken: idToken, accessToken: accessToken)
        try await AuthenticationViewModel.shared.signInWithGoogle(tokens: tokens)
        
    }
}
