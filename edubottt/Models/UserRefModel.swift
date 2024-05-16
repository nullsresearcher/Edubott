//
//  UserRefModel.swift
//  edubottt
//
//  Created by Mochy on 2024-05-13.
//

import Foundation

struct UserRefModel: Identifiable, Codable {
    var id = UUID()
    
    var subjectDescription: Subject
    var questions: [Question]
    
}
struct Subject: Codable {
    var category: Category
    var dateCreated: Date
    
    enum Category: String, Codable, CaseIterable {
        case Math = "Math"
        case Science = "Science"
        case History = "History"
        case Literature = "Literature"
        case Art = "Art"
        case Physics = "Physics"
        case Chemitry = "Chemistry"
        case Biology = "Biology"
    }
    
    static func addSubject(_ subject: String) {
        guard !Category.allCases.contains(where: { $0.rawValue == subject }) else {
            return
        }
        _ = Category(rawValue: subject)
    }
}
struct Question: Codable {
    var question: String
    var options: [String]
    var answers: [String]
    var keyWords: [String]
    var isCorrect: Bool
}

extension UserRefModel {
    static let test: [UserRefModel] = [
        UserRefModel(subjectDescription: Subject(category: .Science, dateCreated: Date()),
                     questions: [
                        Question(question:  "What is the chemical symbol for water?", options: ["H2O","CO2","NaCl"], answers: ["H20"], keyWords: ["H20"], isCorrect: false),
                        Question(question: "Which element has the chemical symbol 'Na'?", options: ["Nitrogen", "Sodium", "Nickel"], answers: ["Sodium"], keyWords: ["chemistry", "Na", "element"], isCorrect: false),
                        Question(question: "What is the pH value of a neutral solution?", options: ["7", "5", "10"], answers: ["7"], keyWords: ["chemistry", "pH", "neutral"], isCorrect: false)
                     ]
                    ),
        UserRefModel(subjectDescription: Subject(category: .Math, dateCreated: Date()),
                     questions: [
                        Question(question: "What is the square root of 16?", options: ["3", "4", "5"], answers: ["4"], keyWords: ["math", "square root"], isCorrect: false),
                        Question(question: "Solve for x: 3x - 2 = 10", options: ["3", "4", "5"], answers: ["4"], keyWords: ["math", "equation"], isCorrect: false),
                        Question(question: "What is the value of π (pi) correct to two decimal places?", options: ["3.14", "3.16", "3.18"], answers: ["3.14"], keyWords: ["math","pi"], isCorrect: false),
                        Question(question: "What is the area of a rectangle with length 6 units and width 4 units?", options: ["20", "24", "30"], answers: ["24"], keyWords: ["math", "rectangle", "area"], isCorrect: false)
                     ]
                    ),
        UserRefModel(subjectDescription: Subject(category: .Math, dateCreated: Date()), questions: [
                    Question(question: "What is the square root of 25?", options: ["3", "4", "5"], answers: ["5"], keyWords: ["math", "square root"], isCorrect: false),
                    Question(question: "Solve for x: 2x + 3 = 11", options: ["3", "4", "5"], answers: ["4"], keyWords: ["math", "equation"], isCorrect: false),
                    Question(question: "What is the value of π (pi) correct to two decimal places?", options: ["3.14", "3.16", "3.18"], answers: ["3.14"], keyWords: ["math", "pi"], isCorrect: false),
                    Question(question: "What is the area of a triangle with base 6 units and height 8 units?", options: ["24", "32", "48"], answers: ["24"], keyWords: ["math", "triangle", "area"], isCorrect: false)
                ])
        
    ]
}
