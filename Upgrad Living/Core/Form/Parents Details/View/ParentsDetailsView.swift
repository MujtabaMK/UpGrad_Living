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
    
    var getIsEditable: String
    var body: some View {
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
            Divider()
            ScrollView(showsIndicators: false){
                DetailsViewTop(Step: "2")
                    .padding(.bottom)
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
                VStack{
                    Text("Guardian’s Details (If Applicable)")
                        .foregroundColor(.white)
                        .font(.custom(OpenSans_Bold, size: 16))
                        .padding(8)
                        .frame(width: UIScreen.main.bounds.width - 20)
                        .background(Color(hex: 0x00B2BA))
                        .padding(.bottom, 8)
                }
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
                        canEditCurrentCountry = true
                    } label: {
                        if canEditCurrentCountry{
                            Menu {
                                ForEach(arrCountry) { SchoolData in
                                    Button {
                                        viewModel.textCurrentCountry = SchoolData.name ?? ""
                                        self.currentCountryID = SchoolData.id ?? ""
                                        countryViewModel.fetchLoginDate(countryId: currentCountryID, stateId: currentStateId) { CountryData in
                                            arrStateCurrent = CountryData.data?.states ?? []
                                            arrCityCurrent = CountryData.data?.cities ?? []
                                        }
                                    } label: {
                                        Text(SchoolData.name ?? "")
                                    }
                                }
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
                                })
                                .frame(width: UIScreen.main.bounds.width - 20, height: 60)
                                .onTapGesture {
                                    editingTextFieldCurrentCountry = false
                                }
                                .onSubmit {
                                    editingTextFieldCurrentCountry = false
                                }
                            }
                            .padding(.bottom)
                        }else{
                            MaterialDesignTextEditorCountry($viewModel.textCurrentCountry,
                                                     placeholder: viewModel.placeholderCurrentCountry,
                                                     hint: $viewModel.hintCurrentCountry,
                                                     editing: $editingTextFieldCurrentCountry,
                                                     valid: $viewModel.textCurrentCountryValid,
                                                     BorderColor: $borderColor)
                            .disabled(true)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.black)
                            .onChange(of: viewModel.textCurrentCountry, perform: { newValue in
                                editingTextFieldCurrentCountry = true
                                canEditCurrentCountry = true
                            })
                            .frame(width: UIScreen.main.bounds.width - 20, height: 60)
                            .onTapGesture {
                                editingTextFieldCurrentCountry = true
                                canEditCurrentCountry = true
                            }
                            .onSubmit {
                                editingTextFieldCurrentCountry = true
                                canEditCurrentCountry = true
                            }
                            .padding(.bottom)
                        }
                    }
                    
                    //Current State
                    Button {
                        canEditCurrentState = true
                    } label: {
                        if canEditCurrentState{
                            Menu {
                                ForEach(arrStateCurrent) { SchoolData in
                                    Button {
                                        viewModel.textCurrentState = SchoolData.name ?? ""
                                        self.currentStateId = SchoolData.id ?? ""
                                        countryViewModel.fetchLoginDate(countryId: currentCountryID, stateId: currentStateId) { CountryData in
                                            arrStateCurrent = CountryData.data?.states ?? []
                                            arrCityCurrent = CountryData.data?.cities ?? []
                                        }
                                    } label: {
                                        Text(SchoolData.name ?? "")
                                    }
                                }
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
                                })
                                .frame(width: UIScreen.main.bounds.width - 20, height: 60)
                                .onTapGesture {
                                    editingTextFieldCurrentState = false
                                }
                                .onSubmit {
                                    editingTextFieldCurrentState = false
                                }
                            }
                            .padding(.bottom)
                        }else{
                            MaterialDesignTextEditorCountry($viewModel.textCurrentState,
                                                     placeholder: viewModel.placeholderCurrentState,
                                                     hint: $viewModel.hintCurrentState,
                                                     editing: $editingTextFieldCurrentCountry,
                                                     valid: $viewModel.textCurrentStateValid,
                                                     BorderColor: $borderColor)
                            .disabled(true)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.black)
                            .onChange(of: viewModel.textCurrentState, perform: { newValue in
                                editingTextFieldCurrentState = true
                                canEditCurrentState = true
                            })
                            .frame(width: UIScreen.main.bounds.width - 20, height: 60)
                            .onTapGesture {
                                editingTextFieldCurrentState = true
                                canEditCurrentState = true
                            }
                            .onSubmit {
                                editingTextFieldCurrentState = true
                                canEditCurrentState = true
                            }
                            .padding(.bottom)
                        }
                    }
                    
                    //Current City
                    Button {
                        canEditCurrentCity = true
                    } label: {
                        if canEditCurrentCity{
                            Menu {
                                ForEach(arrCityCurrent) { SchoolData in
                                    Button {
                                        viewModel.textCurrentCity = SchoolData.name ?? ""
                                        self.currentCityId = SchoolData.id ?? ""
                                        countryViewModel.fetchLoginDate(countryId: currentCountryID, stateId: currentStateId) { CountryData in
                                            arrStateCurrent = CountryData.data?.states ?? []
                                            arrCityCurrent = CountryData.data?.cities ?? []
                                        }
                                    } label: {
                                        Text(SchoolData.name ?? "")
                                    }
                                }
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
                                })
                                .frame(width: UIScreen.main.bounds.width - 20, height: 60)
                                .onTapGesture {
                                    editingTextFieldCurrentCity = false
                                }
                                .onSubmit {
                                    editingTextFieldCurrentCity = false
                                }
                            }
                            .padding(.bottom)
                        }else{
                            MaterialDesignTextEditorCountry($viewModel.textCurrentCity,
                                                     placeholder: viewModel.placeholderCurrentCity,
                                                     hint: $viewModel.hintCurrentCity,
                                                     editing: $editingTextFieldCurrentCity,
                                                     valid: $viewModel.textCurrentCityValid,
                                                     BorderColor: $borderColor)
                            .disabled(true)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.black)
                            .onChange(of: viewModel.textCurrentCity, perform: { newValue in
                                editingTextFieldCurrentCity = true
                                canEditCurrentCity = true
                            })
                            .frame(width: UIScreen.main.bounds.width - 20, height: 60)
                            .onTapGesture {
                                editingTextFieldCurrentCity = true
                                canEditCurrentCity = true
                            }
                            .onSubmit {
                                editingTextFieldCurrentCity = true
                                canEditCurrentCity = true
                            }
                            .padding(.bottom)
                        }
                    }
                    
                   
                }
                VStack(alignment: .leading){
                    //Guardian Pin Code
                    MaterialDesignTextFieldwithoutImage($viewModel.textCurrentPincode,
                                            placeholder: viewModel.placeholderCurrentPincode,
                                            hint: $viewModel.hintCurrentPincode,
                                            editing: $editingTextFieldCurrentPinCode,
                                            valid: $viewModel.textCurrentPincodeValid,
                                            BorderColor: $borderColor)
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
                VStack(alignment: .center){
                    Button {
                        
                    } label: {
                        DetailsViewBottom()
                    }
                }
            }
        }
        .onAppear{
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
}

struct ParentsDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ParentsDetailsView(getIsEditable: "1")
    }
}
