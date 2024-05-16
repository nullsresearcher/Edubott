//
//  SignUp.swift
//  edubottt
//
//  Created by Mochy on 2024-05-12.
//

import SwiftUI

struct SignUp: View {
    @EnvironmentObject var userInfViewModel: UserInfViewModel
    @State private var firstPassword: String = ""
    @State private var secondPassword: String = ""
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""
    @State private var isValid: Bool = false
 
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Personal Information")) {
                    TextField("First Name", text: $userInfViewModel.userInf.personalInf.firstName)
                    TextField("Last Name", text: $userInfViewModel.userInf.personalInf.lastName)
                    TextField("Email", text: $userInfViewModel.userInf.personalInf.email)
                    SecureField("Password", text: $firstPassword)
                    SecureField("Confirm Password", text: $secondPassword)
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
            .padding()
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button("Next") {
                        if isValidSignIn() {
                            userInfViewModel.updateUserInf(
                                firstName: userInfViewModel.userInf.personalInf.firstName,
                                lastName: userInfViewModel.userInf.personalInf.lastName,
                                email: userInfViewModel.userInf.personalInf.email,
                                password: firstPassword,
                                dob: userInfViewModel.userInf.personalInf.dob,
                                gender: userInfViewModel.userInf.personalInf.gender,
                                address: userInfViewModel.userInf.addressInf.address,
                                city: userInfViewModel.userInf.addressInf.city,
                                state: userInfViewModel.userInf.addressInf.state,
                                country: userInfViewModel.userInf.addressInf.country,
                                postalCode: userInfViewModel.userInf.addressInf.postalCode
                            )
                            isValid = true
                            print("Sign up successfully")
                        }
                    }
                    .disabled(!isValidSignIn())
                    .alert(isPresented: $showAlert, content: getAlert)
                    .background(
                        EmptyView()
                            .navigationDestination(isPresented: $isValid) {
                                MainView().environmentObject(UserInfViewModel())
                            }
                    )
                }
            }
        }.navigationTitle("Sign Up")
    }
    
    
    func isValidSignIn() -> Bool {
        guard !userInfViewModel.userInf.personalInf.firstName.isEmpty else {
            showAlert.toggle()
            alertMessage = "First name is required!"
            return false
        }
        
        guard !userInfViewModel.userInf.personalInf.lastName.isEmpty else {
            showAlert.toggle()
            alertMessage = "Last name is required!"
            return false
        }
        guard !userInfViewModel.userInf.personalInf.email.isEmpty else {
            showAlert.toggle()
            alertMessage = "Email is required!"
            return false
        }
        if let registeredEmail = userInfViewModel.getRegisteredEmail(), !registeredEmail.isEmpty {
            if userInfViewModel.userInf.personalInf.email == registeredEmail {
                showAlert.toggle()
                alertMessage = "This email is already registered!"
                return false
            }
        }
        guard firstPassword == secondPassword && !firstPassword.isEmpty else {
            showAlert.toggle()
            alertMessage = "Passwords must match and not be empty"
            return false
        } 
        guard let minDOB = Calendar.current.date(byAdding: .year, value: -6, to: Date()),
              userInfViewModel.userInf.personalInf.dob < minDOB else {
            showAlert.toggle()
            alertMessage = "Sorry! The minimum age requirement is 6 years."
            return false
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
        
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertMessage))
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        let userInfViewModel = UserInfViewModel()
        return SignUp().environmentObject(userInfViewModel)
    }
}


