//
//  WarningBox.swift
//  edubottt
//
//  Created by Mochy on 2024-06-21.
//

import SwiftUI

struct WarningBox: View {
    let condition: Bool
    let message: String

    var body: some View {
        if condition {
            Text(message)
                .font(.caption)
                .italic()
                .foregroundStyle(.red.opacity(0.7))
                .multilineTextAlignment(.leading)
                
        }
    }
}

#Preview {
    WarningBox(condition: true, message: "Warning box displays")
}
