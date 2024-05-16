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
    
    
    func updateUserInf(firstName: String, lastName: String, email: String, password: String, dob: Date, gender: PersonalInf.Gender, address: String, city: String, state: String, country: String, postalCode: String) {
        userInf.personalInf = PersonalInf(firstName: firstName, lastName: lastName, email: email, password: password, dob: dob, gender: gender)
        userInf.addressInf = AddressInf(address: address, city: city, state: state, country: country, postalCode: postalCode)
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
