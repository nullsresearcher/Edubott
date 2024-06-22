//
//  Btn.swift
//  edubottt
//
//  Created by Mochy on 2024-06-21.
//

import SwiftUI

struct Btn: View {
    let type: String
    let heightBtn: CGFloat = 60
    
    var body: some View {
        Text(type)
            .padding()
            .frame(maxWidth: .infinity)
            .frame(height: heightBtn)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
    }
}

#Preview {
    Btn(type: "Hello world")
}
