//
//  HomePage.swift
//  edubottt
//
//  Created by Mochy on 2024-05-12.
//

import SwiftUI

struct HomePage: View {
    @StateObject var userInfViewModel: UserInfViewModel = UserInfViewModel()
    var body: some View {
        NavigationView {
            VStack {
                Text("EASELY")
                    .font(.system(size: 72))
                    .padding(.top, 150)
                
                Spacer(minLength: 350)
                
                VStack {
                    NavigationLink(destination: SignUp()) {
                        Text("SIGN UP")
                            .padding()
                            .foregroundColor(.white)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(Color.blue)
                    .cornerRadius(8)
                    
                    
                    NavigationLink(destination: Text("Detail View 2")) {
                        Text("LOG IN")
                            .padding()
                            .foregroundColor(.white)

                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(Color.blue)
                    .cornerRadius(8)
                    
                    Spacer(minLength: 10)
                }
            }
            .frame(width: 350)
            .navigationTitle("")
        }
    }
}


struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        let userInfViewModel = UserInfViewModel()
        return HomePage().environmentObject(userInfViewModel)
    }
}
