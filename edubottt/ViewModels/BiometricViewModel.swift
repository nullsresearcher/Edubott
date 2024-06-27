import LocalAuthentication
import Foundation
import Combine

class BiometricViewModel: ObservableObject {
    private let context: LAContext
    
    @Published var isAuthenticated = false
    @Published var authenticationError: Error?
    
    init() {
        self.context = LAContext()
    }
    
    func authenticate() {
        var error: NSError?
        
        // Check if the device can evaluate the policy
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "For authentication"
            
            // Evaluate the policy
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { [weak self] success, authenticationError in
                DispatchQueue.main.async {
                    if success {
                        self?.isAuthenticated = true
                        print("unlock biometric")
                    } else {
                        self?.authenticationError = authenticationError
                        print(authenticationError ?? "error")
                    }
                }
            }
        } else {
            // Handle the case where biometrics are not available
            DispatchQueue.main.async {
                self.authenticationError = error
                print("Biometric authentication is not available: \(String(describing: error))")
            }
        }
    }
}
