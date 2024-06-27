//
//  KeyChainViewModel.swift
//  edubottt
//
//  Created by Mochy on 2024-06-26.
//

import Foundation
import KeychainSwift
import SwiftUI

class KeyChainViewModel: ObservableObject {
    let keychain: KeychainSwift
    
    init() {
        keychain = KeychainSwift()
        keychain.synchronizable = true
    }
    
    func get(key: String) -> String? {
        keychain.get(key)
    }
    
    func set(_ value: String, key: String) {
        keychain.set(value, forKey: key)
    }
}


