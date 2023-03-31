//
//  StudentDetailsView.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 29/03/23.
//

import SwiftUI
import Combine

struct StudentDetailsView: View {
    @StateObject private var viewModel = ContentViewModel()
    @State private var borderColor = Color(hex: 0xF15865)
    @State private var canEditBloodGroup = false
    @State private var canEditGender = false
    @State private var canEditDOB = false
    @State private var canEditCurrentCountry = false
    @State private var canEditCurrentState = false
    @State private var canEditCurrentCity = false
    @State private var canEditPermentCountry = false
    @State private var canEditPermentState = false
    @State private var canEditPermentCity = false
    
    @State private var showPrentsDetails = false
    
    @State private var isSelect = false
    
    @State private var todayDate = Date()
    
    @StateObject private var masterViewModel = MasterViewModel()
    @StateObject private var countryViewModel = CountryViewModel()
    
    //Module array
    @State private var arrGender = [gender]()
    @State private var arrCountry = [countries]()
    @State private var arrBloodGroup = [BloodGroup]()
    @State private var arrStateCurrent = [states]()
    @State private var arrCityCurrent = [City]()
    @State private var arrCountryPerment = [countries]()
    @State private var arrStatePerment = [states]()
    @State private var arrCityPerment = [City]()
    
    //ID
    @State private var bloodGroupId = ""
    @State private var genderId = ""
    @State private var currentCountryID = ""
    @State private var currentStateId = ""
    @State private var currentCityId = ""
    @State private var permentCountryID = ""
    @State private var permentStateId = ""
    @State private var permentCityId = ""
    
    //Search Text
    @State private var searchTextBloodGroup = ""
    @State private var ShowBloodGroupDropDown = false
    
    //Current
    @State private var searchTextCurrentCountry = ""
    @State private var ShowCurrentCountryDropDown = false
    
    @State private var searchTextCurrentState = ""
    @State private var ShowCurrentStateDropDown = false
    
    @State private var searchTextCurrentCity = ""
    @State private var ShowCurrentCityDropDown = false
    
    //Perment
    @State private var searchTextPermentCountry = ""
    @State private var ShowPermentCountryDropDown = false
    
    @State private var searchTextPermentState = ""
    @State private var ShowPermentStateDropDown = false
    
    @State private var searchTextPermentCity = ""
    @State private var ShowPermentCityDropDown = false
        
    var getIsEditable: String
    var body: some View {
        NavigationView {
            VStack{
                Text("Profile")
                    .font(.custom(OpenSans_SemiBold, size: 18))
                    .foregroundColor(Color(hex: 0x333333))
                    .padding(.top, 5)
                Divider()
                ScrollView(showsIndicators: false){
                    DetailsViewTop(Step: "1")
                        .padding(.bottom)
                    
                    VStack(alignment: .leading){
                        //First Name
                        MaterialDesignTextField($viewModel.textFirstName,
                                                placeholder: viewModel.placeholderFirstName,
                                                hint: $viewModel.hintFirstName,
                                                editing: $editingTextFieldFirstName,
                                                valid: $viewModel.textFirstNameValid,
                                                BorderColor: $borderColor,
                                                placeholderImage: .constant("person"))
                        .disableAutocorrection(true)
                        .onChange(of: viewModel.textFirstName, perform: { newValue in
                            editingTextFieldFirstName = true
                        })
                        .onTapGesture {
                            editingTextFieldFirstName = true
                        }
                        .onSubmit {
                            editingTextFieldFirstName = true
                        }
                        .frame(width: UIScreen.main.bounds.width - 20, height: 50)
                        .padding(.bottom, 10)
                        
                        //Middle Name
                        MaterialDesignTextField($viewModel.textMiddleName,
                                                placeholder: viewModel.placeholderMiddleName,
                                                hint: $viewModel.hintLastName,
                                                editing: $editingTextFieldMiddleName,
                                                valid: $viewModel.textMiddleNameValid,
                                                BorderColor: $borderColor,
                                                placeholderImage: .constant("person"))
                        .disableAutocorrection(true)
                        .onChange(of: viewModel.textMiddleName, perform: { newValue in
                            editingTextFieldMiddleName = true
                        })
                        .onTapGesture {
                            editingTextFieldMiddleName = true
                        }
                        .onSubmit {
                            editingTextFieldMiddleName = true
                        }
                        .frame(width: UIScreen.main.bounds.width - 20, height: 50)
                        .padding(.bottom, 10)
                        
                        //Last Name
                        MaterialDesignTextField($viewModel.textLastName,
                                                placeholder: viewModel.placeholderLastName,
                                                hint: $viewModel.hintLastName,
                                                editing: $editingTextFieldLastName,
                                                valid: $viewModel.textLastNameValid,
                                                BorderColor: $borderColor,
                                                placeholderImage: .constant("person"))
                        .disableAutocorrection(true)
                        .onChange(of: viewModel.textLastName, perform: { newValue in
                            editingTextFieldLastName = true
                        })
                        .onTapGesture {
                            editingTextFieldLastName = true
                        }
                        .onSubmit {
                            editingTextFieldLastName = true
                        }
                        .frame(width: UIScreen.main.bounds.width - 20, height: 50)
                        .padding(.bottom, 10)
                        
                        //Mobile Number
                        MaterialDesignTextField($viewModel.textMobileNumber,
                                                placeholder: viewModel.placeholderMobileNumber,
                                                hint: $viewModel.hintMiddleName,
                                                editing: $editingTextFieldMobileNumber,
                                                valid: $viewModel.textMobileNumberValid,
                                                BorderColor: $borderColor,
                                                placeholderImage: .constant("Student_Phone"))
                        .keyboardType(.numberPad)
                        .disableAutocorrection(true)
                        .onChange(of: viewModel.textMobileNumber, perform: { newValue in
                            if(newValue.range(of:"^[0-9+]{0,1}+[0-9]{5,10}$", options: .regularExpression) != nil) {
                                editingTextFieldMobileNumber = true
                                print("valid")
                            } else {
                                print("invalid")
                            }
                        })
                        .onTapGesture { editingTextFieldMobileNumber = true }
                        .onSubmit {
                            editingTextFieldMobileNumber = true
                        }
                        .onReceive(Just(viewModel.textMobileNumber)) { newValue in
                            if viewModel.textMobileNumber.count > 10 {
                                viewModel.textMobileNumber = String(viewModel.textMobileNumber.prefix(10))
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
                        
                        //Email
                        MaterialDesignTextField($viewModel.textEmail,
                                                placeholder: viewModel.placeholderEmail,
                                                hint: $viewModel.hintEmail,
                                                editing: $editingTextFieldEmail,
                                                valid: $viewModel.textEmailValid,
                                                BorderColor: $borderColor,
                                                placeholderImage: .constant("Student_Email"))
                        .keyboardType(.emailAddress)
                        .disableAutocorrection(true)
                        .onChange(of: viewModel.textEmail, perform: { newValue in
                            if(newValue.range(of:"^\\w+([-+.']\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$", options: .regularExpression) != nil) {
                                print("valid")
                                editingTextFieldEmail = true
                            } else {
                                editingTextFieldEmail = true
                                print("invalid")
                            }
                            
                        })
                        .onTapGesture { editingTextFieldEmail = true }
                        .onSubmit {
                            editingTextFieldEmail = true
                        }
                        .frame(width: UIScreen.main.bounds.width - 20, height: 50)
                        .padding(.bottom, 10)
                        
                        //Blood Group
                        Button {
                            searchTextBloodGroup = ""
                            ShowBloodGroupDropDown = true
                        } label: {
                            MaterialDesignTextEditor($viewModel.textBloodGroup,
                                                     placeholder: viewModel.placeholderBloodGroup,
                                                     hint: $viewModel.hintBloodGroup,
                                                     editing: $editingTextFieldBloodGroup,
                                                     valid: $viewModel.textBloodGroupValid,
                                                     BorderColor: $borderColor,
                                                     placeholderImage: .constant("Student_BloodGroup"))
                            .disabled(true)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.black )
                            .onChange(of: viewModel.textBloodGroup, perform: { newValue in
                                editingTextFieldBloodGroup = false
                                ShowBloodGroupDropDown = false
                            })
                            .frame(width: UIScreen.main.bounds.width - 20, height: 60)
                            .onSubmit {
                                editingTextFieldBloodGroup = false
                                ShowBloodGroupDropDown = false
                            }
                            .padding(.bottom)
                        }
                        
                        if ShowBloodGroupDropDown{
                            VStack(alignment: .leading){
                                SearchBar(text: $searchTextBloodGroup)
                                    .frame(width: UIScreen.main.bounds.width - 50)
                                    .padding(.top)
                                    .padding(.leading, 5)
                                ForEach(searchResultsBloodGroup) { master in
                                    Button {
                                        viewModel.textBloodGroup = master.name ?? ""
                                        self.bloodGroupId = master.id ?? ""
                                        ShowBloodGroupDropDown = false
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
                        
                        //Student Gender
                        Button {
                            canEditGender = true
                        } label: {
                            if canEditGender{
                                Menu {
                                    ForEach(arrGender) { SchoolData in
                                        Button {
                                            viewModel.textGender = SchoolData.name ?? ""
                                            self.genderId = SchoolData.id ?? ""
                                        } label: {
                                            Text(SchoolData.name ?? "")
                                        }
                                    }
                                } label: {
                                    MaterialDesignTextEditor($viewModel.textGender,
                                                             placeholder: viewModel.placeholderGender,
                                                             hint: $viewModel.hintGender,
                                                             editing: $editingTextFieldGender,
                                                             valid: $viewModel.textBloodGroupValid,
                                                             BorderColor: $borderColor,
                                                             placeholderImage: .constant("Student_Gender"))
                                    .disabled(true)
                                    .multilineTextAlignment(.leading)
                                    .foregroundColor(.black )
                                    .onChange(of: viewModel.textGender, perform: { newValue in
                                        editingTextFieldGender = false
                                    })
                                    .frame(width: UIScreen.main.bounds.width - 20, height: 55)
                                    .onTapGesture {
                                        editingTextFieldGender = false
                                    }
                                    .onSubmit {
                                        editingTextFieldGender = false
                                    }
                                }
                                .padding(.bottom)
                            }else{
                                MaterialDesignTextEditor($viewModel.textBloodGroup,
                                                         placeholder: viewModel.placeholderBloodGroup,
                                                         hint: $viewModel.hintBloodGroup,
                                                         editing: $editingTextFieldBloodGroup,
                                                         valid: $viewModel.textBloodGroupValid,
                                                         BorderColor: $borderColor,
                                                         placeholderImage: .constant("Student_Gender"))
                                .disabled(true)
                                .multilineTextAlignment(.leading)
                                .foregroundColor(.black)
                                .onChange(of: viewModel.textGender, perform: { newValue in
                                    editingTextFieldGender = true
                                    canEditGender = true
                                })
                                .frame(width: UIScreen.main.bounds.width - 20, height: 55)
                                .onTapGesture {
                                    editingTextFieldGender = true
                                    canEditGender = true
                                }
                                .onSubmit {
                                    editingTextFieldGender = true
                                    canEditGender = true
                                }
                                .padding(.bottom)
                            }
                        }
                        
                        //Date
                        
                        MaterialDesignTextFieldDOB($viewModel.textDOB,
                                                   placeholder: viewModel.placeholderDOB,
                                                   hint: $viewModel.hintDOB,
                                                   editing: $editingTextFieldDOB,
                                                   valid: $viewModel.textDOBValid,
                                                   BorderColor: $borderColor,
                                                   placeholderImage: .constant("Student_DOB"))
                        .disabled(true)
                        .onChange(of: viewModel.textDOB, perform: { newValue in
                            editingTextFieldDOB = true
                        })
                        .frame(width: UIScreen.main.bounds.width - 20, height: 55)
                        .padding(.bottom, 10)
                        .onTapGesture {
                            editingTextFieldDOB = true
                            showDatePickerAlert()
                            convertDate()
                        }
                        .onSubmit {
                            editingTextFieldDOB = true
                            convertDate()
                        }
                        
                        //Place of Birth
                        MaterialDesignTextField($viewModel.textPOB,
                                                placeholder: viewModel.placeholderPOB,
                                                hint: $viewModel.hintPOB,
                                                editing: $editingTextFieldPOB,
                                                valid: $viewModel.textPOBValid,
                                                BorderColor: $borderColor,
                                                placeholderImage: .constant("Student_Place_Birth"))
                        .disableAutocorrection(true)
                        .onChange(of: viewModel.textPOB, perform: { newValue in
                            editingTextFieldPOB = true
                        })
                        .onTapGesture {
                            editingTextFieldPOB = true
                        }
                        .onSubmit {
                            editingTextFieldPOB = true
                        }
                        .frame(width: UIScreen.main.bounds.width - 20, height: 50)
                        .padding(.bottom, 10)
                    }
                    VStack{
                        //Nationality
                        MaterialDesignTextField($viewModel.textNationality,
                                                placeholder: viewModel.placeholderNationality,
                                                hint: $viewModel.hintNationality,
                                                editing: $editingTextFieldNationality,
                                                valid: $viewModel.textNationalityValid,
                                                BorderColor: $borderColor,
                                                placeholderImage: .constant("Student_Nationality"))
                        .disableAutocorrection(true)
                        .onChange(of: viewModel.textNationality, perform: { newValue in
                            editingTextFieldNationality = true
                        })
                        .onTapGesture {
                            editingTextFieldNationality = true
                        }
                        .onSubmit {
                            editingTextFieldNationality = true
                        }
                        .frame(width: UIScreen.main.bounds.width - 20, height: 50)
                        .padding(.bottom, 10)
                        
                        //Aadhar
                        MaterialDesignTextField($viewModel.textAadharCard,
                                                placeholder: viewModel.placeholderAadhar,
                                                hint: $viewModel.hintAadhar,
                                                editing: $editingTextFieldAadhar,
                                                valid: $viewModel.textAadharValid,
                                                BorderColor: $borderColor,
                                                placeholderImage: .constant("Student_AadharCard"))
                        .disableAutocorrection(true)
                        .onChange(of: viewModel.textAadharCard, perform: { newValue in
                            if(newValue.range(of:"^[0-9+]{0,1}+[0-9]{5,10}$", options: .regularExpression) != nil) {
                                editingTextFieldAadhar = true
                                print("valid")
                            } else {
                                print("invalid")
                            }
                        })
                        .onTapGesture {
                            editingTextFieldAadhar = true
                        }
                        .onSubmit {
                            editingTextFieldAadhar = true
                        }
                        .onReceive(Just(viewModel.textAadharCard)) { newValue in
                            if viewModel.textAadharCard.count > 11 {
                                viewModel.textAadharCard = String(viewModel.textAadharCard.prefix(11))
                            }
                        }
                        .frame(width: UIScreen.main.bounds.width - 20, height: 50)
                        .padding(.bottom, 10)
                        
                        //Pan
                        MaterialDesignTextField($viewModel.textPanCard,
                                                placeholder: viewModel.placeholderPan,
                                                hint: $viewModel.hintPan,
                                                editing: $editingTextFieldPan,
                                                valid: $viewModel.textPanValid,
                                                BorderColor: $borderColor,
                                                placeholderImage: .constant("Student_AadharCard"))
                        .disableAutocorrection(true)
                        .onChange(of: viewModel.textPanCard, perform: { newValue in
                            editingTextFieldPan = true
                        })
                        .onTapGesture { editingTextFieldPan = true }
                        .onSubmit {
                            editingTextFieldPan = true
                        }
                        .frame(width: UIScreen.main.bounds.width - 20, height: 50)
                        .padding(.bottom, 10)
                        
                        //Passport
                        MaterialDesignTextField($viewModel.textPassport,
                                                placeholder: viewModel.placeholderPassport,
                                                hint: $viewModel.hintPassport,
                                                editing: $editingTextFieldPassport,
                                                valid: $viewModel.textPassportValid,
                                                BorderColor: $borderColor,
                                                placeholderImage: .constant("Student_Passport"))
                        .disableAutocorrection(true)
                        .onChange(of: viewModel.textPassport, perform: { newValue in
                            editingTextFieldPassport = true
                        })
                        .onTapGesture {
                            editingTextFieldPassport = true
                        }
                        .onSubmit {
                            editingTextFieldPassport = true
                        }
                        .frame(width: UIScreen.main.bounds.width - 20, height: 50)
                        .padding(.bottom, 10)
                        
                    }
                    
                    //Current Address
                    VStack{
                        //Current Address
                        MaterialDesignTextField($viewModel.textCurrentAddress,
                                                placeholder: viewModel.placeholderCurrentAddress,
                                                hint: $viewModel.hintCurrentAddress,
                                                editing: $editingTextFieldCurrentAddress,
                                                valid: $viewModel.textCurrentAddressValid,
                                                BorderColor: $borderColor,
                                                placeholderImage: .constant("Student_Current_Address"))
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
                        }
                        .padding(.bottom)
                        
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
                            .padding(.bottom)
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
                        }
                        .padding(.bottom)
                        
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
                    .padding(.bottom, 5)
                    
                    VStack(alignment: .leading){
                        Button {
                            isSelect.toggle()
                            if isSelect{
                                viewModel.textPermanentAddress = viewModel.textCurrentAddress
                                viewModel.textPermanentCountry = viewModel.textCurrentCountry
                                viewModel.textPermanentState = viewModel.textCurrentState
                                viewModel.textPermanentCity = viewModel.textCurrentCity
                                permentCountryID = currentCountryID
                                permentStateId = currentStateId
                                permentCityId = currentCityId
                            }else{
                                viewModel.textPermanentAddress = ""
                                viewModel.textPermanentCountry = ""
                                viewModel.textPermanentState = ""
                                viewModel.textPermanentCity = ""
                                permentCountryID = ""
                                permentStateId = ""
                                permentCityId = ""
                            }
                        } label: {
                            HStack{
                                Image(isSelect ? "Student_Select" : "Student_UnSelect")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 20, alignment: .leading)
                                    .padding(2)
                                Text("Same as above")
                                    .font(.custom(OpenSans_SemiBold, size: 10))
                                    .foregroundColor(Color(hex: 0x555555))
                            }
                            .frame(width: UIScreen.main.bounds.width - 20, alignment: .leading)
                        }
                    }
                    .padding(.bottom, 5)
                    
                    VStack{
                        //Perment Address
                        MaterialDesignTextField($viewModel.textPermanentAddress,
                                                placeholder: viewModel.placeholderPermanentAddress,
                                                hint: $viewModel.hintPermanentAddress,
                                                editing: $editingTextFieldPermentAddress,
                                                valid: $viewModel.textPermanentCountryValid,
                                                BorderColor: $borderColor,
                                                placeholderImage: .constant("Student_Current_Address"))
                        .disableAutocorrection(true)
                        .onChange(of: viewModel.textPermanentAddress, perform: { newValue in
                            editingTextFieldPermentAddress = true
                        })
                        .onTapGesture {
                            editingTextFieldPermentAddress = true
                        }
                        .onSubmit {
                            editingTextFieldPermentAddress = true
                        }
                        .frame(width: UIScreen.main.bounds.width - 20, height: 50)
                        .padding(.bottom, 10)
                        
                        //Perment Country
                        Button {
                            searchTextPermentCountry = ""
                            ShowPermentCountryDropDown = true
                        } label: {
                            MaterialDesignTextEditorCountry($viewModel.textPermanentCountry,
                                                            placeholder: viewModel.placeholderPermanentCountry,
                                                            hint: $viewModel.hintPermanentCountry,
                                                            editing: $editingTextFieldPermentCountry,
                                                            valid: $viewModel.textPermanentCountryValid,
                                                            BorderColor: $borderColor)
                            .disabled(true)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.black )
                            .onChange(of: viewModel.textPermanentCountry, perform: { newValue in
                                editingTextFieldPermentCountry = false
                                ShowPermentCountryDropDown = false
                                ShowPermentStateDropDown = false
                                ShowPermentCityDropDown = false
                            })
                            .frame(width: UIScreen.main.bounds.width - 20, height: 60)
                            .onSubmit {
                                editingTextFieldPermentCountry = false
                                ShowPermentCountryDropDown = false
                                ShowPermentStateDropDown = false
                                ShowPermentCityDropDown = false
                            }
                        }
                        .padding(.bottom)
                        
                        if ShowPermentCountryDropDown{
                            VStack(alignment: .leading){
                                SearchBar(text: $searchTextPermentCountry)
                                    .frame(width: UIScreen.main.bounds.width - 50)
                                    .padding(.top)
                                    .padding(.leading, 5)
                                ForEach(searchResultsPermentCountry) { master in
                                    Button {
                                        viewModel.textPermanentCountry = master.name ?? ""
                                        self.permentCountryID = master.id ?? ""
                                        ShowPermentCountryDropDown = false
                                        ShowPermentStateDropDown = false
                                        ShowPermentCityDropDown = false
                                        viewModel.textPermanentState = ""
                                        self.permentStateId = ""
                                        viewModel.textPermanentCity = ""
                                        self.permentCityId = ""
                                        countryViewModel.fetchLoginDate(countryId: permentCountryID, stateId: permentStateId) { CountryData in
                                            arrStatePerment = CountryData.data?.states ?? []
                                            arrCityPerment = CountryData.data?.cities ?? []
                                        }
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
                        
                        //Perment State
                        
                        Button {
                            searchTextPermentState = ""
                            ShowPermentStateDropDown = true
                        } label: {
                            MaterialDesignTextEditorCountry($viewModel.textPermanentState,
                                                            placeholder: viewModel.placeholderPermanentState,
                                                            hint: $viewModel.hintPermanentState,
                                                            editing: $editingTextFieldPermentState,
                                                            valid: $viewModel.textPermanentStateValid,
                                                            BorderColor: $borderColor)
                            .disabled(true)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.black )
                            .onChange(of: viewModel.textPermanentState, perform: { newValue in
                                editingTextFieldPermentState = false
                                ShowPermentCountryDropDown = false
                                ShowPermentStateDropDown = false
                                ShowPermentCityDropDown = false
                            })
                            .frame(width: UIScreen.main.bounds.width - 20, height: 60)
                            .onSubmit {
                                editingTextFieldPermentState = false
                                ShowPermentCountryDropDown = false
                                ShowPermentStateDropDown = false
                                ShowPermentCityDropDown = false
                            }
                        }
                        .padding(.bottom)
                        
                        if !viewModel.textPermanentCountry.isEmpty{
                            if ShowPermentStateDropDown{
                                VStack(alignment: .leading){
                                    SearchBar(text: $searchTextPermentState)
                                        .frame(width: UIScreen.main.bounds.width - 50)
                                        .padding(.top)
                                        .padding(.leading, 5)
                                    ForEach(searchResultsPermentState) { master in
                                        Button {
                                            viewModel.textPermanentState = master.name ?? ""
                                            self.permentStateId = master.id ?? ""
                                            ShowPermentCountryDropDown = false
                                            ShowPermentStateDropDown = false
                                            ShowPermentCityDropDown = false
                                            viewModel.textPermanentCity = ""
                                            self.permentCityId = ""
                                            countryViewModel.fetchLoginDate(countryId: permentCountryID, stateId: permentStateId) { CountryData in
                                                arrStatePerment = CountryData.data?.states ?? []
                                                arrCityPerment = CountryData.data?.cities ?? []
                                            }
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
                        
                        //Perment City
                        
                        Button {
                            searchTextPermentCity = ""
                            ShowPermentCityDropDown = true
                        } label: {
                            MaterialDesignTextEditorCountry($viewModel.textPermanentCity,
                                                            placeholder: viewModel.placeholderPermanentCity,
                                                            hint: $viewModel.hintPermanentCity,
                                                            editing: $editingTextFieldPermentCity,
                                                            valid: $viewModel.textPermanentCityValid,
                                                            BorderColor: $borderColor)
                            .disabled(true)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.black )
                            .onChange(of: viewModel.textPermanentCity, perform: { newValue in
                                editingTextFieldPermentCity = false
                                ShowPermentCountryDropDown = false
                                ShowPermentStateDropDown = false
                                ShowPermentCityDropDown = false
                            })
                            .frame(width: UIScreen.main.bounds.width - 20, height: 60)
                            .onSubmit {
                                editingTextFieldPermentCity = false
                                ShowPermentCountryDropDown = false
                                ShowPermentStateDropDown = false
                                ShowPermentCityDropDown = false
                            }
                        }
                        .padding(.bottom)
                        
                        if !viewModel.textPermanentState.isEmpty{
                            if ShowPermentCityDropDown{
                                VStack(alignment: .leading){
                                    SearchBar(text: $searchTextPermentCity)
                                        .frame(width: UIScreen.main.bounds.width - 50)
                                        .padding(.top)
                                        .padding(.leading, 5)
                                    ForEach(searchResultsPermentCity) { master in
                                        Button {
                                            viewModel.textPermanentCity = master.name ?? ""
                                            self.permentCityId = master.id ?? ""
                                            ShowPermentCountryDropDown = false
                                            ShowPermentStateDropDown = false
                                            ShowPermentCityDropDown = false
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
                    NavigationLink("", destination: ParentsDetailsView(getIsEditable: "1").navigationBarHidden(true),isActive: $showPrentsDetails).isDetailLink(false)
                    VStack(alignment: .center){
                        Button {
                            showPrentsDetails = true
                        } label: {
                            DetailsViewBottom()
                        }
                    }
                    .padding(.bottom)
                }
            }
            .navigationBarHidden(true)
        }
        .onAppear(perform: delayText)
    }
    private func delayText() {
        // Delay of 0.5 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            masterViewModel.MasterGet { MasterData in
                arrGender = MasterData.data?.gender ?? []
                arrCountry = MasterData.data?.countries ?? []
                arrBloodGroup = MasterData.data?.bloodGroups ?? []
                arrCountryPerment = MasterData.data?.countries ?? []
                
                if getIsEditable == "1"{
                    canEditBloodGroup = true
                    canEditGender = true
                    canEditCurrentCountry = true
                    canEditCurrentState = true
                    canEditCurrentCity = true
                    canEditPermentCountry = true
                    canEditPermentState = true
                    canEditPermentCity = true
                }else{
                    canEditBloodGroup = false
                    canEditGender = false
                    canEditCurrentCountry = false
                    canEditCurrentState = false
                    canEditCurrentCity = false
                    canEditPermentCountry = false
                    canEditPermentState = false
                    canEditPermentCity = false
                }
                countryViewModel.fetchLoginDate(countryId: currentCountryID, stateId: currentStateId) { CountryData in
                    arrStateCurrent = CountryData.data?.states ?? []
                    arrCityCurrent = CountryData.data?.cities ?? []
                }
                countryViewModel.fetchLoginDate(countryId: permentCountryID, stateId: permentStateId) { CountryData in
                    arrStatePerment = CountryData.data?.states ?? []
                    arrCityPerment = CountryData.data?.cities ?? []
                }
            }
        }
    }
    @State private var editingTextFieldFirstName = false {
        didSet {
            viewModel.validateTextFirstName()
        }
    }
    @State private var editingTextFieldMiddleName = false {
        didSet {
            viewModel.validateTextMiddleName()
        }
    }
    @State private var editingTextFieldLastName = false {
        didSet {
            viewModel.validateTextLastName()
        }
    }
    @State private var editingTextFieldMobileNumber = false {
        didSet {
            viewModel.validateTextMobileNumber()
        }
    }
    @State private var editingTextFieldEmail = false {
        didSet {
            viewModel.validateTextEmail()
        }
    }
    @State private var editingTextFieldBloodGroup = false {
        didSet {
            viewModel.validateTextBloodGroup()
        }
    }
    @State private var editingTextFieldGender = false {
        didSet {
            viewModel.validateTextGender()
        }
    }
    @State private var editingTextFieldDOB = false {
        didSet {
            viewModel.validateTextDOB()
        }
    }
    @State private var editingTextFieldPOB = false {
        didSet {
            viewModel.validateTextPOB()
        }
    }
    @State private var editingTextFieldNationality = false {
        didSet {
            viewModel.validateTextNationality()
        }
    }
    @State private var editingTextFieldAadhar = false {
        didSet {
            viewModel.validateTextAadhar()
        }
    }
    @State private var editingTextFieldPan = false {
        didSet {
            viewModel.validateTextPan()
        }
    }
    @State private var editingTextFieldPassport = false {
        didSet {
            viewModel.validateTextPassport()
        }
    }
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
    @State private var editingTextFieldPermentAddress = false {
        didSet {
            viewModel.validateTextPermentAddress()
        }
    }
    @State private var editingTextFieldPermentCountry = false {
        didSet {
            viewModel.validateTextPermentCountry()
        }
    }
    @State private var editingTextFieldPermentState = false {
        didSet {
            viewModel.validateTextPermentState()
        }
    }
    @State private var editingTextFieldPermentCity = false {
        didSet {
            viewModel.validateTextPermentCity()
        }
    }
    
    //MARK: - Search Variable
    var searchResultsBloodGroup: [BloodGroup] {
        if searchTextBloodGroup.isEmpty {
            return arrBloodGroup
        } else {
            return arrBloodGroup.filter {
                $0.name!.contains(searchTextBloodGroup) ||
                $0.name!.lowercased().contains(searchTextBloodGroup) ||
                $0.name!.uppercased().contains(searchTextBloodGroup)
            }
        }
    }
    
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
    
    //Perment
    var searchResultsPermentCountry: [countries] {
        if searchTextPermentCountry.isEmpty {
            return arrCountryPerment
        } else {
            return arrCountryPerment.filter {
                $0.name!.contains(searchTextPermentCountry) ||
                $0.name!.lowercased().contains(searchTextPermentCountry) ||
                $0.name!.uppercased().contains(searchTextPermentCountry)
            }
        }
    }
    
    var searchResultsPermentState: [states] {
        if searchTextPermentState.isEmpty {
            return arrStatePerment
        } else {
            return arrStatePerment.filter {
                $0.name!.contains(searchTextPermentState) ||
                $0.name!.lowercased().contains(searchTextPermentState) ||
                $0.name!.uppercased().contains(searchTextPermentState)
            }
        }
    }
    
    var searchResultsPermentCity: [City] {
        if searchTextPermentCity.isEmpty {
            return arrCityPerment
        } else {
            return arrCityPerment.filter {
                $0.name!.contains(searchTextPermentCity) ||
                $0.name!.lowercased().contains(searchTextPermentCity) ||
                $0.name!.uppercased().contains(searchTextPermentCity)
            }
        }
    }
    
    //MARK: - ConvertDate Method
    func convertDate(){
        // Create Date Formatter
        let dateFormatter = DateFormatter()
        
        // Set Date Format
        dateFormatter.dateFormat = "dd/MM/yyyy"
        
        // Convert Date to String
        viewModel.textDOB =  dateFormatter.string(from: todayDate)
        print(viewModel.textDOB)
    }
    //MARK: - Show Date Picker
    func showDatePickerAlert() {
        let alertVC = UIAlertController(title: "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n", message: nil, preferredStyle: .actionSheet)
        let datePicker: UIDatePicker = UIDatePicker()
        
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .inline
        datePicker.maximumDate = Date()
        alertVC.view.addSubview(datePicker)
        datePicker.frame.size.width = UIScreen.main.bounds.width
        
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.todayDate = datePicker.date
            convertDate()
        }
        alertVC.addAction(okAction)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alertVC.addAction(cancelAction)
        
        if let viewController = UIApplication.shared.windows.first?.rootViewController {
            viewController.present(alertVC, animated: true, completion: nil)
        }
    }
}

struct StudentDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        StudentDetailsView(getIsEditable: "1")
    }
}
