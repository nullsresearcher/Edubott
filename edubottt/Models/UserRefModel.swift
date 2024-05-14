//
//  UserRefModel.swift
//  edubottt
//
//  Created by Mochy on 2024-05-13.
//

import Foundation
struct UserRefModel: Codable {
    var institutionName: String
    enum Subjects: String, Codable, CaseIterable {
        case Math = "Math"
        case Science = "Science"
        case History = "History"
        case Literature = "Literature"
        case Art = "Art"
        case Music = "Music"
        case Physics = "Physics"
        case Chemitry = "Chemistry"
        case Biology = "Biology"
    }
    
    static func addSubject(_ subject: String) {
        guard !Subjects.allCases.contains(where: { $0.rawValue == subject }) else {
            return
        }
        _ = Subjects(rawValue: subject)
    }

}
