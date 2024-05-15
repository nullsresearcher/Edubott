//
//  UserRefModel.swift
//  edubottt
//
//  Created by Mochy on 2024-05-13.
//

import Foundation


struct UserRefModel: Identifiable, Codable {
    var id = UUID()
    
    var subjectName: Subject
    var questions: [Question]
    
    enum Subject: String, Codable, CaseIterable {
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
        guard !Subject.allCases.contains(where: { $0.rawValue == subject }) else {
            return
        }
        _ = Subject(rawValue: subject)
    }

}
struct Question: Codable {
    var question: String
    var options: [String]
    var answers: [String]
    var keyWords: [String]
    var isCorrect: Bool
    var dateCreated: Date
}
