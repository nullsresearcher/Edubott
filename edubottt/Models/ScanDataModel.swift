//
//  ScanDataModel.swift
//  edubottt
//
//  Created by Mochy on 2024-05-28.
//

import Foundation

struct ScanData:Identifiable {
    var id = UUID()
    let content:String
    
    init(content:String) {
        self.content = content
    }
}
