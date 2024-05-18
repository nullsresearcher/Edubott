//
//  UserInfViewModel.swift
//  edubottt
//
//  Created by Mochy on 2024-05-12.
//

import Foundation
class UserInfViewModel: ObservableObject {
    @Published var userInf = UserInfModel()
    private var userInfKey = "UserInf"
    
    init() {
        getUserInf()
    }
    
    func getUserInf() {
        guard let data = UserDefaults.standard.data(forKey: userInfKey),
              let savedUserInf = try? JSONDecoder().decode(UserInfModel.self, from: data)
        else {
            userInf.personalInf = PersonalInf(firstName: "", lastName: "", email: "", password: "", dob: Date(), gender: .Female)
            userInf.addressInf = AddressInf(address: "", city: "", state: "", country: "", postalCode: "")
            return
        }
        
        self.userInf = savedUserInf
    }
    
    func updatePassword(newPassword: String) {
        userInf.personalInf.password = newPassword
        saveUserInf()
    }
    
    func getRegisteredEmail() -> String? {
        getUserInf() 
        return userInf.personalInf.email
    }

    
    func saveUserInf() {
        if let encodedData = try? JSONEncoder().encode(userInf){
            UserDefaults.standard.set(encodedData, forKey: userInfKey)
        }
    }
}
