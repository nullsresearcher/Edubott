//
//  SignUp.swift
//  edubottt
//
//  Created by Mochy on 2024-05-12.
//

import SwiftUI

struct SignUp: View {
    @EnvironmentObject var userInfViewModel: UserInfViewModel

    @State private var confirmPassword: String = ""
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""
    @State private var isValid: Bool = false
    
    var body: some View {
        NavigationStack {
            
            
            Form {
                Section(header: Text("Personal Information")) {
                    TextField("First Name", text: $userInfViewModel.userInf.personalInf.firstName)
                    TextField("Last Name", text: $userInfViewModel.userInf.personalInf.lastName)
                    TextField("Email", text: $userInfViewModel.userInf.personalInf.email)
                    SecureField("Password", text: $userInfViewModel.userInf.personalInf.password)
                    SecureField("Confirm Password", text: $confirmPassword)
                    DatePicker("Date of birth", selection: $userInfViewModel.userInf.personalInf.dob, displayedComponents: .date)
                        .datePickerStyle(CompactDatePickerStyle())
                    Picker("Gender", selection: $userInfViewModel.userInf.personalInf.gender) {
                        ForEach(PersonalInf.Gender.allCases, id: \.self) { gender in
                            Text(gender.rawValue)
                        }
                    }
                }

                Section(header: Text("Address Information")) {
                    TextField("Address", text: $userInfViewModel.userInf.addressInf.address)
                    TextField("City", text: $userInfViewModel.userInf.addressInf.city)
                    TextField("Province", text: $userInfViewModel.userInf.addressInf.state)
                    TextField("Country", text: $userInfViewModel.userInf.addressInf.country)
                    TextField("Postal Code", text: $userInfViewModel.userInf.addressInf.postalCode)
                }
            }
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button("Save") {
                        print("clicked")
                        if isValidSignIn(){
                            isValid = true
                            userInfViewModel.saveUserInf()
                        }
                    }
                    .alert(isPresented: $showAlert, content: {getAlert()})
                    .navigationDestination(isPresented: $isValid) {
                        MainView().environmentObject(UserRefViewModel())
                    }
                }
            }

        }
        .navigationTitle("Sign Up")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func isValidSignIn() -> Bool {
        if userInfViewModel.userInf.personalInf.firstName.isEmpty {
            alertMessage = "First name is required!"
            showAlert = true
            return false
        }
        
        if userInfViewModel.userInf.personalInf.lastName.isEmpty {
            alertMessage = "Last name is required!"
            showAlert = true
            return false
        }
        
        if userInfViewModel.userInf.personalInf.email.isEmpty {
            alertMessage = "Email is required!"
            showAlert = true
            return false
        }
        
        
        if userInfViewModel.userInf.personalInf.password != confirmPassword || confirmPassword.isEmpty {
            alertMessage = "Passwords must match and not be empty"
            showAlert = true
            return false
        }
        
        if let minDOB = Calendar.current.date(byAdding: .year, value: -6, to: Date()), userInfViewModel.userInf.personalInf.dob >= minDOB {
            alertMessage = "Sorry! The minimum age requirement is 6 years."
            showAlert = true
            return false
        }
        
        return true
    }
    
    func getAlert() -> Alert {
        Alert(title: Text(alertMessage))
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        let userInfViewModel = UserInfViewModel()
        return SignUp()
            .environmentObject(userInfViewModel)
    }
}



//        guard !userInfViewModel.userInf.addressInf.address.isEmpty else {
//            showAlert.toggle()
//            alertMessage = "Address is required!"
//            return false
//        }
//        guard !userInfViewModel.userInf.addressInf.city.isEmpty else {
//            showAlert.toggle()
//            alertMessage = "City is required!"
//            return false
//        }
//        guard !userInfViewModel.userInf.addressInf.state.isEmpty else {
//            showAlert.toggle()
//            alertMessage = "State is required!"
//            return false
//        }
//        guard !userInfViewModel.userInf.addressInf.country.isEmpty else {
//            showAlert.toggle()
//            alertMessage = "Country is required!"
//            return false
//        }
