//
//  MyCoursesView.swift
//  edubottt
//
//  Created by Mochy on 2024-06-18.
//

import SwiftUI

struct MyCoursesView: View {
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
                        NavigationLink( destination: ScanView()) {
                            CameraBtn(color: .black)
                        }
                    }
                }
            }
        }
    }
}

struct MyCourses_Previews: PreviewProvider {
    @EnvironmentObject private var userRefViewModel: UserRefViewModel
    static var previews: some View {
        MyCoursesView().environmentObject(UserRefViewModel())
    }
}
