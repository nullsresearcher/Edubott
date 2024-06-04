//
//  ScanDataModel.swift
//  edubottt
//
//  Created by Mochy on 2024-05-28.
//

import Foundation

/// Nhu nay goi la document ne
/// Model representing scan data.
struct ScanData:Identifiable {
    var id = UUID()
    let content:String

    /// Initializes a new scan data model.
    /// - Parameters:
    ///  ... constructor hong co, voi hong dung data thi dat ga chi z
        self.content = content
    }
}
