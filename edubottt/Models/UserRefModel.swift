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
        UserRefModel(subjectDescription: Subject(category: .Science, 
                                                 dateCreated: Calendar.current.date(byAdding: .day, value: 46, to: Date())!),
                     questions: [
                        Question(question: "What is the chemical symbol for water?", 
                                 options: ["H2O","CO2","NaCl"],
                                 answers: ["H20"],
                                 keyWords: ["H20"],
                                 isCorrect: false),
                        Question(question: "Which element has the chemical symbol 'Na'?", 
                                 options: ["Nitrogen", "Sodium", "Nickel"],
                                 answers: ["Sodium"],
                                 keyWords: ["chemistry", "Na", "element"],
                                 isCorrect: false),
                        Question(question: "What is the pH value of a neutral solution?", 
                                 options: ["7", "5", "10"],
                                 answers: ["7"],
                                 keyWords: ["chemistry", "pH", "neutral"], 
                                 isCorrect: false)
                     ]),
        UserRefModel(subjectDescription: Subject(category: .Math, 
                                                 dateCreated: Calendar.current.date(byAdding: .day, value: 26, to: Date())!),
                     questions: [
                        Question(
                            question: "What is the square root of 16?", 
                            options: ["3", "4", "5"],
                            answers: ["4"],
                            keyWords: ["math", "square root"], 
                            isCorrect: false),
                        Question(question: "Solve for x: 3x - 2 = 10", 
                                 options: ["3", "4", "5"],
                                 answers: ["4"],
                                 keyWords: ["math", "equation"],
                                 isCorrect: false),
                        Question(question: "What is the value of π (pi) correct to two decimal places?", 
                                 options: ["3.14", "3.16", "3.18"],
                                 answers: ["3.14"],
                                 keyWords: ["math","pi"],
                                 isCorrect: false),
                        Question(question: "What is the area of a rectangle with length 6 units and width 4 units?", 
                                 options: ["20", "24", "30"],
                                 answers: ["24"],
                                 keyWords: ["math", "rectangle", "area"],
                                 isCorrect: false)
                     ]),
        UserRefModel(subjectDescription: Subject(category: .Math, 
                                                 dateCreated: Calendar.current.date(byAdding: .day, value: 15, to: Date())!),
                     questions: [
                        Question(question: "What is the square root of 25?", 
                                 options: ["3", "4", "5"],
                                 answers: ["5"],
                                 keyWords: ["math", "square root"],
                                 isCorrect: false),
                        Question(question: "Solve for x: 2x + 3 = 11", 
                                 options: ["3", "4", "5"],
                                 answers: ["4"],
                                 keyWords: ["math", "equation"],
                                 isCorrect: false),
                        Question(question: "What is the value of π (pi) correct to two decimal places?", 
                                 options: ["3.14", "3.16", "3.18"],
                                 answers: ["3.14"],
                                 keyWords: ["math", "pi"],
                                 isCorrect: false),
                        Question(
                            question: "What is the area of a triangle with base 6 units and height 8 units?",
                            options: ["24", "32", "48"],
                            answers: ["24"],
                            keyWords: ["math", "triangle", "area"],
                            isCorrect: false)
                     ]),
        UserRefModel(subjectDescription: Subject(category: .Physics, 
                                                 dateCreated: Calendar.current.date(byAdding: .day, value: 6, to: Date())!),
                     questions: [
                        Question(question: "What is Newton's first law of motion?", 
                                 options: [
                                    "An object in motion tends to stay in motion, and an object at rest tends to stay at rest unless acted upon by an external force.",
                                    "The force exerted by an object is equal to the mass of the object multiplied by its acceleration.",
                                    "For every action, there is an equal and opposite reaction."],
                                 answers: ["An object in motion tends to stay in motion, and an object at rest tends to stay at rest unless acted upon by an external force."],
                                 keyWords: ["physics", "Newton", "motion", "law"],
                                 isCorrect: false),
                        Question(question: "What is the SI unit of force?", 
                                 options: ["Watt", "Joule", "Newton"],
                                 answers: ["Newton"], 
                                 keyWords: ["physics", "force", "unit", "SI"],
                                 isCorrect: false),
                        Question(question: "What is the acceleration due to gravity on Earth's surface?", 
                                 options: ["9.8 m/s²", "6.67 x 10^-11 Nm²/kg²", "3 x 10^8 m/s"], 
                                 answers: ["9.8 m/s²"],
                                 keyWords: ["physics", "gravity", "acceleration", "Earth"], 
                                 isCorrect: false),
                        Question(question: "What is the formula to calculate kinetic energy?", 
                                 options: ["KE = 1/2 * m * v^2", "KE = m * g * h", "KE = F * d"], 
                                 answers: ["KE = 1/2 * m * v^2"],
                                 keyWords: ["physics", "kinetic energy", "formula", "velocity", "mass"], 
                                 isCorrect: false)
                     ]),
        UserRefModel(subjectDescription: Subject(category: .Biology, 
                                                 dateCreated: Calendar.current.date(byAdding: .day, value: 6, to: Date())!),
                     questions: [
                        Question(question: "What is the powerhouse of the cell?", 
                                 options: ["Ribosome", "Nucleus", "Mitochondria"],
                                 answers: ["Mitochondria"],
                                 keyWords: ["biology", "cell", "organelle", "mitochondria"],
                                 isCorrect: false),
                        Question(question: "What is the process by which plants make their own food?",
                                 options: ["Photosynthesis", "Respiration", "Transpiration"],
                                 answers: ["Photosynthesis"],
                                 keyWords: ["biology", "plants", "food", "photosynthesis"],
                                 isCorrect: false),
                        Question(question: "What is the smallest unit of life?", 
                                 options: ["Cell", "Atom", "Molecule"],
                                 answers: ["Cell"],
                                 keyWords: ["biology", "life", "unit", "cell"],
                                 isCorrect: false),
                        Question(question: "Which scientist is known as the father of modern genetics?", 
                                 options: ["Gregor Mendel", "Charles Darwin", "Louis Pasteur"],
                                 answers: ["Gregor Mendel"],
                                 keyWords: ["biology", "genetics", "scientist", "Mendel"],
                                 isCorrect: false)
                     ])
    ]

}
