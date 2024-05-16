//
//  UserRefViewModel.swift
//  edubottt
//
//  Created by Mochy on 2024-05-14.
//

import Foundation

class UserRefViewModel: ObservableObject {
    @Published var userRefs = UserRefModel.test
    
    private var userRefKey = "UserRef"
    
    init() {
        
    }
    
    func filteredUserRef(catefory: String) -> [UserRefModel] {
        var filteredUserRefs = [UserRefModel]()
        for userRef in userRefs {
            if userRef.subjectDescription.category.rawValue == catefory {
                filteredUserRefs.append(userRef)
            }
        }
        return filteredUserRefs
    }
    
    func filteredSubjectCategory() -> [String] {
        var listSubjectCategory: [String] = []
        
        for userRef in userRefs {
            let subjectName = userRef.subjectDescription.category.rawValue
            
            if !listSubjectCategory.contains(subjectName) {
                listSubjectCategory.append(subjectName)
            }
        }
        return listSubjectCategory
    }
    
}
