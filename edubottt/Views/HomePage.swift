//
//  HomePage.swift
//  edubottt
//
//  Created by Mochy on 2024-05-12.
//

import SwiftUI

struct HomePage: View {
    @StateObject var userInfViewModel: UserInfViewModel = UserInfViewModel()
    let heightBtn: CGFloat = 70
    var body: some View {
        NavigationView {
            VStack {
                Text("EASELY")
                    .font(.system(size: 72))
                    .padding(.top, 150)
                    .foregroundColor(.black)
                
                Spacer(minLength: 350)
                
                VStack(spacing: 25) {
                    NavigationLink(destination: SignUp()) {
                        Text("SIGN UP")
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: heightBtn)
                    .background(Color.blue)
                    .cornerRadius(8)
                    
                    
                    NavigationLink(destination: LogIn()) {
                        Text("LOG IN")
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: heightBtn)
                    .background(Color.blue)
                    .cornerRadius(8)
                    
                    Spacer(minLength: 10)
                }
            }
            .frame(width: 350)
            .navigationTitle("")
            .font(.title)
            .foregroundColor(.white)
            .fontWeight(.bold)
        }
    }
}


struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        let userInfViewModel = UserInfViewModel()
        return HomePage().environmentObject(userInfViewModel)
    }
}
