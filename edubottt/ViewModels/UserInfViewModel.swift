import Foundation

class UserInfViewModel: ObservableObject {
    @Published var email: String
    @Published var currentUserInf: UserInfModel
    private var userInfList: [UserInfModel]
    private let userInfKey = "UserInf"
    var currentIndex: Int = 0
    
        
    init(email: String) {
        self.email = email
        self.userInfList = []
        self.currentUserInf = UserInfModel()
        self.getUserInf(email: email)
    }
    
    func getUserInf(email: String) {
        guard let data = UserDefaults.standard.data(forKey: userInfKey),
              let savedUserInfList = try? JSONDecoder().decode([UserInfModel].self, from: data) else {
            self.userInfList = [UserInfModel()]
            return
        }
        self.userInfList = savedUserInfList
        
        for userInf in self.userInfList {
            if userInf.personalInf.email == email {
                return self.currentUserInf = userInf
            }
        }
        
    }
    
    func saveUserInf() {
        if let encodedData = try? JSONEncoder().encode(userInfList) {
            UserDefaults.standard.set(encodedData, forKey: userInfKey)
        }
    }
    
    func del() {
        self.userInfList = []
        saveUserInf()
    }
}


