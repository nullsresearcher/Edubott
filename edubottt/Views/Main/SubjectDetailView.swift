//
//  SubjectDetailView.swift
//  edubottt
//
//  Created by Mochy on 2024-05-14.
//

import SwiftUI
import Foundation

func formattedDate(date: Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .medium
    return dateFormatter.string(from: date)
}

struct SubjectDetailView: View {
    let subjectName: String
    let filteredUserRefs: [UserRefModel]
    let columns = [GridItem(), GridItem()]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(filteredUserRefs) { subject in
                        NavigationLink(destination: QuizView(subject: subject)) {
                            DatedSubject(date: subject.subjectDescription.dateCreated)
                        }
                    }
                }
            }
            .padding()
            .navigationTitle(subjectName.uppercased())
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct DatedSubject: View {
    let date: Date
    
    var body: some View {
        let formattedDate = formattedDate(date: date)
        ZStack {
            Rectangle()
                .frame(width: 180, height: 150)
                .cornerRadius(10)
                .foregroundColor(.gray.opacity(0.7))
                .shadow(color: Color.black.opacity(0.5), radius: 10, x: 0, y: 10)
                .padding(.vertical, 10)
            
            VStack {
                
                Text(formattedDate)
                    .padding(.bottom, 15)
                    .italic()
                Text("START NOW")
                    .padding()
                    .fontWeight(.bold)
                    .background(Color.yellow)
                    .cornerRadius(8)
            }
            .foregroundColor(.white)
        }
        .padding(.horizontal)
    }
}

struct SubjectDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let userRefViewModel = UserRefViewModel()
        let sampleUserRefs: [UserRefModel] = userRefViewModel.filteredUserRef(category: "Math")
        return SubjectDetailView(subjectName: "Math", filteredUserRefs: sampleUserRefs)
            .environmentObject(userRefViewModel)
    }
}
