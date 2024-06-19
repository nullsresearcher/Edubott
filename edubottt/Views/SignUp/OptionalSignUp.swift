//
//  SignUp.swift
//  edubottt
//
//  Created by Mochy on 2024-05-12.
//

import SwiftUI

struct OptionalSignUp: View {
    @EnvironmentObject var signUpViewModel: SignInViewModel
    
    @State private var confirmPassword: String = ""
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""
    @State private var isValid: Bool = false
    @State private var isFirstNameFocused: Bool = false
    @State private var isDOBFocused: Bool = false
    
    @Binding var showHomepage: Bool
    
    var body: some View {
        
        let userPersonalInf = $signUpViewModel.newUserInf.personalInf
        let userAddressInf = $signUpViewModel.newUserInf.addressInf
       
        VStack {
            Button(action: {
          
                print(signUpViewModel.newUserInf)
                print(signUpViewModel.userInfList)
                
                }, label: {
                    Text("Check")
                })
            NavigationStack {
                Form {
                    Section(header: Text("Personal Information")) {
                        TextField("First Name", text: userPersonalInf.firstName)
                            .onTapGesture {
                                self.isFirstNameFocused = true
                            }
                        WarningBox(condition: !signUpViewModel.newUserInf.personalInf.firstName.isEmpty && !signUpViewModel.newUserInf.personalInf.validFirstName, message: "Name must not contain the special character or numberic!")
                        
                            
                            
                        TextField("Last Name", text: userPersonalInf.lastName)
                        WarningBox(condition: !signUpViewModel.newUserInf.personalInf.lastName.isEmpty && !signUpViewModel.newUserInf.personalInf.validLastName, message: "Name must not contain the special character or numberic!")
                        
                        TextField("Email", text: userPersonalInf.email)
                        WarningBox(condition: !signUpViewModel.newUserInf.personalInf.email.isEmpty && !signUpViewModel.newUserInf.personalInf.validEmail, message: "Email is invalid. Please try again")
                        
                        SecureField("Password", text: userPersonalInf.password)
                        
                        SecureField("Confirm Password", text: $confirmPassword)
                        WarningBox(condition: !confirmPassword.isEmpty && signUpViewModel.newUserInf.personalInf.password != confirmPassword, message: "The password is not matched!")
                        
                        DatePicker("Date of birth", selection: userPersonalInf.dob, displayedComponents: .date)
                            .datePickerStyle(CompactDatePickerStyle())
                            .onTapGesture {
                                self.isDOBFocused = true
                            }
                        WarningBox(condition: isDOBFocused && !signUpViewModel.newUserInf.personalInf.isAgeGreaterThanSix, message: "The minimum age is greater than 6!")
                        
                        Picker("Gender", selection: userPersonalInf.gender) {
                            ForEach(PersonalInf.Gender.allCases, id: \.self) { gender in
                                Text(gender.rawValue)
                            }
                        }
                    }

                    Section(header: Text("Address Information")) {
                        TextField("Address", text: userAddressInf.address)
                        TextField("City", text: userAddressInf.city)
                        TextField("Province", text: userAddressInf.state)
                        TextField("Country", text: userAddressInf.country)
                        TextField("Postal Code", text: userAddressInf.postalCode)
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .bottomBar) {
                        Button("Save") {
                            print("clicked")
                            if signUpViewModel.newUserInf.isValid {
                                alertMessage = "You have signed up successfully!"
                                showAlert = true
                                isValid = true
                                signUpViewModel.saveNewUserInf()
                            }
                        }
                        .alert(isPresented: $showAlert, content: {getAlert()})
                        .navigationDestination(isPresented: $isValid) {
                            MainView(showHomePage: $showHomepage).environmentObject(UserRefViewModel())
                        }
                        .disabled(!signUpViewModel.newUserInf.isValid)
                    }
                }
            }
            .navigationTitle("Sign Up")
            .navigationBarTitleDisplayMode(.inline)
            .onTapGesture(count: 2) {
                self.collapseKeyboard()
            }
        }
    }
    
    private func collapseKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    private func getAlert() -> Alert {
        Alert(title: Text(alertMessage))
    }
}

struct WarningBox: View {
    let condition: Bool
    let message: String

    var body: some View {
        if condition {
            Text(message)
                .font(.caption)
                .italic()
                .foregroundStyle(.red.opacity(0.7))
                .multilineTextAlignment(.leading)
                
        }
    }
}


struct OptionalSignUp_Previews: PreviewProvider {
    @State static private var showHomePage = false
    
    static var previews: some View {
        let userInfViewModel = SignInViewModel()
        return SignUp(showHomePage: $showHomePage)
            .environmentObject(userInfViewModel)
    }
}



