import SwiftUI
import GoogleSignIn
import GoogleSignInSwift

struct HomePage: View {
    @State private var showSignInView: Bool = false
    @StateObject private var googleController = GoogleAuthenticationViewModel()
    @Binding var showHomePage: Bool
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("EASELY")
                    .font(.system(size: 72))
                    .padding(.top, 150)
                    .foregroundColor(.black)
                    .bold()
                
                Spacer(minLength: 125)
                
                VStack(spacing: 25) {
                    NavigationLink(destination: SignUp(showHomePage: $showHomePage)
               
                        .onAppear {
                            
                        }) {
                            Btn(type: "SIGN UP")
                        }
                    
                    NavigationLink(destination: SignIn(showHomePage: $showHomePage)) {
                            Btn(type: "SIGN IN")
                        }
                    
                    
                    GoogleSignInButton(viewModel: GoogleSignInButtonViewModel(scheme: .light, style: .icon, state: .normal), action: {
                        Task {
                            do {
                                try await googleController.signInGoogle()
                                showSignInView = false
                            }
                            catch {
                                print(error)
                            }
                        }
                    })
                    
                    Spacer(minLength: 10)
                }
            }
            .frame(width: 350)
            .navigationBarTitleDisplayMode(.inline)
            .font(.title)
            .foregroundColor(.white)
            
        }
    }
}




struct HomePage_Previews: PreviewProvider {
    @State static private var showHomePage = false
    static var previews: some View {
        HomePage(showHomePage: $showHomePage)
    }
}
