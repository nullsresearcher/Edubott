//
//  AddressInf.swift
//  edubottt
//
//  Created by Mochy on 2024-06-09.
//

import Foundation
struct AddressInf: Codable {
    var address: String
    var city: String
    var state: String
    var country: String
    var postalCode: String
    
    var isValid: Bool {
        !address.isEmpty && !city.isEmpty && !state.isEmpty && !country.isEmpty && !postalCode.isEmpty
    }
}
