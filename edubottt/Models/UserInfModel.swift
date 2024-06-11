//
//  UserInf.swift
//  edubottt
//
//  Created by Mochy on 2024-05-12.
//

import Foundation

struct UserInfModel: Codable {
    var personalInf: PersonalInf
    var addressInf: AddressInf
    
    init() {
        self.personalInf = PersonalInf(firstName: "", lastName: "", email: "", password: "", dob: Date(), gender: .Female)
        self.addressInf = AddressInf(address: "", city: "", state: "", country: "", postalCode: "")
    }
    var isValid: Bool {
        return personalInf.isValid && addressInf.isValid
    }
}






