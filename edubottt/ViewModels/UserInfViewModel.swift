import Foundation

class UserInfViewModel: ObservableObject {
    @Published var userInfList: [UserInfModel] = [UserInfModel()]
    @Published var newUserInf: UserInfModel
    @Published var currentUserInf : UserInfModel = UserInfModel()
    var currentIndex : Int = 0
    
    private var userInfKey = "UserInf"
    
    init() {
        newUserInf = UserInfModel()
        self.getUserInf()
    }
    
    func getUserInf() {
        guard let data = UserDefaults.standard.data(forKey: userInfKey),
              let savedUserInfList = try? JSONDecoder().decode([UserInfModel].self, from: data) else {
            self.userInfList = [UserInfModel()]
            return
        }
        
        self.userInfList = savedUserInfList
    }
    
    func saveUserInf() {
        if let encodedData = try? JSONEncoder().encode(userInfList) {
            UserDefaults.standard.set(encodedData, forKey: userInfKey)
        }
    }
    
    func updatePassword(newPassword: String) {
        userInfList[currentIndex].personalInf.password = newPassword
        saveUserInf()
    }
    
    func del() {
        self.userInfList = []
        saveUserInf()
    }
}

class SignInViewModel : UserInfViewModel {
    
    func generateNewUser() -> Void {
        newUserInf = UserInfModel()
    }
    
    func saveNewUserInf() -> Void {
        for userInf in userInfList {
            if newUserInf.personalInf.email == userInf.personalInf.email{
                print("Email is already taken!")
                return
            }
        }
        guard newUserInf.isValid else {
            print("UserInfModel is not valid")
            return
        }
        userInfList.append(newUserInf)
        saveUserInf()
        newUserInf = UserInfModel()
    }
    
}

class LogInViewModel : UserInfViewModel {
    
    func isValidLogIn(email: String, password: String) -> Bool {
        for index in 0..<userInfList.count {
            print(userInfList[index])
            if userInfList[index].personalInf.email.lowercased() == email.lowercased() && userInfList[index].personalInf.password == password {
                currentUserInf = userInfList[index]
                currentIndex = index
                return true
            }
        }
        return false
    }
}
