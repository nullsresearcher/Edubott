//
//  MainView.swift
//  edubottt
//
//  Created by Mochy on 2024-05-14.
//

import SwiftUI

struct MainView: View {
    @Binding var showHomePage: Bool
    @Binding var email: String
    @StateObject var userInfController:  UserInfViewModel
    
    init(showHomePage: Binding<Bool>, email: Binding<String>) {
            self._showHomePage = showHomePage
            self._email = email
            self._userInfController = StateObject(wrappedValue: UserInfViewModel(email: email.wrappedValue))
    }
    
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
                .environmentObject(userInfController)
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
    @State static private var showHomePage = false
    @State static private var email = "example@exp.com"
    
    static var previews: some View {
        MainView(showHomePage: $showHomePage, email: $email)
    }
}

