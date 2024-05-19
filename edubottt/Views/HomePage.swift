//
//  HomePage.swift
//  edubottt
//
//  Created by Mochy on 2024-05-12.
//

import SwiftUI

struct HomePage: View {
    @StateObject var userInfViewModel: UserInfViewModel = UserInfViewModel()
    @StateObject var userRefViewModel: UserRefViewModel = UserRefViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("EASELY")
                    .font(.system(size: 72))
                    .padding(.top, 150)
                    .foregroundColor(.black)
                    .bold()
                
                Spacer(minLength: 150)
                
                VStack(spacing: 25) {
                    NavigationLink(destination: SignUp()
                                    .environmentObject(userInfViewModel)
                                    .environmentObject(userRefViewModel)) {
                        Btn(type: "SIGN UP")
                    }
                    
                    NavigationLink(destination: LogIn()
                                    .environmentObject(userInfViewModel)
                                    .environmentObject(userRefViewModel)) {
                        Btn(type: "LOG IN")
                    }
                    
                    Spacer(minLength: 10)
                }
            }
            .frame(width: 350)
            .navigationTitle("")
            .font(.title)
            .foregroundColor(.white)
           
        }
    }
}

struct Btn: View {
    let type: String
    let heightBtn: CGFloat = 60
    
    var body: some View {
        Text(type)
        .padding()
        .frame(maxWidth: .infinity)
        .frame(height: heightBtn)
        .background(Color.gray)
        .cornerRadius(10)
    }
}


struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        let userInfViewModel = UserInfViewModel()
        let userRefViewModel = UserRefViewModel()
        return HomePage()
            .environmentObject(userInfViewModel)
            .environmentObject(userRefViewModel)
    }
}
