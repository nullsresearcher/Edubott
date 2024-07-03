//
//  PersonalInfView.swift
//  edubottt
//
//  Created by Mochy on 2024-06-21.
//

import SwiftUI

struct PersonalInfView: View {
    @EnvironmentObject var controler : UserInfViewModel
    
    
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""
    @State private var isValid: Bool = false
    @State private var isFirstNameFocused: Bool = false
    @State private var isDOBFocused: Bool = false
    
    var body: some View {
        let userPersonalInf = $controler.newUserInf.personalInf
        
        NavigationStack {
            Form {
                Section(header: Text("Personal Information")) {
                    TextField("First Name", text: userPersonalInf.firstName)
                    WarningBox(condition: !controler.newUserInf.personalInf.firstName.isEmpty && !controler.newUserInf.personalInf.validFirstName, message: "Name must not contain the special character or numberic!")
                    
                    TextField("Last Name", text: userPersonalInf.lastName)
                    WarningBox(condition: !controler.newUserInf.personalInf.lastName.isEmpty && !controler.newUserInf.personalInf.validLastName, message: "Name must not contain the special character or numberic!")
                    
                    TextField("Email", text: userPersonalInf.email)
                        .disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                    
                    
                    DatePicker("Date of birth", selection: userPersonalInf.dob, displayedComponents: .date)
                        .datePickerStyle(CompactDatePickerStyle())
                        .onTapGesture {
                            self.isDOBFocused = true
                        }
                    WarningBox(condition: isDOBFocused && !controler.newUserInf.personalInf.isAgeGreaterThanSix, message: "The minimum age is greater than 6!")
                    
                    Picker("Gender", selection: userPersonalInf.gender) {
                        ForEach(PersonalInf.Gender.allCases, id: \.self) { gender in
                            Text(gender.rawValue)
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button("Save") {
                        
                    }
                    .alert(isPresented: $showAlert, content: {getAlert()})
                    
                }
        }
        .navigationTitle("Personal Information")
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

struct PersonalInf_Previews: PreviewProvider {
  
    @State static private var showHomePage = false
    
    static var previews: some View {
       
        return PersonalInfView()
            .environmentObject(UserInfViewModel())
    }
}
