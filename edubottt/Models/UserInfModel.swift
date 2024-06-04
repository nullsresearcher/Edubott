//
//  UserInf.swift
//  edubottt
//
//  Created by Mochy on 2024-05-12.
//

/// Lam gi trong z

import Foundation

struct UserInfModel: Codable {
    var personalInf: PersonalInf
    var addressInf: AddressInf
    
    init() {
        self.personalInf = PersonalInf(firstName: "", lastName: "", email: "", password: "", dob: Date(), gender: .Female)
        self.addressInf = AddressInf(address: "", city: "", state: "", country: "", postalCode: "")
    }
}

/// them validate() ... cac thu

struct PersonalInf: Codable {
    var firstName: String
    var lastName: String
    var email: String
    var password: String
    var dob: Date
    var gender: Gender
    
    enum Gender: String, Codable, CaseIterable {
        case Female = "Female"
        case Male = "Male"
        case Others = "Others"
    }
}

struct AddressInf: Codable {
    var address: String
    var city: String
    var state: String
    var country: String
    var postalCode: String
}
