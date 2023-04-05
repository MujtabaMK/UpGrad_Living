//
//  ParentsDetailsView.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 30/03/23.
//

import SwiftUI
import Combine

struct ParentsDetailsView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var viewModel = ParentContentViewModel()
    @StateObject private var submitViewModel = SubmitParentViewModel()
    @StateObject private var GetViewModel = GetFormViewModel()
    @State private var borderColor = Color(hex: 0x00B2BA)
    @State private var canEditCurrentCountry = false
    @State private var canEditCurrentState = false
    @State private var canEditCurrentCity = false
    
    @StateObject private var masterViewModel = MasterViewModel()
    @StateObject private var countryViewModel = CountryViewModel()
    @State private var arrCountry = [countries]()
    @State private var arrStateCurrent = [states]()
    @State private var arrCityCurrent = [City]()
    
    @State private var currentCountryID = ""
    @State private var currentStateId = ""
    @State private var currentCityId = ""
    
    //Current
    @State private var searchTextCurrentCountry = ""
    @State private var ShowCurrentCountryDropDown = false
    
    @State private var searchTextCurrentState = ""
    @State private var ShowCurrentStateDropDown = false
    
    @State private var searchTextCurrentCity = ""
    @State private var ShowCurrentCityDropDown = false
    
    @State private var showEnrollmentDetails = false
    
    @State private var alertMessage = String()
    @State private var showingAlert = false
    @State private var AlertShow = String()
    
    @State private var isButtonClick = false
    
    @State private var studentAppID = UserDefaults.standard.string(forKey: "studentAppID")
    @FocusState private var focusedField: FoucesedParentTextField?
        
    var getIsEditable: String
    var body: some View {
        NavigationView {
            ZStack{
                VStack{
                    HStack{
                        Button {
                            withAnimation() {
                                presentationMode.wrappedValue.dismiss()
                            }
                        } label: {
                            Image("back_Button")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                                .padding(.leading, 20)
                        }
                        Spacer(minLength: 0)
                    }
                    .padding(.top)
                    Divider()
                    ScrollView(showsIndicators: false){
                        DetailsViewTop(Step: "2")
                            .padding(.bottom)
                            .id(1)
                        //Father
                        VStack(alignment: .leading){
                            //Father First Name
                            MaterialDesignTextField($viewModel.textFatherFirstName,
                                                    placeholder: viewModel.placeholderFatherFirstName,
                                                    hint: $viewModel.hintFatherFirstName,
                                                    editing: $editingTextFieldFatherFirstName,
                                                    valid: $viewModel.textFatherFirstNameValid,
                                                    BorderColor: $borderColor,
                                                    placeholderImage: .constant("person"))
                            .focused($focusedField, equals: .fFirstName)
                            .disableAutocorrection(true)
                            .onChange(of: viewModel.textFatherFirstName, perform: { newValue in
                                editingTextFieldFatherFirstName = true
                            })
                            .onTapGesture {
                                editingTextFieldFatherFirstName = true
                            }
                            .onSubmit {
                                editingTextFieldFatherFirstName = true
                            }
                            .frame(width: UIScreen.main.bounds.width - 20, height: 50)
                            .padding(.bottom, 10)
                            
                            //Father Middle Name
                            MaterialDesignTextField($viewModel.textFatherMiddleName,
                                                    placeholder: viewModel.placeholderFatherMiddleName,
                                                    hint: $viewModel.hintFatherMiddleName,
                                                    editing: $editingTextFieldFatherMiddleName,
                                                    valid: $viewModel.textFatherMiddleNameValid,
                                                    BorderColor: $borderColor,
                                                    placeholderImage: .constant("person"))
                            .focused($focusedField, equals: .fMiddleName)
                            .disableAutocorrection(true)
                            .onChange(of: viewModel.textFatherMiddleName, perform: { newValue in
                                editingTextFieldFatherMiddleName = true
                            })
                            .onTapGesture {
                                editingTextFieldFatherMiddleName = true
                            }
                            .onSubmit {
                                editingTextFieldFatherMiddleName = true
                            }
                            .frame(width: UIScreen.main.bounds.width - 20, height: 50)
                            .padding(.bottom, 10)
                            
                            //Father Last Name
                            MaterialDesignTextField($viewModel.textFatherLastName,
                                                    placeholder: viewModel.placeholderFatherLastName,
                                                    hint: $viewModel.hintFatherLastName,
                                                    editing: $editingTextFieldFatherLastName,
                                                    valid: $viewModel.textFatherLastNameValid,
                                                    BorderColor: $borderColor,
                                                    placeholderImage: .constant("person"))
                            .focused($focusedField, equals: .fLastName)
                            .disableAutocorrection(true)
                            .onChange(of: viewModel.textFatherLastName, perform: { newValue in
                                editingTextFieldFatherLastName = true
                            })
                            .onTapGesture {
                                editingTextFieldFatherLastName = true
                            }
                            .onSubmit {
                                editingTextFieldFatherLastName = true
                            }
                            .frame(width: UIScreen.main.bounds.width - 20, height: 50)
                            .padding(.bottom, 10)
                            
                            //Father Mobile Number
                            MaterialDesignTextField($viewModel.textFatherMobileNumber,
                                                    placeholder: viewModel.placeholderFatherMobileNumber,
                                                    hint: $viewModel.hintFatherMobileNumber,
                                                    editing: $editingTextFieldFatherMobileNumber,
                                                    valid: $viewModel.textFatherMobileNumberValid,
                                                    BorderColor: $borderColor,
                                                    placeholderImage: .constant("Student_Phone"))
                            .focused($focusedField, equals: .fMobileNumber)
                            .keyboardType(.numberPad)
                            .disableAutocorrection(true)
                            .onChange(of: viewModel.textFatherMobileNumber, perform: { newValue in
                                if(newValue.range(of:"^[0-9+]{0,1}+[0-9]{5,10}$", options: .regularExpression) != nil) {
                                    editingTextFieldFatherMobileNumber = true
                                    print("valid")
                                } else {
                                    print("invalid")
                                }
                            })
                            .onTapGesture { editingTextFieldFatherMobileNumber = true }
                            .onSubmit {
                                editingTextFieldFatherMobileNumber = true
                            }
                            .onReceive(Just(viewModel.textFatherMobileNumber)) { newValue in
                                if viewModel.textFatherMobileNumber.count > 10 {
                                    viewModel.textFatherMobileNumber = String(viewModel.textFatherMobileNumber.prefix(10))
                                }
                            }
                            .frame(width: UIScreen.main.bounds.width - 20, height: 50)
                            .padding(.bottom, 10)
                            .toolbar {
                                ToolbarItemGroup(placement: .keyboard) {
                                    Spacer()
                                    Button("Done") {
                                        hideKeyboard()
                                    }
                                }
                            }
                            
                            //Father Email
                            MaterialDesignTextField($viewModel.textFatherEmail,
                                                    placeholder: viewModel.placeholderFatherEmail,
                                                    hint: $viewModel.hintFatherEmail,
                                                    editing: $editingTextFieldFatherEmail,
                                                    valid: $viewModel.textFatherEmailValid,
                                                    BorderColor: $borderColor,
                                                    placeholderImage: .constant("Student_Email"))
                            .focused($focusedField, equals: .fEmailId)
                            .keyboardType(.emailAddress)
                            .disableAutocorrection(true)
                            .onChange(of: viewModel.textFatherEmail, perform: { newValue in
                                if(newValue.range(of:"^\\w+([-+.']\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$", options: .regularExpression) != nil) {
                                    print("valid")
                                    editingTextFieldFatherEmail = true
                                } else {
                                    editingTextFieldFatherEmail = true
                                    print("invalid")
                                }
                                
                            })
                            .onTapGesture { editingTextFieldFatherEmail = true }
                            .onSubmit {
                                editingTextFieldFatherEmail = true
                            }
                            .frame(width: UIScreen.main.bounds.width - 20, height: 50)
                            .padding(.bottom, 10)
                        }
                        .id(2)
                        //Mother
                        VStack(alignment: .leading){
                            //Mother First Name
                            MaterialDesignTextField($viewModel.textMotherFirstName,
                                                    placeholder: viewModel.placeholderMotherFirstName,
                                                    hint: $viewModel.hintMotherFirstName,
                                                    editing: $editingTextFieldMotherFirstName,
                                                    valid: $viewModel.textMotherFirstNameValid,
                                                    BorderColor: $borderColor,
                                                    placeholderImage: .constant("person"))
                            .focused($focusedField, equals: .mFirstName)
                            .disableAutocorrection(true)
                            .onChange(of: viewModel.textMotherFirstName, perform: { newValue in
                                editingTextFieldMotherFirstName = true
                            })
                            .onTapGesture {
                                editingTextFieldMotherFirstName = true
                            }
                            .onSubmit {
                                editingTextFieldMotherFirstName = true
                            }
                            .frame(width: UIScreen.main.bounds.width - 20, height: 50)
                            .padding(.bottom, 10)
                            
                            //Mother Middle Name
                            MaterialDesignTextField($viewModel.textMotherMiddleName,
                                                    placeholder: viewModel.placeholderMotherMiddleName,
                                                    hint: $viewModel.hintMotherMiddleName,
                                                    editing: $editingTextFieldMotherMiddleName,
                                                    valid: $viewModel.textMotherMiddleNameValid,
                                                    BorderColor: $borderColor,
                                                    placeholderImage: .constant("person"))
                            .focused($focusedField, equals: .mMiddleName)
                            .disableAutocorrection(true)
                            .onChange(of: viewModel.textMotherMiddleName, perform: { newValue in
                                editingTextFieldMotherMiddleName = true
                            })
                            .onTapGesture {
                                editingTextFieldMotherMiddleName = true
                            }
                            .onSubmit {
                                editingTextFieldMotherMiddleName = true
                            }
                            .frame(width: UIScreen.main.bounds.width - 20, height: 50)
                            .padding(.bottom, 10)
                            
                            //Mother Last Name
                            MaterialDesignTextField($viewModel.textMotherLastName,
                                                    placeholder: viewModel.placeholderMotherLastName,
                                                    hint: $viewModel.hintMotherLastName,
                                                    editing: $editingTextFieldMotherLastName,
                                                    valid: $viewModel.textMotherLastNameValid,
                                                    BorderColor: $borderColor,
                                                    placeholderImage: .constant("person"))
                            .focused($focusedField, equals: .mLastName)
                            .disableAutocorrection(true)
                            .onChange(of: viewModel.textMotherLastName, perform: { newValue in
                                editingTextFieldMotherLastName = true
                            })
                            .onTapGesture {
                                editingTextFieldMotherLastName = true
                            }
                            .onSubmit {
                                editingTextFieldMotherLastName = true
                            }
                            .frame(width: UIScreen.main.bounds.width - 20, height: 50)
                            .padding(.bottom, 10)
                            
                            //Mother Mobile Number
                            MaterialDesignTextField($viewModel.textMotherMobileNumber,
                                                    placeholder: viewModel.placeholderMotherMobileNumber,
                                                    hint: $viewModel.hintMotherMobileNumber,
                                                    editing: $editingTextFieldMotherMobileNumber,
                                                    valid: $viewModel.textMotherMobileNumberValid,
                                                    BorderColor: $borderColor,
                                                    placeholderImage: .constant("Student_Phone"))
                            .focused($focusedField, equals: .mMobileNumber)
                            .keyboardType(.numberPad)
                            .disableAutocorrection(true)
                            .onChange(of: viewModel.textMotherMobileNumber, perform: { newValue in
                                if(newValue.range(of:"^[0-9+]{0,1}+[0-9]{5,10}$", options: .regularExpression) != nil) {
                                    editingTextFieldMotherMobileNumber = true
                                    print("valid")
                                } else {
                                    print("invalid")
                                }
                            })
                            .onTapGesture { editingTextFieldMotherMobileNumber = true }
                            .onSubmit {
                                editingTextFieldMotherMobileNumber = true
                            }
                            .onReceive(Just(viewModel.textMotherMobileNumber)) { newValue in
                                if viewModel.textMotherMobileNumber.count > 10 {
                                    viewModel.textMotherMobileNumber = String(viewModel.textMotherMobileNumber.prefix(10))
                                }
                            }
                            .frame(width: UIScreen.main.bounds.width - 20, height: 50)
                            .padding(.bottom, 10)
                            
                            //Mother Email
                            MaterialDesignTextField($viewModel.textMotherEmail,
                                                    placeholder: viewModel.placeholderMotherEmail,
                                                    hint: $viewModel.hintMotherEmail,
                                                    editing: $editingTextFieldMotherEmail,
                                                    valid: $viewModel.textMotherEmailValid,
                                                    BorderColor: $borderColor,
                                                    placeholderImage: .constant("Student_Email"))
                            .focused($focusedField, equals: .mEmailId)
                            .keyboardType(.emailAddress)
                            .disableAutocorrection(true)
                            .onChange(of: viewModel.textMotherEmail, perform: { newValue in
                                if(newValue.range(of:"^\\w+([-+.']\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$", options: .regularExpression) != nil) {
                                    print("valid")
                                    editingTextFieldMotherEmail = true
                                } else {
                                    editingTextFieldMotherEmail = true
                                    print("invalid")
                                }
                                
                            })
                            .onTapGesture { editingTextFieldMotherEmail = true }
                            .onSubmit {
                                editingTextFieldMotherEmail = true
                            }
                            .frame(width: UIScreen.main.bounds.width - 20, height: 50)
                            .padding(.bottom, 10)
                        }
                        .id(3)
                        VStack{
                            Text("Guardian’s Details (If Applicable)")
                                .foregroundColor(.white)
                                .font(.custom(OpenSans_Bold, size: 16))
                                .padding(8)
                                .frame(width: UIScreen.main.bounds.width - 20)
                                .background(Color(hex: 0x00B2BA))
                                .padding(.bottom, 8)
                        }
                        .id(4)
                        //Guardian
                        VStack(alignment: .leading){
                            //Guardian First Name
                            MaterialDesignTextField($viewModel.textGuardianFirstName,
                                                    placeholder: viewModel.placeholderGuardianFirstName,
                                                    hint: $viewModel.hintGuardianFirstName,
                                                    editing: $editingTextFieldGuardianFirstName,
                                                    valid: $viewModel.textGuardianFirstNameValid,
                                                    BorderColor: $borderColor,
                                                    placeholderImage: .constant("person"))
                            .focused($focusedField, equals: .gFirstName)
                            .disableAutocorrection(true)
                            .onChange(of: viewModel.textGuardianFirstName, perform: { newValue in
                                editingTextFieldGuardianFirstName = true
                            })
                            .onTapGesture {
                                editingTextFieldGuardianFirstName = true
                            }
                            .onSubmit {
                                editingTextFieldGuardianFirstName = true
                            }
                            .frame(width: UIScreen.main.bounds.width - 20, height: 50)
                            .padding(.bottom, 10)
                            
                            //Guardian Middle Name
                            MaterialDesignTextField($viewModel.textGuardianMiddleName,
                                                    placeholder: viewModel.placeholderGuardianMiddleName,
                                                    hint: $viewModel.hintGuardianMiddleName,
                                                    editing: $editingTextFieldGuardianMiddleName,
                                                    valid: $viewModel.textGuardianMiddleNameValid,
                                                    BorderColor: $borderColor,
                                                    placeholderImage: .constant("person"))
                            .focused($focusedField, equals: .gMiddleName)
                            .disableAutocorrection(true)
                            .onChange(of: viewModel.textGuardianMiddleName, perform: { newValue in
                                editingTextFieldGuardianMiddleName = true
                            })
                            .onTapGesture {
                                editingTextFieldGuardianMiddleName = true
                            }
                            .onSubmit {
                                editingTextFieldGuardianMiddleName = true
                            }
                            .frame(width: UIScreen.main.bounds.width - 20, height: 50)
                            .padding(.bottom, 10)
                            
                            //Guardian Last Name
                            MaterialDesignTextField($viewModel.textGuardianLastName,
                                                    placeholder: viewModel.placeholderGuardianLastName,
                                                    hint: $viewModel.hintGuardianLastName,
                                                    editing: $editingTextFieldGuardianLastName,
                                                    valid: $viewModel.textGuardianLastNameValid,
                                                    BorderColor: $borderColor,
                                                    placeholderImage: .constant("person"))
                            .focused($focusedField, equals: .gLastName)
                            .disableAutocorrection(true)
                            .onChange(of: viewModel.textGuardianLastName, perform: { newValue in
                                editingTextFieldGuardianLastName = true
                            })
                            .onTapGesture {
                                editingTextFieldGuardianLastName = true
                            }
                            .onSubmit {
                                editingTextFieldGuardianLastName = true
                            }
                            .frame(width: UIScreen.main.bounds.width - 20, height: 50)
                            .padding(.bottom, 10)
                            
                            //Guardian Mobile Number
                            MaterialDesignTextField($viewModel.textGuardianMobileNumber,
                                                    placeholder: viewModel.placeholderGuardianMobileNumber,
                                                    hint: $viewModel.hintGuardianMobileNumber,
                                                    editing: $editingTextFieldGuardianMobileNumber,
                                                    valid: $viewModel.textGuardianMobileNumberValid,
                                                    BorderColor: $borderColor,
                                                    placeholderImage: .constant("Student_Phone"))
                            .focused($focusedField, equals: .gMobileNumber)
                            .keyboardType(.numberPad)
                            .disableAutocorrection(true)
                            .onChange(of: viewModel.textGuardianMobileNumber, perform: { newValue in
                                if(newValue.range(of:"^[0-9+]{0,1}+[0-9]{5,10}$", options: .regularExpression) != nil) {
                                    editingTextFieldGuardianMobileNumber = true
                                    print("valid")
                                } else {
                                    print("invalid")
                                }
                            })
                            .onTapGesture { editingTextFieldGuardianMobileNumber = true }
                            .onSubmit {
                                editingTextFieldGuardianMobileNumber = true
                            }
                            .onReceive(Just(viewModel.textGuardianMobileNumber)) { newValue in
                                if viewModel.textGuardianMobileNumber.count > 10 {
                                    viewModel.textGuardianMobileNumber = String(viewModel.textGuardianMobileNumber.prefix(10))
                                }
                            }
                            .frame(width: UIScreen.main.bounds.width - 20, height: 50)
                            .padding(.bottom, 10)
                            
                            //Guardian Email
                            MaterialDesignTextField($viewModel.textGuardianEmail,
                                                    placeholder: viewModel.placeholderGuardianEmail,
                                                    hint: $viewModel.hintGuardianEmail,
                                                    editing: $editingTextFieldGuardianEmail,
                                                    valid: $viewModel.textGuardianEmailValid,
                                                    BorderColor: $borderColor,
                                                    placeholderImage: .constant("Student_Email"))
                            .focused($focusedField, equals: .gEmailId)
                            .keyboardType(.emailAddress)
                            .disableAutocorrection(true)
                            .onChange(of: viewModel.textGuardianEmail, perform: { newValue in
                                if(newValue.range(of:"^\\w+([-+.']\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$", options: .regularExpression) != nil) {
                                    print("valid")
                                    editingTextFieldGuardianEmail = true
                                } else {
                                    editingTextFieldGuardianEmail = true
                                    print("invalid")
                                }
                                
                            })
                            .onTapGesture { editingTextFieldGuardianEmail = true }
                            .onSubmit {
                                editingTextFieldGuardianEmail = true
                            }
                            .frame(width: UIScreen.main.bounds.width - 20, height: 50)
                            .padding(.bottom, 10)
                            
                            //Guardian Relationship
                            MaterialDesignTextField($viewModel.textGuardianRelationship,
                                                    placeholder: viewModel.placeholderGuardianRelationship,
                                                    hint: $viewModel.hintGuardianRelationship,
                                                    editing: $editingTextFieldGuardianRelationship,
                                                    valid: $viewModel.textGuardianRelationshipValid,
                                                    BorderColor: $borderColor,
                                                    placeholderImage: .constant("Parent_Relainship"))
                            .focused($focusedField, equals: .relationship)
                            .disableAutocorrection(true)
                            .onChange(of: viewModel.textGuardianRelationship, perform: { newValue in
                                editingTextFieldGuardianRelationship = true
                            })
                            .onTapGesture {
                                editingTextFieldGuardianRelationship = true
                            }
                            .onSubmit {
                                editingTextFieldGuardianRelationship = true
                            }
                            .frame(width: UIScreen.main.bounds.width - 20, height: 50)
                            .padding(.bottom, 10)
                            
                            //Current Address
                            MaterialDesignTextField($viewModel.textCurrentAddress,
                                                    placeholder: viewModel.placeholderCurrentAddress,
                                                    hint: $viewModel.hintCurrentAddress,
                                                    editing: $editingTextFieldCurrentAddress,
                                                    valid: $viewModel.textCurrentAddressValid,
                                                    BorderColor: $borderColor,
                                                    placeholderImage: .constant("Student_Current_Address"))
                            .focused($focusedField, equals: .address)
                            .disableAutocorrection(true)
                            .onChange(of: viewModel.textCurrentAddress, perform: { newValue in
                                editingTextFieldCurrentAddress = true
                            })
                            .onTapGesture {
                                editingTextFieldCurrentAddress = true
                            }
                            .onSubmit {
                                editingTextFieldCurrentAddress = true
                            }
                            .frame(width: UIScreen.main.bounds.width - 20, height: 50)
                            .padding(.bottom, 10)
                        }
                        .id(5)
                        
                        VStack(alignment: .leading) {
                            //Current Country
                            Button {
                                searchTextCurrentCountry = ""
                                ShowCurrentCountryDropDown = true
                            } label: {
                                MaterialDesignTextEditorCountry($viewModel.textCurrentCountry,
                                                                placeholder: viewModel.placeholderCurrentCountry,
                                                                hint: $viewModel.hintCurrentCountry,
                                                                editing: $editingTextFieldCurrentCountry,
                                                                valid: $viewModel.textCurrentCountryValid,
                                                                BorderColor: $borderColor)
                                .disabled(true)
                                .multilineTextAlignment(.leading)
                                .foregroundColor(.black )
                                .onChange(of: viewModel.textCurrentCountry, perform: { newValue in
                                    editingTextFieldCurrentCountry = false
                                    ShowCurrentCountryDropDown = false
                                    ShowCurrentStateDropDown = false
                                    ShowCurrentCityDropDown = false
                                })
                                .frame(width: UIScreen.main.bounds.width - 20, height: 60)
                                .onSubmit {
                                    editingTextFieldCurrentCountry = false
                                    ShowCurrentCountryDropDown = false
                                    ShowCurrentStateDropDown = false
                                    ShowCurrentCityDropDown = false
                                }
                                .padding(.bottom, ShowCurrentStateDropDown ? 0 : 10)
                            }
                            
                            if ShowCurrentCountryDropDown{
                                VStack(alignment: .leading){
                                    SearchBar(text: $searchTextCurrentCountry)
                                        .frame(width: UIScreen.main.bounds.width - 50)
                                        .padding(.top)
                                        .padding(.leading, 5)
                                    ForEach(searchResultsCurrentCountry) { master in
                                        Button {
                                            viewModel.textCurrentCountry = master.name ?? ""
                                            self.currentCountryID = master.id ?? ""
                                            viewModel.textCurrentCity = ""
                                            self.currentCityId = ""
                                            viewModel.textCurrentState = ""
                                            self.currentCityId = ""
                                            
                                            countryViewModel.fetchLoginDate(countryId: currentCountryID, stateId: currentStateId) { CountryData in
                                                arrStateCurrent = CountryData.data?.states ?? []
                                                arrCityCurrent = CountryData.data?.cities ?? []
                                            }
                                            ShowCurrentCountryDropDown = false
                                            ShowCurrentStateDropDown = false
                                            ShowCurrentCityDropDown = false
                                        } label: {
                                            Text(master.name ?? "")
                                                .padding(5)
                                                .padding(.leading, 5)
                                                .foregroundColor(.black)
                                                .frame(width: UIScreen.main.bounds.width - 20,alignment: .leading)
                                        }
                                    }
                                }
                                .overlay(
                                    RoundedRectangle(
                                        cornerRadius: 4).strokeBorder(borderColor,
                                                                      style: StrokeStyle(lineWidth: 1.0))
                                )
                                .padding(.bottom)
                            }
                            
                            //Current State
                            Button {
                                searchTextCurrentState = ""
                                ShowCurrentStateDropDown = true
                            } label: {
                                MaterialDesignTextEditorCountry($viewModel.textCurrentState,
                                                                placeholder: viewModel.placeholderCurrentState,
                                                                hint: $viewModel.hintCurrentState,
                                                                editing: $editingTextFieldCurrentState,
                                                                valid: $viewModel.textCurrentStateValid,
                                                                BorderColor: $borderColor)
                                .disabled(true)
                                .multilineTextAlignment(.leading)
                                .foregroundColor(.black )
                                .onChange(of: viewModel.textCurrentState, perform: { newValue in
                                    editingTextFieldCurrentState = false
                                    ShowCurrentCountryDropDown = false
                                    ShowCurrentStateDropDown = false
                                    ShowCurrentCityDropDown = false
                                })
                                .frame(width: UIScreen.main.bounds.width - 20, height: 60)
                                .onSubmit {
                                    editingTextFieldCurrentState = false
                                    ShowCurrentCountryDropDown = false
                                    ShowCurrentStateDropDown = false
                                    ShowCurrentCityDropDown = false
                                }
                                .padding(.bottom, ShowCurrentStateDropDown ? 0 : 10)
                            }
                            if !viewModel.textCurrentCountry.isEmpty{
                                if ShowCurrentStateDropDown{
                                    VStack(alignment: .leading){
                                        SearchBar(text: $searchTextCurrentState)
                                            .frame(width: UIScreen.main.bounds.width - 50)
                                            .padding(.top)
                                            .padding(.leading, 5)
                                        ForEach(searchResultsCurrentState) { master in
                                            Button {
                                                viewModel.textCurrentState = master.name ?? ""
                                                self.currentStateId = master.id ?? ""
                                                viewModel.textCurrentCity = ""
                                                self.currentCityId = ""
                                                countryViewModel.fetchLoginDate(countryId: currentCountryID, stateId: currentStateId) { CountryData in
                                                    arrStateCurrent = CountryData.data?.states ?? []
                                                    arrCityCurrent = CountryData.data?.cities ?? []
                                                }
                                                ShowCurrentCountryDropDown = false
                                                ShowCurrentStateDropDown = false
                                                ShowCurrentCityDropDown = false
                                            } label: {
                                                Text(master.name ?? "")
                                                    .padding(5)
                                                    .padding(.leading, 5)
                                                    .foregroundColor(.black)
                                                    .frame(width: UIScreen.main.bounds.width - 20,alignment: .leading)
                                            }
                                        }
                                    }
                                    .overlay(
                                        RoundedRectangle(
                                            cornerRadius: 4).strokeBorder(borderColor,
                                                                          style: StrokeStyle(lineWidth: 1.0))
                                    )
                                    .padding(.bottom)
                                }
                            }
                            
                            //Current City
                            Button {
                                searchTextCurrentCity = ""
                                ShowCurrentCityDropDown = true
                            } label: {
                                MaterialDesignTextEditorCountry($viewModel.textCurrentCity,
                                                                placeholder: viewModel.placeholderCurrentCity,
                                                                hint: $viewModel.hintCurrentCity,
                                                                editing: $editingTextFieldCurrentCity,
                                                                valid: $viewModel.textCurrentCityValid,
                                                                BorderColor: $borderColor)
                                .disabled(true)
                                .multilineTextAlignment(.leading)
                                .foregroundColor(.black )
                                .onChange(of: viewModel.textCurrentCity, perform: { newValue in
                                    editingTextFieldCurrentCity = false
                                    ShowCurrentCountryDropDown = false
                                    ShowCurrentStateDropDown = false
                                    ShowCurrentCityDropDown = false
                                })
                                .frame(width: UIScreen.main.bounds.width - 20, height: 60)
                                .onSubmit {
                                    editingTextFieldCurrentCity = false
                                    ShowCurrentCountryDropDown = false
                                    ShowCurrentStateDropDown = false
                                    ShowCurrentCityDropDown = false
                                }
                                .padding(.bottom, ShowCurrentStateDropDown ? 0 : 10)
                            }
                            if !viewModel.textCurrentState.isEmpty{
                                if ShowCurrentCityDropDown{
                                    VStack(alignment: .leading){
                                        SearchBar(text: $searchTextCurrentCity)
                                            .frame(width: UIScreen.main.bounds.width - 50)
                                            .padding(.top)
                                            .padding(.leading, 5)
                                        ForEach(searchResultsCurrentCity) { master in
                                            Button {
                                                viewModel.textCurrentCity = master.name ?? ""
                                                self.currentCityId = master.id ?? ""
                                                ShowCurrentCountryDropDown = false
                                                ShowCurrentStateDropDown = false
                                                ShowCurrentCityDropDown = false
                                            } label: {
                                                Text(master.name ?? "")
                                                    .padding(5)
                                                    .padding(.leading, 5)
                                                    .foregroundColor(.black)
                                                    .frame(width: UIScreen.main.bounds.width - 20,alignment: .leading)
                                            }
                                        }
                                    }
                                    .overlay(
                                        RoundedRectangle(
                                            cornerRadius: 4).strokeBorder(borderColor,
                                                                          style: StrokeStyle(lineWidth: 1.0))
                                    )
                                    .padding(.bottom)
                                }
                            }
                        }
                        .id(6)
                        VStack(alignment: .leading){
                            //Guardian Pin Code
                            MaterialDesignTextFieldwithoutImage($viewModel.textCurrentPincode,
                                                                placeholder: viewModel.placeholderCurrentPincode,
                                                                hint: $viewModel.hintCurrentPincode,
                                                                editing: $editingTextFieldCurrentPinCode,
                                                                valid: $viewModel.textCurrentPincodeValid,
                                                                BorderColor: $borderColor)
                            .focused($focusedField, equals: .pinCode)
                            .keyboardType(.numberPad)
                            .disableAutocorrection(true)
                            .onChange(of: viewModel.textCurrentPincode, perform: { newValue in
                                if(newValue.range(of:"^[0-9+]{0,1}+[0-9]{5,10}$", options: .regularExpression) != nil) {
                                    editingTextFieldCurrentPinCode = true
                                    print("valid")
                                } else {
                                    print("invalid")
                                }
                            })
                            .onTapGesture { editingTextFieldCurrentPinCode = true }
                            .onSubmit {
                                editingTextFieldCurrentPinCode = true
                            }
                            .onReceive(Just(viewModel.textCurrentPincode)) { newValue in
                                if viewModel.textCurrentPincode.count > 6 {
                                    viewModel.textCurrentPincode = String(viewModel.textCurrentPincode.prefix(6))
                                }
                            }
                            .frame(width: UIScreen.main.bounds.width - 20, height: 50)
                            .padding(.bottom, 10)
                        }
                        NavigationLink("", destination: EnrollmentDetailsView(getIsEditable: "1").navigationBarHidden(true),isActive: $showEnrollmentDetails).isDetailLink(false)
                        VStack(alignment: .center){
                            DetailsViewBottom(textName: "Save & Continue", imageName: "Form_Button_icon_Step2")
                                .onTapGesture {
                                    isButtonClick = true
                                    if viewModel.hintFatherFirstName != "Success"{
                                        alertMessage = "Please Enter Father's First Name"
                                        AlertShow = "0"
                                        focusedField = .fFirstName
                                        showingAlert = true
                                    }else if viewModel.hintFatherLastName != "Success"{
                                        alertMessage = "Please Enter Father's Last Name"
                                        AlertShow = "0"
                                        focusedField = .fLastName
                                        showingAlert = true
                                    }else if viewModel.hintFatherMobileNumber != "Success"{
                                        alertMessage = "Please Enter Father's Mobile Number"
                                        AlertShow = "0"
                                        focusedField = .fMobileNumber
                                        showingAlert = true
                                    }else if viewModel.hintFatherEmail != "Success"{
                                        alertMessage = "Please Enter Father's Email ID"
                                        AlertShow = "0"
                                        focusedField = .fEmailId
                                        showingAlert = true
                                    }else if viewModel.hintMotherFirstName != "Success"{
                                        alertMessage = "Please Enter Mother's First Name"
                                        AlertShow = "0"
                                        focusedField = .mFirstName
                                        showingAlert = true
                                    }else if viewModel.hintMotherLastName != "Success"{
                                        alertMessage = "Please Enter Mother's Last Name"
                                        AlertShow = "0"
                                        focusedField = .mLastName
                                        showingAlert = true
                                    }else if viewModel.hintMotherMobileNumber != "Success"{
                                        alertMessage = "Please Enter Mother's Mobile Number"
                                        AlertShow = "0"
                                        focusedField = .mMobileNumber
                                        showingAlert = true
                                    }else if viewModel.hintMotherEmail != "Success"{
                                        alertMessage = "Please Enter Mother's Email Id"
                                        AlertShow = "0"
                                        focusedField = .mEmailId
                                        showingAlert = true
                                    }else{
                                        submitViewModel.fetchLoginDate(
                                            fFirstName: viewModel.textFatherFirstName,
                                            fMiddleName: viewModel.textFatherMiddleName,
                                            fLastName: viewModel.textFatherLastName,
                                            fMobile: viewModel.textFatherMobileNumber,
                                            fEmail: viewModel.textFatherEmail,
                                            mFirstName: viewModel.textMotherFirstName,
                                            mMiddleName: viewModel.textMotherMiddleName,
                                            mLastName: viewModel.textMotherLastName,
                                            mMobile: viewModel.textMotherMobileNumber,
                                            mEmail: viewModel.textMotherEmail,
                                            gFirstName: viewModel.textGuardianFirstName,
                                            gMiddleName: viewModel.textGuardianMiddleName,
                                            gLastName: viewModel.textGuardianLastName,
                                            gMobile: viewModel.textGuardianMobileNumber,
                                            gEmail: viewModel.textGuardianEmail,
                                            gRelation: viewModel.textGuardianRelationship,
                                            gAddress: viewModel.textCurrentAddress,
                                            gCountry: currentCountryID,
                                            gState: currentStateId,
                                            gCity: currentCityId,
                                            gPincode: viewModel.textCurrentPincode,
                                            appId: studentAppID ?? "") { ParentDetails in
                                                if ParentDetails.status == 1{
                                                    showEnrollmentDetails = true
                                                }else{
                                                    alertMessage = ParentDetails.msg ?? ""
                                                    AlertShow = "0"
                                                    showingAlert = true
                                                }
                                            }
                                    }
                                }
                                .shadow(color: isButtonClick ? .gray : .clear, radius: isButtonClick ? 10 : 0, x: 0, y: 0)
                        }
                        .padding(.bottom)
                    }
                }
                if submitViewModel.isLoadingData{
                    LoadingView()
                }
                if GetViewModel.isLoadingData{
                    LoadingView()
                }
            }
            .alert(alertMessage, isPresented: $showingAlert) {
                Button("OK", role: .cancel) {
                    if AlertShow == "1"{
                        showEnrollmentDetails = true
                    }else{
                        isButtonClick = false
                    }
                }
            }
            .navigationBarHidden(true)
        }
        .onAppear(perform: delayText)
    }
    
    private func delayText() {
        // Delay of 0.2 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            masterViewModel.MasterGet { MasterData in
                arrCountry = MasterData.data?.countries ?? []
                
                if getIsEditable == "1"{
                    canEditCurrentCountry = true
                    canEditCurrentState = true
                    canEditCurrentCity = true
                }else{
                    canEditCurrentCountry = false
                    canEditCurrentState = false
                    canEditCurrentCity = false
                }
                
                countryViewModel.fetchLoginDate(countryId: currentCountryID, stateId: currentStateId) { CountryData in
                    arrStateCurrent = CountryData.data?.states ?? []
                    arrCityCurrent = CountryData.data?.cities ?? []
                }
                
            }
            GetViewModel.fetchLoginDate(appId: studentAppID ?? "") { formData in
                if formData.status == 1{
                    viewModel.textFatherFirstName = formData.data?.fFirstName ?? ""
                    viewModel.textFatherMiddleName = formData.data?.fMiddleName ?? ""
                    viewModel.textFatherLastName = formData.data?.fLastName ?? ""
                    viewModel.textFatherMobileNumber = formData.data?.fMobile ?? ""
                    viewModel.textFatherEmail = formData.data?.fEmail ?? ""
                    viewModel.textMotherFirstName = formData.data?.mFirstName ?? ""
                    viewModel.textMotherMiddleName = formData.data?.mMiddleName ?? ""
                    viewModel.textMotherLastName = formData.data?.mLastName ?? ""
                    viewModel.textMotherMobileNumber = formData.data?.mMobile ?? ""
                    viewModel.textMotherEmail = formData.data?.mEmail ?? ""
                    viewModel.textGuardianFirstName = formData.data?.gFirstName ?? ""
                    viewModel.textGuardianMiddleName = formData.data?.gMiddleName ?? ""
                    viewModel.textGuardianLastName = formData.data?.gLastName ?? ""
                    viewModel.textGuardianMobileNumber = formData.data?.gMobile ?? ""
                    viewModel.textGuardianEmail = formData.data?.gEmail ?? ""
                    viewModel.textGuardianRelationship = formData.data?.gRelation ?? ""
                    viewModel.textCurrentAddress = formData.data?.gAddress ?? ""
                    viewModel.textCurrentCountry = formData.data?.gCountryName ?? ""
                    currentCountryID = formData.data?.gCountry ?? ""
                    viewModel.textCurrentState = formData.data?.gStateName ?? ""
                    currentStateId = formData.data?.gState ?? ""
                    viewModel.textCurrentCity = formData.data?.gCityName ?? ""
                    currentCityId = formData.data?.gCity ?? ""
                    viewModel.textCurrentPincode = formData.data?.gPincode ?? ""
                    
                    countryViewModel.fetchLoginDate(countryId: currentCountryID, stateId: currentStateId) { CountryData in
                        arrStateCurrent = CountryData.data?.states ?? []
                        arrCityCurrent = CountryData.data?.cities ?? []
                    }
                }
            }
        }
    }
    
    //Father
    @State private var editingTextFieldFatherFirstName = false {
        didSet {
            viewModel.validateTextFatherFirstName()
        }
    }
    @State private var editingTextFieldFatherMiddleName = false {
        didSet {
            viewModel.validateTextFatherMiddleName()
        }
    }
    @State private var editingTextFieldFatherLastName = false {
        didSet {
            viewModel.validateTextFatherLastName()
        }
    }
    @State private var editingTextFieldFatherMobileNumber = false {
        didSet {
            viewModel.validateTextFatherMobileNumber()
        }
    }
    @State private var editingTextFieldFatherEmail = false {
        didSet {
            viewModel.validateTextFatherEmail()
        }
    }
    
    //Mother
    @State private var editingTextFieldMotherFirstName = false {
        didSet {
            viewModel.validateTextMotherFirstName()
        }
    }
    @State private var editingTextFieldMotherMiddleName = false {
        didSet {
            viewModel.validateTextMotherMiddleName()
        }
    }
    @State private var editingTextFieldMotherLastName = false {
        didSet {
            viewModel.validateTextMotherLastName()
        }
    }
    @State private var editingTextFieldMotherMobileNumber = false {
        didSet {
            viewModel.validateTextMotherMobileNumber()
        }
    }
    @State private var editingTextFieldMotherEmail = false {
        didSet {
            viewModel.validateTextMotherEmail()
        }
    }
    
    //Guardian
    @State private var editingTextFieldGuardianFirstName = false {
        didSet {
            viewModel.validateTextGuardianFirstName()
        }
    }
    @State private var editingTextFieldGuardianMiddleName = false {
        didSet {
            viewModel.validateTextGuardianMiddleName()
        }
    }
    @State private var editingTextFieldGuardianLastName = false {
        didSet {
            viewModel.validateTextGuardianLastName()
        }
    }
    @State private var editingTextFieldGuardianMobileNumber = false {
        didSet {
            viewModel.validateTextGuardianMobileNumber()
        }
    }
    @State private var editingTextFieldGuardianEmail = false {
        didSet {
            viewModel.validateTextGuardianEmail()
        }
    }
    @State private var editingTextFieldGuardianRelationship = false {
        didSet {
            viewModel.validateTextGuardianRelationship()
        }
    }
    
    //Aadress
    @State private var editingTextFieldCurrentAddress = false {
        didSet {
            viewModel.validateTextCurrentAddress()
        }
    }
    @State private var editingTextFieldCurrentCountry = false {
        didSet {
            viewModel.validateTextCountry()
        }
    }
    @State private var editingTextFieldCurrentState = false {
        didSet {
            viewModel.validateTextState()
        }
    }
    @State private var editingTextFieldCurrentCity = false {
        didSet {
            viewModel.validateTextCity()
        }
    }
    @State private var editingTextFieldCurrentPinCode = false {
        didSet {
            viewModel.validateTextPincode()
        }
    }
    
    //MARK: - Search Variable
    
    //Current
    var searchResultsCurrentCountry: [countries] {
        if searchTextCurrentCountry.isEmpty {
            return arrCountry
        } else {
            return arrCountry.filter {
                $0.name!.contains(searchTextCurrentCountry) ||
                $0.name!.lowercased().contains(searchTextCurrentCountry) ||
                $0.name!.uppercased().contains(searchTextCurrentCountry)
            }
        }
    }
    
    var searchResultsCurrentState: [states] {
        if searchTextCurrentState.isEmpty {
            return arrStateCurrent
        } else {
            return arrStateCurrent.filter {
                $0.name!.contains(searchTextCurrentState) ||
                $0.name!.lowercased().contains(searchTextCurrentState) ||
                $0.name!.uppercased().contains(searchTextCurrentState)
            }
        }
    }
    
    var searchResultsCurrentCity: [City] {
        if searchTextCurrentCity.isEmpty {
            return arrCityCurrent
        } else {
            return arrCityCurrent.filter {
                $0.name!.contains(searchTextCurrentCity) ||
                $0.name!.lowercased().contains(searchTextCurrentCity) ||
                $0.name!.uppercased().contains(searchTextCurrentCity)
            }
        }
    }
}

//struct ParentsDetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        ParentsDetailsView(getIsEditable: "1", formData: <#FormDataClass#>)
//    }
//}
