//
//  Root.swift
//  edubottt
//
//  Created by Mochy on 2024-06-14.
//

import SwiftUI

struct Root: View {
    @State var showHomePage: Bool = true
    var body: some View {
        ZStack {
            NavigationStack{
                MainView(showHomePage: $showHomePage)
            }
        }
        .onAppear {
            let authUser = try? AuthenticationViewModel.shared.getAuthenticatedUser()
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
