//
//  QuizView.swift
//  edubottt
//
//  Created by Mochy on 2024-05-16.
//

import SwiftUI


// Main QuizView
struct QuizView: View {
    let subject: UserRefModel
    @State private var currentIndex: Int = 0
    
    var body: some View {
        let columns = [GridItem(), GridItem()]
        
        VStack {
            Text(subject.questions[currentIndex].question)
                .font(.headline)
                .padding()
            
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(subject.questions[currentIndex].options, id: \.self) { option in
                    OptionView(option: option)
                }
            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Question \(currentIndex + 1)")
        
    }
}

// OptionView
struct OptionView: View {
    let option: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 180, height: 100)
                .cornerRadius(10)
                .foregroundColor(.gray.opacity(0.7))
                .shadow(color: Color.black.opacity(0.5), radius: 10, x: 0, y: 10)
            
            Text(option)
                .frame(width: 160, height: 100, alignment: .center)
                .font(.title2)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
        }
        .padding(.horizontal)
    }
}

struct Quiz_Previews: PreviewProvider {
    static var previews: some View {
        let userRefViewModel = UserRefViewModel()
        let sampleUserRef: UserRefModel = userRefViewModel.filteredUserRef(category: "Math")[0]
        return QuizView(subject: sampleUserRef)
    }
}

