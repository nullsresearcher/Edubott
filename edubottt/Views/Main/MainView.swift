//
//  MainView.swift
//  edubottt
//
//  Created by Mochy on 2024-05-14.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject private var userRefViewModel: UserRefViewModel
    @StateObject private var model = ScanDocumentViewModel()
    var body: some View {
        let columns = [GridItem(), GridItem()]
        
        VStack {
            NavigationStack {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach( userRefViewModel.filteredSubjectCategory(), id: \.self ) { subject in
                            NavigationLink( destination: SubjectDetailView( subjectName: subject, filteredUserRefs: userRefViewModel.filteredUserRef(category: subject ))) {
                                SubjectView(subject: subject)
                            }
                        }
                    }
                    .padding(.top, 40)
                }
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle("My Courses")
                .toolbar {
                    
                    ToolbarItem(placement: .bottomBar) {
                        NavigationLink( destination: ScanCameraView()) {
                            CameraBtn(color: .white)
                        }
                    }
                }
            }
        }
    }
}

struct CameraBtn: View {
    let color: Color
    var body: some View {
        ZStack {
            Circle()
                .fill(color.opacity(0.8))
                .frame(width: 65, height: 65)

            Circle()
                .stroke(color, lineWidth: 2)
                .frame(width: 75, height: 75)
        }
    }
}

struct SubjectView: View {
    let subject: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 180, height: 100)
                .cornerRadius(10)
                .foregroundColor(.gray.opacity(0.7))
                .shadow(color: Color.black.opacity(0.5),radius: 10, x:0, y: 10)
            Text(subject)
                .frame(width: 100, height: 25)
                .font(.title)
                .foregroundColor(.white)
        }.padding(.horizontal)
    }
}

struct MainView_Previews: PreviewProvider {
    @EnvironmentObject private var userRefViewModel: UserRefViewModel
    static var previews: some View {
        MainView().environmentObject(UserRefViewModel())
    }
}
