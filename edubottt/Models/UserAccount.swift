//
//  UserAccount.swift
//  edubottt
//
//  Created by Mochy on 2024-06-12.
//

import Foundation
import FirebaseAuth

struct UserAccount {
    let uid: String
    let email: String?
    let photoUrl: String?
    
    init(user: User) {
        self.uid = user.uid
        self.email = user.email
        self.photoUrl = user.photoURL?.absoluteString
    }
}
