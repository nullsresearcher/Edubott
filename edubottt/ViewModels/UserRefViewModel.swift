//
//  UserRefViewModel.swift
//  edubottt
//
//  Created by Mochy on 2024-05-14.
//

import Foundation

class UserRefViewModel: ObservableObject {
    @Published var userRef = UserRefModel()
    private var userRefKey = "UserRef"
    
    init() {
//        getUserInf()\
        
    }
    
    func getUserInf() {
        guard let data = UserDefaults.standard.data(forKey: userRefKey),
              let savedUserInf = try? JSONDecoder().decode(UserRefModel.self, from: data)
        else { return }
        
        self.userRef = savedUserInf
    }
    
    func saveUserInf() {
        if let encodedData = try? JSONEncoder().encode(userRef){
            UserDefaults.standard.set(encodedData, forKey: userRefKey)
        }
    }
    
}
