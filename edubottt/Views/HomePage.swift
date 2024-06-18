import SwiftUI
import GoogleSignIn
import GoogleSignInSwift

struct HomePage: View {
    @StateObject var signUpViewModel = SignInViewModel()
    @StateObject var logInViewModel = LogInViewModel()
    @State private var showSignInView: Bool = false
    @StateObject private var googleController = GoogleAuthenticationViewModel()
    
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
                    NavigationLink(destination: SignUp()
                        .environmentObject(signUpViewModel)
                        .onAppear {
                            signUpViewModel.generateNewUser()
                        }) {
                            Btn(type: "SIGN UP")
                        }
                    
                    NavigationLink(destination: SignIn()
                        .environmentObject(logInViewModel)) {
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

struct Btn: View {
    let type: String
    let heightBtn: CGFloat = 60
    
    var body: some View {
        Text(type)
            .padding()
            .frame(maxWidth: .infinity)
            .frame(height: heightBtn)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
    }
}


struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
