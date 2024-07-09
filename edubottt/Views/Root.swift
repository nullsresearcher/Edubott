//
//  Root.swift
//  edubottt
//
//  Created by Mochy on 2024-06-14.
//

import SwiftUI

struct Root: View {
    @State var showHomePage: Bool = true
    @State var email: String = ""
    var body: some View {
        ZStack {
            NavigationStack{
                MainView(showHomePage: $showHomePage, email: $email)
            }
        }
        .onAppear {
            let authUser = try? AuthenticationViewModel.shared.getAuthenticatedUser()
            email = authUser?.email ?? ""
            self.showHomePage = authUser == nil
        }
        .fullScreenCover(isPresented: $showHomePage, content: {
            NavigationStack {
                HomePage(showHomePage: $showHomePage)
            }
        })
    }
}

#Preview {
    Root()
}
