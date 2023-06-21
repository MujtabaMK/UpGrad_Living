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
    @StateObject private var submitViewModel = SubmitEnrollmentViewModel()
    @StateObject private var GetViewModel = GetFormViewModel()
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @State private var borderColor = Color(hex: 0x685BC7)
    
    @State private var canEditSchool = false
    @State private var canEditProgram = false
    @State private var canEditDegree = false
    @State private var canEditSpeclization = false
    
    @StateObject private var schoolViewModel = SchoolViewModel()
    @EnvironmentObject var networkMonitor: NetworkMonitor
    @State private var arrSchool = [School]()
    @State private var arrProgram = [Program]()
    @State private var arrDegree = [Degree]()
    @State private var arrSpeclization = [Specialization]()
    
    @State private var SchoolID = ""
    @State private var ProgramID = ""
    @State private var DegreeID = ""
    @State private var SpeclizationID = ""
    
    
    //Current
    @State private var searchTextSchool = ""
    @State private var ShowSchoolDropDown = false
    
    @State private var searchTextProgram = ""
    @State private var ShowProgramDropDown = false
    
    @State private var searchTextDegree = ""
    @State private var ShowDegreeDropDown = false
    
    @State private var searchTextSpeclization = ""
    @State private var ShowSpeclizationDropDown = false
    
    @State private var showRoomType = false
    
    @State private var alertMessage = String()
    @State private var showingAlert = false
    @State private var AlertShow = String()
    
    @State private var isButtonClick = false
    
    @State private var studentAppID = UserDefaults.standard.string(forKey: "studentAppID")
    @FocusState private var focusedField: FoucesedEnrollmentTextField?
    
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
                            .disabled(true)
                            .disableAutocorrection(true)
                            .onChange(of: viewModel.textApplicationID, perform: { newValue in
                                editingTextFieldApplicationId = true
                            })
                            .onTapGesture {
                                editingTextFieldApplicationId = true
                            }
                            .onSubmit {
                                editingTextFieldApplicationId = true
                            }
                            .frame(width: UIScreen.main.bounds.width - 20, height: 50)
                            .padding(.bottom, 10)
                            
                            
                            //School
                            Button {
                                searchTextSchool = ""
                                ShowSchoolDropDown = true
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
                                .foregroundColor(colorScheme == .light ? .black : .white)
                                .onChange(of: viewModel.textSchool, perform: { newValue in
                                    editingTextFieldSchool = false
                                    ShowSchoolDropDown = false
                                    ShowProgramDropDown = false
                                    //ShowDegreeDropDown = false
                                    //ShowSpeclizationDropDown = false
                                })
                                .frame(width: UIScreen.main.bounds.width - 20, height: 80)
                                .onSubmit {
                                    editingTextFieldSchool = false
                                    ShowSchoolDropDown = false
                                    ShowProgramDropDown = false
                                    //ShowDegreeDropDown = false
                                    //ShowSpeclizationDropDown = false
                                }
                            }
                            .padding(.bottom)
                            
                            if ShowSchoolDropDown{
                                VStack(alignment: .leading){
                                    SearchBar(text: $searchTextSchool)
                                        .frame(width: UIScreen.main.bounds.width - 50)
                                        .padding(.top)
                                        .padding(.leading, 5)
                                    ForEach(searchResultsSchool) { master in
                                        Button {
                                            viewModel.textSchool = master.schoolFullName ?? ""
                                            self.SchoolID = master.schoolID ?? ""
                                            viewModel.textProgram = ""
                                            self.ProgramID = ""
                                            viewModel.textDegree = ""
                                            self.DegreeID = ""
                                            viewModel.textSpeclization = ""
                                            self.SpeclizationID = ""
                                            
                                            schoolViewModel.fetchLoginDate(schoolId: SchoolID, programId: ProgramID, degreeId: DegreeID) { SchoolData in
                                                arrSchool = SchoolData.data?.school ?? []
                                                arrProgram = SchoolData.data?.program ?? []
                                                //arrDegree = SchoolData.data?.degree ?? []
                                                // arrSpeclization = SchoolData.data?.specialization ?? []
                                            }
                                            ShowSchoolDropDown = false
                                            ShowProgramDropDown = false
                                            // ShowDegreeDropDown = false
                                            // ShowSpeclizationDropDown = false
                                        } label: {
                                            Text(master.schoolFullName ?? "")
                                                .padding(5)
                                                .padding(.leading, 5)
                                                .foregroundColor(colorScheme == .light ? .black : .white)
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
                            
                            //Program
                            Button {
                                searchTextProgram = ""
                                ShowProgramDropDown = true
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
                                .foregroundColor(colorScheme == .light ? .black : .white)
                                .onChange(of: viewModel.textProgram, perform: { newValue in
                                    editingTextFieldProgram = false
                                    ShowSchoolDropDown = false
                                    ShowProgramDropDown = false
                                    //ShowDegreeDropDown = false
                                    //ShowSpeclizationDropDown = false
                                })
                                .frame(width: UIScreen.main.bounds.width - 20, height: 60)
                                .onSubmit {
                                    editingTextFieldProgram = false
                                    ShowSchoolDropDown = false
                                    ShowProgramDropDown = false
                                    // ShowDegreeDropDown = false
                                    // ShowSpeclizationDropDown = false
                                }
                            }
                            .padding(.bottom)
                            
                            if ShowProgramDropDown{
                                VStack(alignment: .leading){
                                    SearchBar(text: $searchTextProgram)
                                        .frame(width: UIScreen.main.bounds.width - 50)
                                        .padding(.top)
                                        .padding(.leading, 5)
                                    ForEach(searchResultsProgram) { master in
                                        Button {
                                            viewModel.textProgram = master.certificationShortName ?? ""
                                            self.ProgramID = master.certificationID ?? ""
                                            viewModel.textDegree = ""
                                            self.DegreeID = ""
                                            viewModel.textSpeclization = ""
                                            self.SpeclizationID = ""
                                            
                                            schoolViewModel.fetchLoginDate(schoolId: SchoolID, programId: ProgramID, degreeId: DegreeID) { SchoolData in
                                                arrSchool = SchoolData.data?.school ?? []
                                                arrProgram = SchoolData.data?.program ?? []
                                                //arrDegree = SchoolData.data?.degree ?? []
                                                //arrSpeclization = SchoolData.data?.specialization ?? []
                                            }
                                            ShowSchoolDropDown = false
                                            ShowProgramDropDown = false
                                            //ShowDegreeDropDown = false
                                            //ShowSpeclizationDropDown = false
                                        } label: {
                                            Text(master.certificationShortName ?? "")
                                                .padding(5)
                                                .padding(.leading, 5)
                                                .foregroundColor(colorScheme == .light ? .black : .white)
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
                            
                            //                        //Degree
                            //                        Button {
                            //                            searchTextDegree = ""
                            //                            ShowDegreeDropDown = true
                            //                        } label: {
                            //                            MaterialDesignTextEditor($viewModel.textDegree,
                            //                                                     placeholder: viewModel.placeholderDegree,
                            //                                                     hint: $viewModel.hintDegree,
                            //                                                     editing: $editingTextFieldDegree,
                            //                                                     valid: $viewModel.textDegreeValid,
                            //                                                     BorderColor: $borderColor,
                            //                                                     placeholderImage: .constant("Enrollment_Degree"))
                            //                            .disabled(true)
                            //                            .multilineTextAlignment(.leading)
                            //                            .foregroundColor(.black )
                            //                            .onChange(of: viewModel.textDegree, perform: { newValue in
                            //                                editingTextFieldDegree = false
                            //                                ShowSchoolDropDown = false
                            //                                ShowProgramDropDown = false
                            //                                ShowDegreeDropDown = false
                            //                                ShowSpeclizationDropDown = false
                            //                            })
                            //                            .frame(width: UIScreen.main.bounds.width - 20, height: 60)
                            //                            .onSubmit {
                            //                                editingTextFieldDegree = false
                            //                                ShowSchoolDropDown = false
                            //                                ShowProgramDropDown = false
                            //                                ShowDegreeDropDown = false
                            //                                ShowSpeclizationDropDown = false
                            //                            }
                            //                        }
                            //                        .padding(.bottom)
                            //
                            //                        if ShowDegreeDropDown{
                            //                            VStack(alignment: .leading){
                            //                                SearchBar(text: $searchTextDegree)
                            //                                    .frame(width: UIScreen.main.bounds.width - 50)
                            //                                    .padding(.top)
                            //                                    .padding(.leading, 5)
                            //                                ForEach(searchResultsDegree) { master in
                            //                                    Button {
                            //                                        viewModel.textDegree = master.abbrivation ?? ""
                            //                                        self.DegreeID = master.id ?? ""
                            //                                        viewModel.textSpeclization = ""
                            //                                        self.SpeclizationID = ""
                            //
                            //                                        schoolViewModel.fetchLoginDate(schoolId: SchoolID, programId: ProgramID, degreeId: DegreeID) { SchoolData in
                            //                                            arrSchool = SchoolData.data?.school ?? []
                            //                                            arrProgram = SchoolData.data?.program ?? []
                            //                                            arrDegree = SchoolData.data?.degree ?? []
                            //                                            arrSpeclization = SchoolData.data?.specialization ?? []
                            //                                        }
                            //                                        ShowSchoolDropDown = false
                            //                                        ShowProgramDropDown = false
                            //                                        ShowDegreeDropDown = false
                            //                                        ShowSpeclizationDropDown = false
                            //                                    } label: {
                            //                                        Text(master.abbrivation ?? "")
                            //                                            .padding(5)
                            //                                            .padding(.leading, 5)
                            //                                            .foregroundColor(.black)
                            //                                            .frame(width: UIScreen.main.bounds.width - 20,alignment: .leading)
                            //                                    }
                            //                                }
                            //                            }
                            //                            .overlay(
                            //                                RoundedRectangle(
                            //                                    cornerRadius: 4).strokeBorder(borderColor,
                            //                                                                  style: StrokeStyle(lineWidth: 1.0))
                            //                            )
                            //                            .padding(.bottom)
                            //                        }
                            //
                            //                        //Speclization
                            //                        Button {
                            //                            searchTextSpeclization = ""
                            //                            ShowSpeclizationDropDown = true
                            //                        } label: {
                            //                            MaterialDesignTextEditor($viewModel.textSpeclization,
                            //                                                     placeholder: viewModel.placeholderSpeclization,
                            //                                                     hint: $viewModel.hintSpeclization,
                            //                                                     editing: $editingTextFieldSpeclization,
                            //                                                     valid: $viewModel.textSpeclizationValid,
                            //                                                     BorderColor: $borderColor,
                            //                                                     placeholderImage: .constant("Enrollment_Speclizatiom"))
                            //                            .disabled(true)
                            //                            .multilineTextAlignment(.leading)
                            //                            .foregroundColor(.black )
                            //                            .onChange(of: viewModel.textSpeclization, perform: { newValue in
                            //                                editingTextFieldSpeclization = false
                            //                                ShowSchoolDropDown = false
                            //                                ShowProgramDropDown = false
                            //                                ShowDegreeDropDown = false
                            //                                ShowSpeclizationDropDown = false
                            //                            })
                            //                            .frame(width: UIScreen.main.bounds.width - 20, height: 60)
                            //                            .onSubmit {
                            //                                editingTextFieldSpeclization = false
                            //                                ShowSchoolDropDown = false
                            //                                ShowProgramDropDown = false
                            //                                ShowDegreeDropDown = false
                            //                                ShowSpeclizationDropDown = false
                            //                            }
                            //                        }
                            //                        .padding(.bottom)
                            //
                            //                        if ShowSpeclizationDropDown{
                            //                            VStack(alignment: .leading){
                            //                                SearchBar(text: $searchTextSpeclization)
                            //                                    .frame(width: UIScreen.main.bounds.width - 50)
                            //                                    .padding(.top)
                            //                                    .padding(.leading, 5)
                            //                                ForEach(searchResultsSpeclization) { master in
                            //                                    Button {
                            //                                        viewModel.textSpeclization = master.specialisationName ?? ""
                            //                                        self.SpeclizationID = master.specialisationID ?? ""
                            //
                            //                                        schoolViewModel.fetchLoginDate(schoolId: SchoolID, programId: ProgramID, degreeId: DegreeID) { SchoolData in
                            //                                            arrSchool = SchoolData.data?.school ?? []
                            //                                            arrProgram = SchoolData.data?.program ?? []
                            //                                            arrDegree = SchoolData.data?.degree ?? []
                            //                                            arrSpeclization = SchoolData.data?.specialization ?? []
                            //                                        }
                            //                                        ShowSchoolDropDown = false
                            //                                        ShowProgramDropDown = false
                            //                                        ShowDegreeDropDown = false
                            //                                        ShowSpeclizationDropDown = false
                            //                                    } label: {
                            //                                        Text(master.specialisationName ?? "")
                            //                                            .padding(5)
                            //                                            .padding(.leading, 5)
                            //                                            .foregroundColor(.black)
                            //                                            .frame(width: UIScreen.main.bounds.width - 20,alignment: .leading)
                            //                                    }
                            //                                }
                            //                            }
                            //                            .overlay(
                            //                                RoundedRectangle(
                            //                                    cornerRadius: 4).strokeBorder(borderColor,
                            //                                                                  style: StrokeStyle(lineWidth: 1.0))
                            //                            )
                            //                            .padding(.bottom)
                            //                        }
                        }
                        NavigationLink("", destination: RoomTypeView().navigationBarHidden(true),isActive: $showRoomType).isDetailLink(false)
                        VStack(alignment: .center){
                            DetailsViewBottom(textName: "Save & Continue", imageName: "Form_Button_icon_Step3")
                                .onTapGesture {
                                    isButtonClick = true
                                    if viewModel.hintApplicationId != "Success"{
                                        alertMessage = "Please Enter Application Id"
                                        AlertShow = "0"
                                        focusedField = .applicationid
                                        showingAlert = true
                                    }else if viewModel.hintSchool != "Success"{
                                        alertMessage = "Please Select School"
                                        AlertShow = "0"
                                        showingAlert = true
                                    }else if viewModel.hintProgram != "Success"{
                                        alertMessage = "Please Select Program"
                                        AlertShow = "0"
                                        showingAlert = true
                                    }else{
                                        if networkMonitor.isConnected{
                                            submitViewModel.fetchLoginDate(
                                                school: SchoolID,
                                                program: ProgramID,
                                                degree: DegreeID,
                                                specialization: SpeclizationID,
                                                appId: studentAppID ?? "") { EnrollmentData in
                                                    if EnrollmentData.status == 1{
                                                        showRoomType = true
                                                    }else{
                                                        alertMessage = EnrollmentData.msg ?? ""
                                                        AlertShow = "0"
                                                        showingAlert = true
                                                    }
                                                }
                                        }else{
                                            alertMessage = "Please Check Your Internet Connection"
                                            showingAlert = true
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
                        showRoomType = true
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
            viewModel.textApplicationID = studentAppID ?? ""
            if networkMonitor.isConnected{
                schoolViewModel.fetchLoginDate(schoolId: SchoolID, programId: ProgramID, degreeId: DegreeID) { SchoolData in
                    arrSchool = SchoolData.data?.school ?? []
                    arrProgram = SchoolData.data?.program ?? []
                    //                arrDegree = SchoolData.data?.degree ?? []
                    //                arrSpeclization = SchoolData.data?.specialization ?? []
                    //
                    //                if getIsEditable == "1"{
                    //                    canEditSchool = true
                    //                    canEditProgram = true
                    //                    canEditDegree = true
                    //                    canEditSpeclization = true
                    //                }else{
                    //                    canEditSchool = false
                    //                    canEditProgram = false
                    //                    canEditDegree = false
                    //                    canEditSpeclization = false
                    //                }
                }
                GetViewModel.fetchLoginDate(appId: studentAppID ?? "") { formData in
                    if formData.status == 1{
                        viewModel.textSchool = formData.data?.schoolName ?? ""
                        SchoolID = formData.data?.school ?? ""
                        viewModel.textProgram = formData.data?.programName ?? ""
                        ProgramID = formData.data?.program ?? ""
                    }
                }
            }else{
                alertMessage = "Please Check Your Internet Connection"
                showingAlert = true
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
    //    @State private var editingTextFieldDegree = false {
    //        didSet {
    //            viewModel.validateTextDegree()
    //        }
    //    }
    //    @State private var editingTextFieldSpeclization = false {
    //        didSet {
    //            viewModel.validateTextSpeclization()
    //        }
    //    }
    
    //MARK: - Search Variable
    
    //Current
    var searchResultsSchool: [School] {
        if searchTextSchool.isEmpty {
            return arrSchool
        } else {
            return arrSchool.filter {
                $0.schoolFullName!.contains(searchTextSchool) ||
                $0.schoolFullName!.lowercased().contains(searchTextSchool) ||
                $0.schoolFullName!.uppercased().contains(searchTextSchool)
            }
        }
    }
    
    var searchResultsProgram: [Program] {
        if searchTextProgram.isEmpty {
            return arrProgram
        } else {
            return arrProgram.filter {
                $0.certificationShortName!.contains(searchTextProgram) ||
                $0.certificationShortName!.lowercased().contains(searchTextProgram) ||
                $0.certificationShortName!.uppercased().contains(searchTextProgram)
            }
        }
    }
    
    //    var searchResultsDegree: [Degree] {
    //        if searchTextDegree.isEmpty {
    //            return arrDegree
    //        } else {
    //            return arrDegree.filter {
    //                $0.abbrivation!.contains(searchTextDegree) ||
    //                $0.abbrivation!.lowercased().contains(searchTextDegree) ||
    //                $0.abbrivation!.uppercased().contains(searchTextDegree)
    //            }
    //        }
    //    }
    //
    //    var searchResultsSpeclization: [Specialization] {
    //        if searchTextSpeclization.isEmpty {
    //            return arrSpeclization
    //        } else {
    //            return arrSpeclization.filter {
    //                $0.specialisationName!.contains(searchTextSpeclization) ||
    //                $0.specialisationName!.lowercased().contains(searchTextSpeclization) ||
    //                $0.specialisationName!.uppercased().contains(searchTextSpeclization)
    //            }
    //        }
    //    }
}

struct EnrollmentDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        EnrollmentDetailsView(getIsEditable: "1")
    }
}
