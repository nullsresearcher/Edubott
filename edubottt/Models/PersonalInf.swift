//
//  PersonalInf.swift
//  edubottt
//
//  Created by Mochy on 2024-06-09.
//

import Foundation
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
    var isValid: Bool {
        validFirstName && validFirstName && !email.isEmpty && !password.isEmpty && isAgeGreaterThanSix && validEmail
    }
    var validFirstName: Bool {
        let nameRegex = "^[a-zA-Z]+$"
        let namePredicate = NSPredicate(format: "SELF MATCHES %@", nameRegex)
        return namePredicate.evaluate(with: firstName)
    }
    
    var validLastName: Bool {
        let nameRegex = "^[a-zA-Z]+$"
        let namePredicate = NSPredicate(format: "SELF MATCHES %@", nameRegex)
        return namePredicate.evaluate(with: lastName)
    }

    var isAgeGreaterThanSix: Bool {
        guard let minDOB = Calendar.current.date(byAdding: .year, value: -6, to: Date()) else {
            return false
        }
        return dob < minDOB
    }
    
    var validEmail: Bool {
        let emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/
        return email.contains(emailRegex)
    }
}
