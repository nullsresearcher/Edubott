//
//  Item.swift
//  edubottt
//
//  Created by Mochy on 2024-05-12.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
