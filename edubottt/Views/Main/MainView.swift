//
//  MainView.swift
//  edubottt
//
//  Created by Mochy on 2024-05-14.
//

import SwiftUI

struct MainView: View {
    @Binding var showHomePage: Bool
    var body: some View {
        TabView {
            MyCoursesView()
                .tabItem {
                    Label("Courses", systemImage: "book.fill")
                }
            SettingView(showHomepage: $showHomePage)
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }
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
    @EnvironmentObject var userRefViewModel: UserRefViewModel
    @State static private var showHomePage = false
    static var previews: some View {
        MainView(showHomePage: $showHomePage).environmentObject(UserRefViewModel())
    }
}
