//
//  EnrollmentDetailsView.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 30/03/23.
//

import SwiftUI

struct EnrollmentDetailsView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var viewModel = EnrollmentContentViewModel()
    @State private var borderColor = Color(hex: 0x685BC7)
    
    @State private var canEditSchool = false
    @State private var canEditProgram = false
    @State private var canEditDegree = false
    @State private var canEditSpeclization = false
    
    @StateObject private var masterViewModel = MasterViewModel()
    @State private var arrBloodGroup = [BloodGroup]()
    
    @State private var SchoolID = ""
    @State private var ProgramID = ""
    @State private var DegreeID = ""
    @State private var SpeclizationID = ""
    
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
                DetailsViewTop(Step: "3")
                    .padding(.bottom)
                
                VStack(alignment: .leading){
                    //Application Id
                    MaterialDesignTextField($viewModel.textApplicationID,
                                            placeholder: viewModel.placeholderApplicationID,
                                            hint: $viewModel.hintApplicationId,
                                            editing: $editingTextFieldApplicationId,
                                            valid: $viewModel.textApplicationIDValid,
                                            BorderColor: $borderColor,
                                            placeholderImage: .constant("Enrollment_Application_Id"))
                    .disableAutocorrection(true)
                    .onChange(of: viewModel.textApplicationID, perform: { newValue in
                        editingTextFieldApplicationId = false
                    })
                    .onTapGesture {
                        editingTextFieldApplicationId = false
                    }
                    .onSubmit {
                        editingTextFieldApplicationId = false
                    }
                    .frame(width: UIScreen.main.bounds.width - 20, height: 50)
                    .padding(.bottom, 10)
                    
                    
                    //School
                    Button {
                        canEditSchool = true
                    } label: {
                        if canEditSchool{
                            Menu {
                                ForEach(arrBloodGroup) { SchoolData in
                                    Button {
                                        viewModel.textSchool = SchoolData.name ?? ""
                                        self.SchoolID = SchoolData.id ?? ""
                                    } label: {
                                        Text(SchoolData.name ?? "")
                                    }
                                }
                            } label: {
                                MaterialDesignTextEditor($viewModel.textSchool,
                                                         placeholder: viewModel.placeholderSchool,
                                                         hint: $viewModel.hintSchool,
                                                         editing: $editingTextFieldSchool,
                                                         valid: $viewModel.textSchoolValid,
                                                         BorderColor: $borderColor,
                                                         placeholderImage: .constant("Enrollment_School"))
                                .disabled(true)
                                .multilineTextAlignment(.leading)
                                .foregroundColor(.black )
                                .onChange(of: viewModel.textSchool, perform: { newValue in
                                    editingTextFieldSchool = false
                                })
                                .frame(width: UIScreen.main.bounds.width - 20, height: 60)
                                .onTapGesture {
                                    editingTextFieldSchool = false
                                }
                                .onSubmit {
                                    editingTextFieldSchool = false
                                }
                            }
                            .padding(.bottom)
                        }else{
                            MaterialDesignTextEditor($viewModel.textSchool,
                                                     placeholder: viewModel.placeholderSchool,
                                                     hint: $viewModel.hintSchool,
                                                     editing: $editingTextFieldSchool,
                                                     valid: $viewModel.textSchoolValid,
                                                     BorderColor: $borderColor,
                                                     placeholderImage: .constant("Enrollment_School"))
                            .disabled(true)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.black)
                            .onChange(of: viewModel.textSchool, perform: { newValue in
                                editingTextFieldSchool = true
                                canEditSchool = true
                            })
                            .frame(width: UIScreen.main.bounds.width - 20, height: 60)
                            .onTapGesture {
                                editingTextFieldSchool = true
                                canEditSchool = true
                            }
                            .onSubmit {
                                editingTextFieldSchool = true
                                canEditSchool = true
                            }
                            .padding(.bottom)
                        }
                    }
                    
                    //Program
                    Button {
                        canEditProgram = true
                    } label: {
                        if canEditProgram{
                            Menu {
                                ForEach(arrBloodGroup) { SchoolData in
                                    Button {
                                        viewModel.textProgram = SchoolData.name ?? ""
                                        self.ProgramID = SchoolData.id ?? ""
                                    } label: {
                                        Text(SchoolData.name ?? "")
                                    }
                                }
                            } label: {
                                MaterialDesignTextEditor($viewModel.textProgram,
                                                         placeholder: viewModel.placeholderProgram,
                                                         hint: $viewModel.hintProgram,
                                                         editing: $editingTextFieldProgram,
                                                         valid: $viewModel.textProgramValid,
                                                         BorderColor: $borderColor,
                                                         placeholderImage: .constant("Enrollment_Program"))
                                .disabled(true)
                                .multilineTextAlignment(.leading)
                                .foregroundColor(.black )
                                .onChange(of: viewModel.textProgram, perform: { newValue in
                                    editingTextFieldProgram = false
                                })
                                .frame(width: UIScreen.main.bounds.width - 20, height: 60)
                                .onTapGesture {
                                    editingTextFieldProgram = false
                                }
                                .onSubmit {
                                    editingTextFieldProgram = false
                                }
                            }
                            .padding(.bottom)
                        }else{
                            MaterialDesignTextEditor($viewModel.textProgram,
                                                     placeholder: viewModel.placeholderProgram,
                                                     hint: $viewModel.hintProgram,
                                                     editing: $editingTextFieldProgram,
                                                     valid: $viewModel.textProgramValid,
                                                     BorderColor: $borderColor,
                                                     placeholderImage: .constant("Enrollment_Program"))
                            .disabled(true)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.black)
                            .onChange(of: viewModel.textProgram, perform: { newValue in
                                editingTextFieldProgram = true
                                canEditProgram = true
                            })
                            .frame(width: UIScreen.main.bounds.width - 20, height: 60)
                            .onTapGesture {
                                editingTextFieldProgram = true
                                canEditProgram = true
                            }
                            .onSubmit {
                                editingTextFieldProgram = true
                                canEditProgram = true
                            }
                            .padding(.bottom)
                        }
                    }
                    
                    //Degree
                    Button {
                        canEditDegree = true
                    } label: {
                        if canEditDegree{
                            Menu {
                                ForEach(arrBloodGroup) { SchoolData in
                                    Button {
                                        viewModel.textDegree = SchoolData.name ?? ""
                                        self.DegreeID = SchoolData.id ?? ""
                                    } label: {
                                        Text(SchoolData.name ?? "")
                                    }
                                }
                            } label: {
                                MaterialDesignTextEditor($viewModel.textDegree,
                                                         placeholder: viewModel.placeholderDegree,
                                                         hint: $viewModel.hintDegree,
                                                         editing: $editingTextFieldDegree,
                                                         valid: $viewModel.textDegreeValid,
                                                         BorderColor: $borderColor,
                                                         placeholderImage: .constant("Enrollment_Degree"))
                                .disabled(true)
                                .multilineTextAlignment(.leading)
                                .foregroundColor(.black )
                                .onChange(of: viewModel.textDegree, perform: { newValue in
                                    editingTextFieldDegree = false
                                })
                                .frame(width: UIScreen.main.bounds.width - 20, height: 60)
                                .onTapGesture {
                                    editingTextFieldDegree = false
                                }
                                .onSubmit {
                                    editingTextFieldDegree = false
                                }
                            }
                            .padding(.bottom)
                        }else{
                            MaterialDesignTextEditor($viewModel.textDegree,
                                                     placeholder: viewModel.placeholderDegree,
                                                     hint: $viewModel.hintDegree,
                                                     editing: $editingTextFieldDegree,
                                                     valid: $viewModel.textDegreeValid,
                                                     BorderColor: $borderColor,
                                                     placeholderImage: .constant("Enrollment_Degree"))
                            .disabled(true)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.black)
                            .onChange(of: viewModel.textDegree, perform: { newValue in
                                editingTextFieldDegree = true
                                canEditDegree = true
                            })
                            .frame(width: UIScreen.main.bounds.width - 20, height: 60)
                            .onTapGesture {
                                editingTextFieldDegree = true
                                canEditDegree = true
                            }
                            .onSubmit {
                                editingTextFieldDegree = true
                                canEditDegree = true
                            }
                            .padding(.bottom)
                        }
                    }
                    
                    //Speclization
                    Button {
                        canEditSpeclization = true
                    } label: {
                        if canEditSpeclization{
                            Menu {
                                ForEach(arrBloodGroup) { SchoolData in
                                    Button {
                                        viewModel.textSpeclization = SchoolData.name ?? ""
                                        self.SpeclizationID = SchoolData.id ?? ""
                                    } label: {
                                        Text(SchoolData.name ?? "")
                                    }
                                }
                            } label: {
                                MaterialDesignTextEditor($viewModel.textSpeclization,
                                                         placeholder: viewModel.placeholderSpeclization,
                                                         hint: $viewModel.hintSpeclization,
                                                         editing: $editingTextFieldSpeclization,
                                                         valid: $viewModel.textSpeclizationValid,
                                                         BorderColor: $borderColor,
                                                         placeholderImage: .constant("Enrollment_Speclizatiom"))
                                .disabled(true)
                                .multilineTextAlignment(.leading)
                                .foregroundColor(.black )
                                .onChange(of: viewModel.textSpeclization, perform: { newValue in
                                    editingTextFieldSpeclization = false
                                })
                                .frame(width: UIScreen.main.bounds.width - 20, height: 60)
                                .onTapGesture {
                                    editingTextFieldSpeclization = false
                                }
                                .onSubmit {
                                    editingTextFieldSpeclization = false
                                }
                            }
                            .padding(.bottom)
                        }else{
                            MaterialDesignTextEditor($viewModel.textSpeclization,
                                                     placeholder: viewModel.placeholderSpeclization,
                                                     hint: $viewModel.hintSpeclization,
                                                     editing: $editingTextFieldSpeclization,
                                                     valid: $viewModel.textSpeclizationValid,
                                                     BorderColor: $borderColor,
                                                     placeholderImage: .constant("Enrollment_Speclizatiom"))
                            .disabled(true)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.black)
                            .onChange(of: viewModel.textSpeclization, perform: { newValue in
                                editingTextFieldSpeclization = true
                                canEditSpeclization = true
                            })
                            .frame(width: UIScreen.main.bounds.width - 20, height: 60)
                            .onTapGesture {
                                editingTextFieldSpeclization = true
                                canEditSpeclization = true
                            }
                            .onSubmit {
                                editingTextFieldSpeclization = true
                                canEditSpeclization = true
                            }
                            .padding(.bottom)
                        }
                    }
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
                arrBloodGroup = MasterData.data?.bloodGroups ?? []
                
                if getIsEditable == "1"{
                    canEditSchool = true
                    canEditProgram = true
                    canEditDegree = true
                    canEditSpeclization = true
                }else{
                    canEditSchool = false
                    canEditProgram = false
                    canEditDegree = false
                    canEditSpeclization = false
                }
            }
        }
    }
    @State private var editingTextFieldApplicationId = false {
        didSet {
            viewModel.validateTextApplicationId()
        }
    }
    @State private var editingTextFieldSchool = false {
        didSet {
            viewModel.validateTextSchool()
        }
    }
    @State private var editingTextFieldProgram = false {
        didSet {
            viewModel.validateTextProgram()
        }
    }
    @State private var editingTextFieldDegree = false {
        didSet {
            viewModel.validateTextDegree()
        }
    }
    @State private var editingTextFieldSpeclization = false {
        didSet {
            viewModel.validateTextSpeclization()
        }
    }
}


struct EnrollmentDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        EnrollmentDetailsView(getIsEditable: "1")
    }
}
