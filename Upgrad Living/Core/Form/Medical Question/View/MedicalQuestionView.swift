//
//  MedicalQuestionView.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 30/03/23.
//

import SwiftUI

struct MedicalQuestionView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var borderColor = Color(hex: 0xE75798)
    
    //TextField
    @State private var txtfoodOther = ""
    @State private var txtFoodAllergies = ""
    @State private var txthealthDisability = ""
    @State private var txthealthTakingMedication = ""
    @State private var txthealthAllergies = ""
    @State private var txthealthSurgery = ""
    @State private var txtdiabetes = ""
    @State private var txthypertension = ""
    @State private var txtrespiratory = ""
    @State private var txtthyroid = ""
    @State private var txthivAids = ""
    @State private var txtAnyBlood = ""
    @State private var txtliver = ""
    @State private var txtheart = ""
    @State private var txtarthritis = ""
    @State private var txtkidney = ""
    @State private var txtparalysis = ""
    @State private var txtcongenital = ""
    @State private var txtphysicalHandicaps = ""
    @State private var txtanyOtherDisease = ""
    @State private var txttestedPositive = ""
    @State private var txtBothDoses = ""
    
    //Selection
    @State private var foodPrefrence = ""
    @State private var foodAllergies = ""
    @State private var healthDisability = ""
    @State private var healthTakingMedication = ""
    @State private var healthAllergies = ""
    @State private var healthSurgery = ""
    @State private var diabetes = ""
    @State private var hypertension = ""
    @State private var respiratory = ""
    @State private var thyroid = ""
    @State private var hivAids = ""
    @State private var anyBlood = ""
    @State private var liver = ""
    @State private var heart = ""
    @State private var arthritis = ""
    @State private var kidney = ""
    @State private var paralysis = ""
    @State private var congenital = ""
    @State private var physicalHandicaps = ""
    @State private var anyOtherDisease = ""
    @State private var testedPositive = ""
    @State private var bothDoses = ""
    
    @State private var alertMessage = String()
    @State private var showingAlert = false
    @State private var AlertShow = String()
    
    @State private var isButtonClick = false
    
    @State private var showDeclerationView = false
    @State private var studentAppID = UserDefaults.standard.string(forKey: "studentAppID")
    @StateObject private var SubmitViewModel = SubmitMedicalViewModel()
    
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
                    ScrollViewReader { proxy in
                        ScrollView(showsIndicators: false){
                            VStack{
                                DetailsViewTop(Step: "5")
                                    .padding(.bottom)
                                    .id(1)
                            }
                            VStack{
                                VStack(alignment: .leading){
                                    //Food Prefrence
                                    VStack(alignment: .leading) {
                                        //Food Prefrence
                                        HStack(spacing: 8){
                                            MediacalQuestionImage(text: "01")
                                            Text("Do you have any dietary preference or  restriction?*")
                                                .font(.custom(OpenSans_SemiBold, size: 14))
                                                .foregroundColor(Color(hex: 0x333333))
                                                .padding(.trailing, 4)
                                        }
                                        
                                        .padding(.bottom, 5)
                                        HStack(spacing: 15){
                                            if foodPrefrence == "Veg"{
                                                MedicalQuestionOptionView(text: "Veg", isSelect: .constant(true))
                                                    .onTapGesture {
                                                        foodPrefrence = "Veg"
                                                    }
                                                MedicalQuestionOptionView(text: "Non-Veg", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        foodPrefrence = "Non-Veg"
                                                    }
                                                MedicalQuestionOptionView(text: "Jain", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        foodPrefrence = "Jain"
                                                    }
                                                MedicalQuestionOptionView(text: "Other", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        foodPrefrence = "Other"
                                                    }
                                            }else if foodPrefrence == "Non-Veg"{
                                                MedicalQuestionOptionView(text: "Veg", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        foodPrefrence = "Veg"
                                                    }
                                                MedicalQuestionOptionView(text: "Non-Veg", isSelect: .constant(true))
                                                    .onTapGesture {
                                                        foodPrefrence = "Non-Veg"
                                                    }
                                                MedicalQuestionOptionView(text: "Jain", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        foodPrefrence = "Jain"
                                                    }
                                                MedicalQuestionOptionView(text: "Other", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        foodPrefrence = "Other"
                                                    }
                                            }else if foodPrefrence == "Jain"{
                                                MedicalQuestionOptionView(text: "Veg", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        foodPrefrence = "Veg"
                                                    }
                                                MedicalQuestionOptionView(text: "Non-Veg", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        foodPrefrence = "Non-Veg"
                                                    }
                                                MedicalQuestionOptionView(text: "Jain", isSelect: .constant(true))
                                                    .onTapGesture {
                                                        foodPrefrence = "Jain"
                                                    }
                                                MedicalQuestionOptionView(text: "Other", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        foodPrefrence = "Other"
                                                    }
                                            }else if foodPrefrence == "Other"{
                                                MedicalQuestionOptionView(text: "Veg", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        foodPrefrence = "Veg"
                                                    }
                                                MedicalQuestionOptionView(text: "Non-Veg", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        foodPrefrence = "Non-Veg"
                                                    }
                                                MedicalQuestionOptionView(text: "Jain", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        foodPrefrence = "Jain"
                                                    }
                                                MedicalQuestionOptionView(text: "Other", isSelect: .constant(true))
                                                    .onTapGesture {
                                                        foodPrefrence = "Other"
                                                    }
                                            }else{
                                                MedicalQuestionOptionView(text: "Veg", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        foodPrefrence = "Veg"
                                                    }
                                                MedicalQuestionOptionView(text: "Non-Veg", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        foodPrefrence = "Non-Veg"
                                                    }
                                                MedicalQuestionOptionView(text: "Jain", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        foodPrefrence = "Jain"
                                                    }
                                                MedicalQuestionOptionView(text: "Other", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        foodPrefrence = "Other"
                                                    }
                                            }
                                        }
                                        .padding(.leading, 43)
                                        if foodPrefrence == "Other"{
                                            MedicalTextEditor(textField: $txtfoodOther, isYesSelect: false)
                                        }
                                        Divider()
                                            .frame(width: UIScreen.main.bounds.width - 40)
                                    }
                                   
                                    VStack(alignment: .leading) {
                                       
                                        HStack(spacing: 8){
                                            MediacalQuestionImage(text: "02")
                                            Text("Do you have any food allergies?*")
                                                .font(.custom(OpenSans_SemiBold, size: 14))
                                                .foregroundColor(Color(hex: 0x333333))
                                                .padding(.trailing, 4)
                                        }
                                        .padding(.bottom, 5)
                                        
                                        HStack(spacing: 15){
                                            if foodAllergies == "Yes"{
                                                MedicalQuestionOptionView(text: "Yes", isSelect: .constant(true))
                                                    .onTapGesture {
                                                        foodAllergies = "Yes"
                                                    }
                                                MedicalQuestionOptionView(text: "No", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        foodAllergies = "No"
                                                    }
                                            }else if foodAllergies == "No"{
                                                MedicalQuestionOptionView(text: "Yes", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        foodAllergies = "Yes"
                                                    }
                                                MedicalQuestionOptionView(text: "No", isSelect: .constant(true))
                                                    .onTapGesture {
                                                        foodAllergies = "No"
                                                    }
                                                
                                            }else{
                                                MedicalQuestionOptionView(text: "Yes", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        foodAllergies = "Yes"
                                                    }
                                                MedicalQuestionOptionView(text: "No", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        foodAllergies = "No"
                                                    }
                                                
                                            }
                                        }
                                        .padding(.leading, 43)
                                        if foodAllergies == "Yes"{
                                            MedicalTextEditor(textField: $txtFoodAllergies, isYesSelect: true)
                                        }
                                    }
                                }
                                .id(2)
                                VStack(alignment: .center) {
                                    Text("Health & Wellbeing")
                                        .foregroundColor(.white)
                                        .font(.custom(OpenSans_Bold, size: 16))
                                        .padding(8)
                                        .frame(width: UIScreen.main.bounds.width - 40, alignment: .center)
                                        .background(Color(hex: 0xE75798))
                                        .padding([.top, .bottom], 10)
                                }
                                .padding(.horizontal, 4)
                                VStack(alignment: .leading){
                                    
                                    //Health Disability
                                    VStack(alignment: .leading) {
                                        //Health Disability
                                        HStack(spacing: 8){
                                            MediacalQuestionImage(text: "01")
                                            Text("Do you have any kind of disability or medical condition (mental or physical)?*")
                                                .font(.custom(OpenSans_SemiBold, size: 14))
                                                .foregroundColor(Color(hex: 0x333333))
                                                .padding(.trailing, 4)
                                        }
                                        .padding(.bottom, 5)
                                        HStack(spacing: 15){
                                            if healthDisability == "Yes"{
                                                MedicalQuestionOptionView(text: "Yes", isSelect: .constant(true))
                                                    .onTapGesture {
                                                        healthDisability = "Yes"
                                                    }
                                                MedicalQuestionOptionView(text: "No", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        healthDisability = "No"
                                                    }
                                            }else if healthDisability == "No"{
                                                MedicalQuestionOptionView(text: "Yes", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        healthDisability = "Yes"
                                                    }
                                                MedicalQuestionOptionView(text: "No", isSelect: .constant(true))
                                                    .onTapGesture {
                                                        healthDisability = "No"
                                                    }
                                            }else{
                                                MedicalQuestionOptionView(text: "Yes", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        healthDisability = "Yes"
                                                    }
                                                MedicalQuestionOptionView(text: "No", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        healthDisability = "No"
                                                    }
                                            }
                                        }
                                        .padding(.leading, 43)
                                        if healthDisability == "Yes"{
                                            MedicalTextEditor(textField: $txthealthDisability, isYesSelect: true)
                                        }
                                        Divider()
                                            .frame(width: UIScreen.main.bounds.width - 40)
                                    }
                                    
                                    VStack(alignment: .leading) {
                                        //Health Taking Medication
                                        HStack(spacing: 8){
                                            MediacalQuestionImage(text: "02")
                                            Text("Are you taking any medication for any physical or mental condition?*")
                                                .font(.custom(OpenSans_SemiBold, size: 14))
                                                .foregroundColor(Color(hex: 0x333333))
                                                .padding(.trailing, 4)
                                        }
                                        .padding(.bottom, 5)
                                        HStack(spacing: 15){
                                            if healthTakingMedication == "Yes"{
                                                MedicalQuestionOptionView(text: "Yes", isSelect: .constant(true))
                                                    .onTapGesture {
                                                        healthTakingMedication = "Yes"
                                                    }
                                                MedicalQuestionOptionView(text: "No", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        healthTakingMedication = "No"
                                                    }
                                            }else if healthTakingMedication == "No"{
                                                MedicalQuestionOptionView(text: "Yes", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        healthTakingMedication = "Yes"
                                                    }
                                                MedicalQuestionOptionView(text: "No", isSelect: .constant(true))
                                                    .onTapGesture {
                                                        healthTakingMedication = "No"
                                                    }
                                            }else{
                                                MedicalQuestionOptionView(text: "Yes", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        healthTakingMedication = "Yes"
                                                    }
                                                MedicalQuestionOptionView(text: "No", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        healthTakingMedication = "No"
                                                    }
                                            }
                                        }
                                        .padding(.leading, 43)
                                        if healthTakingMedication == "Yes"{
                                            MedicalTextEditor(textField: $txthealthTakingMedication, isYesSelect: true)
                                        }
                                        
                                        Divider()
                                            .frame(width: UIScreen.main.bounds.width - 40)
                                    }
                                    
                                    VStack(alignment: .leading) {
                                        //Health Allergies
                                        HStack(spacing: 8){
                                            MediacalQuestionImage(text: "03")
                                            Text("Do you have any allergies (including food,  medication and/ or animals)?*")
                                                .font(.custom(OpenSans_SemiBold, size: 14))
                                                .foregroundColor(Color(hex: 0x333333))
                                                .padding(.trailing, 4)
                                        }
                                        .padding(.bottom, 5)
                                        HStack(spacing: 15){
                                            if healthAllergies == "Yes"{
                                                MedicalQuestionOptionView(text: "Yes", isSelect: .constant(true))
                                                    .onTapGesture {
                                                        healthAllergies = "Yes"
                                                    }
                                                MedicalQuestionOptionView(text: "No", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        healthAllergies = "No"
                                                    }
                                            }else if healthAllergies == "No"{
                                                MedicalQuestionOptionView(text: "Yes", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        healthAllergies = "Yes"
                                                    }
                                                MedicalQuestionOptionView(text: "No", isSelect: .constant(true))
                                                    .onTapGesture {
                                                        healthAllergies = "No"
                                                    }
                                            }else{
                                                MedicalQuestionOptionView(text: "Yes", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        healthAllergies = "Yes"
                                                    }
                                                MedicalQuestionOptionView(text: "No", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        healthAllergies = "No"
                                                    }
                                            }
                                        }
                                        .padding(.leading, 43)
                                        if healthAllergies == "Yes"{
                                            MedicalTextEditor(textField: $txthealthAllergies, isYesSelect: true)
                                        }
                                        Divider()
                                            .frame(width: UIScreen.main.bounds.width - 40)
                                    }
                                    
                                    VStack(alignment: .leading) {
                                        //Health surgery
                                        HStack(spacing: 8){
                                            MediacalQuestionImage(text: "04")
                                            Text("Have you had any surgery or major injuries in the past 5 (five) years?*")
                                                .font(.custom(OpenSans_SemiBold, size: 14))
                                                .foregroundColor(Color(hex: 0x333333))
                                                .padding(.trailing, 4)
                                        }
                                        .padding(.bottom, 5)
                                        
                                        HStack(spacing: 15){
                                            if healthSurgery == "Yes"{
                                                MedicalQuestionOptionView(text: "Yes", isSelect: .constant(true))
                                                    .onTapGesture {
                                                        healthSurgery = "Yes"
                                                    }
                                                MedicalQuestionOptionView(text: "No", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        healthSurgery = "No"
                                                    }
                                            }else if healthSurgery == "No"{
                                                MedicalQuestionOptionView(text: "Yes", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        healthSurgery = "Yes"
                                                    }
                                                MedicalQuestionOptionView(text: "No", isSelect: .constant(true))
                                                    .onTapGesture {
                                                        healthSurgery = "No"
                                                    }
                                            }else{
                                                MedicalQuestionOptionView(text: "Yes", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        healthSurgery = "Yes"
                                                    }
                                                MedicalQuestionOptionView(text: "No", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        healthSurgery = "No"
                                                    }
                                            }
                                        }
                                        .padding(.leading, 43)
                                        
                                        if healthSurgery == "Yes"{
                                            MedicalTextEditor(textField: $txthealthSurgery, isYesSelect: true)
                                        }
                                        
                                        Divider()
                                            .frame(width: UIScreen.main.bounds.width - 40)
                                    }
                                    
                                    VStack(alignment: .leading) {
                                        HStack(spacing: 8){
                                            MediacalQuestionImage(text: "05")
                                            Text("Have you currently or in the past been diagnosed/ suffered/ treated/ taken medication for any of the following conditions?")
                                                .font(.custom(OpenSans_SemiBold, size: 14))
                                                .foregroundColor(Color(hex: 0x333333))
                                                .padding(.trailing, 4)
                                        }
                                        .padding(.bottom, 20)
                                    }
                                    
                                    VStack(alignment: .leading) {
                                        //Diabetes
                                        HStack(spacing: 8) {
                                            MediacalQuestionSubImage(text: "A")
                                            Text("Diabetes*")
                                                .font(.custom(OpenSans_SemiBold, size: 14))
                                                .foregroundColor(Color(hex: 0x333333))
                                                .padding(.trailing, 4)
                                        }
                                        .padding(.horizontal, 40)
                                        .padding(.bottom, 5)
                                        
                                        HStack(spacing: 15){
                                            if diabetes == "Yes"{
                                                MedicalQuestionOptionView(text: "Yes", isSelect: .constant(true))
                                                    .onTapGesture {
                                                        diabetes = "Yes"
                                                    }
                                                MedicalQuestionOptionView(text: "No", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        diabetes = "No"
                                                    }
                                            }else if diabetes == "No"{
                                                MedicalQuestionOptionView(text: "Yes", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        diabetes = "Yes"
                                                    }
                                                MedicalQuestionOptionView(text: "No", isSelect: .constant(true))
                                                    .onTapGesture {
                                                        diabetes = "No"
                                                    }
                                            }else{
                                                MedicalQuestionOptionView(text: "Yes", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        diabetes = "Yes"
                                                    }
                                                MedicalQuestionOptionView(text: "No", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        diabetes = "No"
                                                    }
                                            }
                                        }
                                        .padding(.horizontal, 70)
                                        if diabetes == "Yes"{
                                            MedicalTextEditor(textField: $txtdiabetes, isYesSelect: true)
                                        }
                                        
                                        Divider()
                                            .frame(width: UIScreen.main.bounds.width - 80)
                                            .padding(.leading, 40)
                                    }
                                    
                                    VStack(alignment: .leading) {
                                        //Hypertension
                                        HStack(spacing: 8) {
                                            MediacalQuestionSubImage(text: "B")
                                            Text("Hypertension/ high blood pressure/ low or high cholesterol*")
                                                .font(.custom(OpenSans_SemiBold, size: 14))
                                                .foregroundColor(Color(hex: 0x333333))
                                                .padding(.trailing, 4)
                                        }
                                        .padding(.horizontal, 40)
                                        .padding(.bottom, 5)
                                        
                                        HStack(spacing: 15){
                                            if hypertension == "Yes"{
                                                MedicalQuestionOptionView(text: "Yes", isSelect: .constant(true))
                                                    .onTapGesture {
                                                        hypertension = "Yes"
                                                    }
                                                MedicalQuestionOptionView(text: "No", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        hypertension = "No"
                                                    }
                                            }else if hypertension == "No"{
                                                MedicalQuestionOptionView(text: "Yes", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        hypertension = "Yes"
                                                    }
                                                MedicalQuestionOptionView(text: "No", isSelect: .constant(true))
                                                    .onTapGesture {
                                                        hypertension = "No"
                                                    }
                                            }else{
                                                MedicalQuestionOptionView(text: "Yes", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        hypertension = "Yes"
                                                    }
                                                MedicalQuestionOptionView(text: "No", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        hypertension = "No"
                                                    }
                                            }
                                        }
                                        .padding(.horizontal, 70)
                                        if hypertension == "Yes"{
                                            MedicalTextEditor(textField: $txthypertension, isYesSelect: true)
                                        }
                                        Divider()
                                            .frame(width: UIScreen.main.bounds.width - 80)
                                            .padding(.leading, 40)
                                    }
                                    
                                    VStack(alignment: .leading) {
                                        //Respiratory
                                        HStack(spacing: 8) {
                                            MediacalQuestionSubImage(text: "C")
                                            Text("Respiratory disorders/ asthma/ tuberculosis/ COPD/ bronchitis/ Covid 19*")
                                                .font(.custom(OpenSans_SemiBold, size: 14))
                                                .foregroundColor(Color(hex: 0x333333))
                                                .padding(.trailing, 4)
                                        }
                                        .padding(.horizontal, 40)
                                        .padding(.bottom, 5)
                                        
                                        HStack(spacing: 15){
                                            if respiratory == "Yes"{
                                                MedicalQuestionOptionView(text: "Yes", isSelect: .constant(true))
                                                    .onTapGesture {
                                                        respiratory = "Yes"
                                                    }
                                                MedicalQuestionOptionView(text: "No", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        respiratory = "No"
                                                    }
                                            }else if respiratory == "No"{
                                                MedicalQuestionOptionView(text: "Yes", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        respiratory = "Yes"
                                                    }
                                                MedicalQuestionOptionView(text: "No", isSelect: .constant(true))
                                                    .onTapGesture {
                                                        respiratory = "No"
                                                    }
                                            }else{
                                                MedicalQuestionOptionView(text: "Yes", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        respiratory = "Yes"
                                                    }
                                                MedicalQuestionOptionView(text: "No", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        respiratory = "No"
                                                    }
                                            }
                                        }
                                        .padding(.horizontal, 70)
                                        if respiratory == "Yes"{
                                            MedicalTextEditor(textField: $txtrespiratory, isYesSelect: true)
                                        }
                                        Divider()
                                            .frame(width: UIScreen.main.bounds.width - 80)
                                            .padding(.leading, 40)
                                    }
                                    
                                    VStack(alignment: .leading) {
                                        //Thyroid
                                        HStack(spacing: 8) {
                                            MediacalQuestionSubImage(text: "D")
                                            Text("Thyroid disease/ Cushing’s disease/ parathyroid/ or any other disease or disorder of the endocrine system*")
                                                .font(.custom(OpenSans_SemiBold, size: 14))
                                                .foregroundColor(Color(hex: 0x333333))
                                                .padding(.trailing, 4)
                                        }
                                        .padding(.horizontal, 40)
                                        .padding(.bottom, 5)
                                        
                                        HStack(spacing: 15){
                                            if thyroid == "Yes"{
                                                MedicalQuestionOptionView(text: "Yes", isSelect: .constant(true))
                                                    .onTapGesture {
                                                        thyroid = "Yes"
                                                    }
                                                MedicalQuestionOptionView(text: "No", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        thyroid = "No"
                                                    }
                                            }else if thyroid == "No"{
                                                MedicalQuestionOptionView(text: "Yes", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        thyroid = "Yes"
                                                    }
                                                MedicalQuestionOptionView(text: "No", isSelect: .constant(true))
                                                    .onTapGesture {
                                                        thyroid = "No"
                                                    }
                                            }else{
                                                MedicalQuestionOptionView(text: "Yes", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        thyroid = "Yes"
                                                    }
                                                MedicalQuestionOptionView(text: "No", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        thyroid = "No"
                                                    }
                                            }
                                        }
                                        .padding(.horizontal, 70)
                                        if thyroid == "Yes"{
                                            MedicalTextEditor(textField: $txtthyroid, isYesSelect: true)
                                        }
                                        
                                        Divider()
                                            .frame(width: UIScreen.main.bounds.width - 80)
                                            .padding(.leading, 40)
                                    }
                                }
                                .id(3)
                                
                                VStack(alignment: .leading) {
                                    
                                    VStack(alignment: .leading) {
                                        //HIV AIDS
                                        HStack(spacing: 8) {
                                            MediacalQuestionSubImage(text: "E")
                                            Text("Any Communicable Deseases?*")
                                                .font(.custom(OpenSans_SemiBold, size: 14))
                                                .foregroundColor(Color(hex: 0x333333))
                                                .padding(.trailing, 4)
                                        }
                                        .padding(.horizontal, 40)
                                        .padding(.bottom, 5)
                                        
                                        HStack(spacing: 15){
                                            if hivAids == "Yes"{
                                                MedicalQuestionOptionView(text: "Yes", isSelect: .constant(true))
                                                    .onTapGesture {
                                                        hivAids = "Yes"
                                                    }
                                                MedicalQuestionOptionView(text: "No", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        hivAids = "No"
                                                    }
                                            }else if hivAids == "No"{
                                                MedicalQuestionOptionView(text: "Yes", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        hivAids = "Yes"
                                                    }
                                                MedicalQuestionOptionView(text: "No", isSelect: .constant(true))
                                                    .onTapGesture {
                                                        hivAids = "No"
                                                    }
                                            }else{
                                                MedicalQuestionOptionView(text: "Yes", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        hivAids = "Yes"
                                                    }
                                                MedicalQuestionOptionView(text: "No", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        hivAids = "No"
                                                    }
                                            }
                                        }
                                        .padding(.horizontal, 70)
                                        if hivAids == "Yes"{
                                            MedicalTextEditor(textField: $txthivAids, isYesSelect: true)
                                        }
                                        
                                        Divider()
                                            .frame(width: UIScreen.main.bounds.width - 80)
                                            .padding(.leading, 40)
                                    }
                                    
                                    VStack(alignment: .leading) {
                                        //Any Blood
                                        HStack(spacing: 8) {
                                            MediacalQuestionSubImage(text: "F")
                                            Text("Any blood or clotting disorders*")
                                                .font(.custom(OpenSans_SemiBold, size: 14))
                                                .foregroundColor(Color(hex: 0x333333))
                                                .padding(.trailing, 4)
                                        }
                                        .padding(.horizontal, 40)
                                        .padding(.bottom, 5)
                                        
                                        HStack(spacing: 15){
                                            if anyBlood == "Yes"{
                                                MedicalQuestionOptionView(text: "Yes", isSelect: .constant(true))
                                                    .onTapGesture {
                                                        anyBlood = "Yes"
                                                    }
                                                MedicalQuestionOptionView(text: "No", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        anyBlood = "No"
                                                    }
                                            }else if anyBlood == "No"{
                                                MedicalQuestionOptionView(text: "Yes", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        anyBlood = "Yes"
                                                    }
                                                MedicalQuestionOptionView(text: "No", isSelect: .constant(true))
                                                    .onTapGesture {
                                                        anyBlood = "No"
                                                    }
                                            }else{
                                                MedicalQuestionOptionView(text: "Yes", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        anyBlood = "Yes"
                                                    }
                                                MedicalQuestionOptionView(text: "No", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        anyBlood = "No"
                                                    }
                                            }
                                        }
                                        .padding(.horizontal, 70)
                                        if anyBlood == "Yes"{
                                            MedicalTextEditor(textField: $txtAnyBlood, isYesSelect: true)
                                        }
                                        
                                        Divider()
                                            .frame(width: UIScreen.main.bounds.width - 80)
                                            .padding(.leading, 40)
                                    }
                                    
                                    VStack(alignment: .leading) {
                                        //Liver
                                        HStack(spacing: 8) {
                                            MediacalQuestionSubImage(text: "G")
                                            Text("Liver Disease*")
                                                .font(.custom(OpenSans_SemiBold, size: 14))
                                                .foregroundColor(Color(hex: 0x333333))
                                                .padding(.trailing, 4)
                                        }
                                        .padding(.horizontal, 40)
                                        .padding(.bottom, 5)
                                        
                                        HStack(spacing: 15){
                                            if liver == "Yes"{
                                                MedicalQuestionOptionView(text: "Yes", isSelect: .constant(true))
                                                    .onTapGesture {
                                                        liver = "Yes"
                                                    }
                                                MedicalQuestionOptionView(text: "No", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        liver = "No"
                                                    }
                                            }else if liver == "No"{
                                                MedicalQuestionOptionView(text: "Yes", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        liver = "Yes"
                                                    }
                                                MedicalQuestionOptionView(text: "No", isSelect: .constant(true))
                                                    .onTapGesture {
                                                        liver = "No"
                                                    }
                                            }else{
                                                MedicalQuestionOptionView(text: "Yes", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        liver = "Yes"
                                                    }
                                                MedicalQuestionOptionView(text: "No", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        liver = "No"
                                                    }
                                            }
                                        }
                                        .padding(.horizontal, 70)
                                        if liver == "Yes"{
                                            MedicalTextEditor(textField: $txtliver, isYesSelect: true)
                                        }
                                        
                                        Divider()
                                            .frame(width: UIScreen.main.bounds.width - 80)
                                            .padding(.leading, 40)
                                    }
                                    
                                    VStack(alignment: .leading) {
                                        //Heart
                                        HStack(spacing: 8) {
                                            MediacalQuestionSubImage(text: "H")
                                            Text("Heart disease or disorder, chest pain or discomfort, irregular heartbeats, palpitations, murmurs*")
                                                .font(.custom(OpenSans_SemiBold, size: 14))
                                                .foregroundColor(Color(hex: 0x333333))
                                                .padding(.trailing, 4)
                                        }
                                        .padding(.horizontal, 40)
                                        .padding(.bottom, 5)
                                        
                                        HStack(spacing: 15){
                                            if heart == "Yes"{
                                                MedicalQuestionOptionView(text: "Yes", isSelect: .constant(true))
                                                    .onTapGesture {
                                                        heart = "Yes"
                                                    }
                                                MedicalQuestionOptionView(text: "No", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        heart = "No"
                                                    }
                                            }else if heart == "No"{
                                                MedicalQuestionOptionView(text: "Yes", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        heart = "Yes"
                                                    }
                                                MedicalQuestionOptionView(text: "No", isSelect: .constant(true))
                                                    .onTapGesture {
                                                        heart = "No"
                                                    }
                                            }else{
                                                MedicalQuestionOptionView(text: "Yes", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        heart = "Yes"
                                                    }
                                                MedicalQuestionOptionView(text: "No", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        heart = "No"
                                                    }
                                            }
                                        }
                                        .padding(.horizontal, 70)
                                        if heart == "Yes"{
                                            MedicalTextEditor(textField: $txtheart, isYesSelect: true)
                                        }
                                        
                                        Divider()
                                            .frame(width: UIScreen.main.bounds.width - 80)
                                            .padding(.leading, 40)
                                        
                                    }
                                    
                                    VStack(alignment: .leading) {
                                        //Arthritis
                                        HStack(spacing: 8) {
                                            MediacalQuestionSubImage(text: "I")
                                            Text("Arthritis or joint pain*")
                                                .font(.custom(OpenSans_SemiBold, size: 14))
                                                .foregroundColor(Color(hex: 0x333333))
                                                .padding(.trailing, 4)
                                        }
                                        .padding(.horizontal, 40)
                                        .padding(.bottom, 5)
                                        
                                        HStack(spacing: 15){
                                            if arthritis == "Yes"{
                                                MedicalQuestionOptionView(text: "Yes", isSelect: .constant(true))
                                                    .onTapGesture {
                                                        arthritis = "Yes"
                                                    }
                                                MedicalQuestionOptionView(text: "No", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        arthritis = "No"
                                                    }
                                            }else if arthritis == "No"{
                                                MedicalQuestionOptionView(text: "Yes", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        arthritis = "Yes"
                                                    }
                                                MedicalQuestionOptionView(text: "No", isSelect: .constant(true))
                                                    .onTapGesture {
                                                        arthritis = "No"
                                                    }
                                            }else{
                                                MedicalQuestionOptionView(text: "Yes", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        arthritis = "Yes"
                                                    }
                                                MedicalQuestionOptionView(text: "No", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        arthritis = "No"
                                                    }
                                            }
                                        }
                                        .padding(.horizontal, 70)
                                        if arthritis == "Yes"{
                                            MedicalTextEditor(textField: $txtarthritis, isYesSelect: true)
                                        }
                                        
                                        Divider()
                                            .frame(width: UIScreen.main.bounds.width - 80)
                                            .padding(.leading, 40)
                                    }
                                }
                                .id(4)
                                VStack(alignment: .leading){
    
                                    VStack(alignment: .leading) {
                                        //Kidney
                                        HStack(spacing: 8) {
                                            MediacalQuestionSubImage(text: "J")
                                            Text("Kidney disease*")
                                                .font(.custom(OpenSans_SemiBold, size: 14))
                                                .foregroundColor(Color(hex: 0x333333))
                                                .padding(.trailing, 4)
                                        }
                                        .padding(.horizontal, 40)
                                        .padding(.bottom, 5)
                                        
                                        HStack(spacing: 15){
                                            if kidney == "Yes"{
                                                MedicalQuestionOptionView(text: "Yes", isSelect: .constant(true))
                                                    .onTapGesture {
                                                        kidney = "Yes"
                                                    }
                                                MedicalQuestionOptionView(text: "No", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        kidney = "No"
                                                    }
                                            }else if kidney == "No"{
                                                MedicalQuestionOptionView(text: "Yes", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        kidney = "Yes"
                                                    }
                                                MedicalQuestionOptionView(text: "No", isSelect: .constant(true))
                                                    .onTapGesture {
                                                        kidney = "No"
                                                    }
                                            }else{
                                                MedicalQuestionOptionView(text: "Yes", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        kidney = "Yes"
                                                    }
                                                MedicalQuestionOptionView(text: "No", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        kidney = "No"
                                                    }
                                            }
                                        }
                                        .padding(.horizontal, 70)
                                        if kidney == "Yes"{
                                            MedicalTextEditor(textField: $txtkidney, isYesSelect: true)
                                        }
                                        
                                        Divider()
                                            .frame(width: UIScreen.main.bounds.width - 80)
                                            .padding(.leading, 40)
                                    }
                                    
                                    VStack(alignment: .leading) {
                                        //Paralysis
                                        HStack(spacing: 8) {
                                            MediacalQuestionSubImage(text: "K")
                                            Text("Epilepsy/ Seizures/ Mental or Psychiatric illness/ Depression/ Anxiety/ Dementia/ Mania/ Paralysis/ Stroke or any other disease of the brain of nervous system*")
                                                .font(.custom(OpenSans_SemiBold, size: 14))
                                                .foregroundColor(Color(hex: 0x333333))
                                                .padding(.trailing, 4)
                                        }
                                        .padding(.horizontal, 40)
                                        .padding(.bottom, 5)
                                        
                                        HStack(spacing: 15){
                                            if paralysis == "Yes"{
                                                MedicalQuestionOptionView(text: "Yes", isSelect: .constant(true))
                                                    .onTapGesture {
                                                        paralysis = "Yes"
                                                    }
                                                MedicalQuestionOptionView(text: "No", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        paralysis = "No"
                                                    }
                                            }else if paralysis == "No"{
                                                MedicalQuestionOptionView(text: "Yes", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        paralysis = "Yes"
                                                    }
                                                MedicalQuestionOptionView(text: "No", isSelect: .constant(true))
                                                    .onTapGesture {
                                                        paralysis = "No"
                                                    }
                                            }else{
                                                MedicalQuestionOptionView(text: "Yes", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        paralysis = "Yes"
                                                    }
                                                MedicalQuestionOptionView(text: "No", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        paralysis = "No"
                                                    }
                                            }
                                        }
                                        .padding(.horizontal, 70)
                                        if paralysis == "Yes"{
                                            MedicalTextEditor(textField: $txtparalysis, isYesSelect: true)
                                        }
                                        
                                        Divider()
                                            .frame(width: UIScreen.main.bounds.width - 80)
                                            .padding(.leading, 40)
                                    }
                                    
                                    VStack(alignment: .leading) {
                                        //Congenital
                                        HStack(spacing: 8) {
                                            MediacalQuestionSubImage(text: "L")
                                            Text("Congenital disease*")
                                                .font(.custom(OpenSans_SemiBold, size: 14))
                                                .foregroundColor(Color(hex: 0x333333))
                                                .padding(.trailing, 4)
                                        }
                                        .padding(.horizontal, 40)
                                        .padding(.bottom, 5)
           
                                        HStack(spacing: 15){
                                            if congenital == "Yes"{
                                                MedicalQuestionOptionView(text: "Yes", isSelect: .constant(true))
                                                    .onTapGesture {
                                                        congenital = "Yes"
                                                    }
                                                MedicalQuestionOptionView(text: "No", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        congenital = "No"
                                                    }
                                            }else if congenital == "No"{
                                                MedicalQuestionOptionView(text: "Yes", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        congenital = "Yes"
                                                    }
                                                MedicalQuestionOptionView(text: "No", isSelect: .constant(true))
                                                    .onTapGesture {
                                                        congenital = "No"
                                                    }
                                            }else{
                                                MedicalQuestionOptionView(text: "Yes", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        congenital = "Yes"
                                                    }
                                                MedicalQuestionOptionView(text: "No", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        congenital = "No"
                                                    }
                                            }
                                        }
                                        .padding(.horizontal, 70)
                                        if congenital == "Yes"{
                                            MedicalTextEditor(textField: $txtcongenital, isYesSelect: true)
                                        }
                                        
                                        Divider()
                                            .frame(width: UIScreen.main.bounds.width - 80)
                                            .padding(.leading, 40)
                                    }
                                    
                                    VStack(alignment: .leading) {
                                        //Physical handicaps
                                        HStack(spacing: 8) {
                                            MediacalQuestionSubImage(text: "M")
                                            Text("Physical handicaps or disease of the eye, nose or throat (except any sight related problems corrected by prescription lenses)*")
                                                .font(.custom(OpenSans_SemiBold, size: 14))
                                                .foregroundColor(Color(hex: 0x333333))
                                                .padding(.trailing, 4)
                                        }
                                        .padding(.horizontal, 40)
                                        .padding(.bottom, 5)
                                        
                                        
                                        HStack(spacing: 15){
                                            if physicalHandicaps == "Yes"{
                                                MedicalQuestionOptionView(text: "Yes", isSelect: .constant(true))
                                                    .onTapGesture {
                                                        physicalHandicaps = "Yes"
                                                    }
                                                MedicalQuestionOptionView(text: "No", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        physicalHandicaps = "No"
                                                    }
                                            }else if physicalHandicaps == "No"{
                                                MedicalQuestionOptionView(text: "Yes", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        physicalHandicaps = "Yes"
                                                    }
                                                MedicalQuestionOptionView(text: "No", isSelect: .constant(true))
                                                    .onTapGesture {
                                                        physicalHandicaps = "No"
                                                    }
                                            }else{
                                                MedicalQuestionOptionView(text: "Yes", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        physicalHandicaps = "Yes"
                                                    }
                                                MedicalQuestionOptionView(text: "No", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        physicalHandicaps = "No"
                                                    }
                                            }
                                        }
                                        .padding(.horizontal, 70)
                                        if physicalHandicaps == "Yes"{
                                            MedicalTextEditor(textField: $txtphysicalHandicaps, isYesSelect: true)
                                        }
                                        
                                        Divider()
                                            .frame(width: UIScreen.main.bounds.width - 80)
                                            .padding(.leading, 40)
                                    }
                                    
                                    VStack(alignment: .leading) {
                                        //Any other disease
                                        HStack(spacing: 8) {
                                            MediacalQuestionSubImage(text: "N")
                                            Text("Any other disease/ health adversity/ injury/ condition/ treatment/ deficiency not mentioned above*")
                                                .font(.custom(OpenSans_SemiBold, size: 14))
                                                .foregroundColor(Color(hex: 0x333333))
                                                .padding(.trailing, 4)
                                        }
                                        .padding(.horizontal, 40)
                                        .padding(.bottom, 5)
                                        
                                        HStack(spacing: 15){
                                            if anyOtherDisease == "Yes"{
                                                MedicalQuestionOptionView(text: "Yes", isSelect: .constant(true))
                                                    .onTapGesture {
                                                        anyOtherDisease = "Yes"
                                                    }
                                                MedicalQuestionOptionView(text: "No", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        anyOtherDisease = "No"
                                                    }
                                            }else if anyOtherDisease == "No"{
                                                MedicalQuestionOptionView(text: "Yes", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        anyOtherDisease = "Yes"
                                                    }
                                                MedicalQuestionOptionView(text: "No", isSelect: .constant(true))
                                                    .onTapGesture {
                                                        anyOtherDisease = "No"
                                                    }
                                            }else{
                                                MedicalQuestionOptionView(text: "Yes", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        anyOtherDisease = "Yes"
                                                    }
                                                MedicalQuestionOptionView(text: "No", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        anyOtherDisease = "No"
                                                    }
                                            }
                                        }
                                        .padding(.horizontal, 70)
                                        if anyOtherDisease == "Yes"{
                                            MedicalTextEditor(textField: $txtanyOtherDisease, isYesSelect: true)
                                        }
                                        
                                        Divider()
                                            .frame(width: UIScreen.main.bounds.width - 80)
                                            .padding(.leading, 40)
                                    }
                                }
                                .id(5)
                                VStack(alignment: .center) {
                                    Text("Covid-19 Status")
                                        .foregroundColor(.white)
                                        .font(.custom(OpenSans_Bold, size: 16))
                                        .padding(8)
                                        .frame(width: UIScreen.main.bounds.width - 40, alignment: .center)
                                        .background(Color(hex: 0xE75798))
                                        .padding([.top, .bottom], 10)
                                }
                                VStack(alignment: .leading) {
                                    
                                    VStack(alignment: .leading) {
                                        //Tested  Positive
                                        HStack(spacing: 8){
                                            MediacalQuestionImage(text: "01")
                                            Text("Have you been tested positive for COVID-19 recently?*")
                                                .font(.custom(OpenSans_SemiBold, size: 14))
                                                .foregroundColor(Color(hex: 0x333333))
                                                .padding(.trailing, 4)
                                        }
                                        .padding(.bottom, 5)
                                        
                                        HStack(spacing: 15){
                                            if testedPositive == "Yes"{
                                                MedicalQuestionOptionView(text: "Yes", isSelect: .constant(true))
                                                    .onTapGesture {
                                                        testedPositive = "Yes"
                                                    }
                                                MedicalQuestionOptionView(text: "No", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        testedPositive = "No"
                                                    }
                                            }else if testedPositive == "No"{
                                                MedicalQuestionOptionView(text: "Yes", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        testedPositive = "Yes"
                                                    }
                                                MedicalQuestionOptionView(text: "No", isSelect: .constant(true))
                                                    .onTapGesture {
                                                        testedPositive = "No"
                                                    }
                                            }else{
                                                MedicalQuestionOptionView(text: "Yes", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        testedPositive = "Yes"
                                                    }
                                                MedicalQuestionOptionView(text: "No", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        testedPositive = "No"
                                                    }
                                            }
                                        }
                                        .padding(.leading, 43)
                                        
                                        if testedPositive == "Yes"{
                                            MedicalTextEditor(textField: $txttestedPositive, isYesSelect: true)
                                        }
                                        
                                        Divider()
                                            .frame(width: UIScreen.main.bounds.width - 40)
                                    }
                                    
                                    VStack(alignment: .leading) {
                                        //Both Doses
                                        HStack(spacing: 8){
                                            MediacalQuestionImage(text: "02")
                                            Text("Have you had both doses of the COVID-19 vaccine?*")
                                                .font(.custom(OpenSans_SemiBold, size: 14))
                                                .foregroundColor(Color(hex: 0x333333))
                                                .padding(.trailing, 4)
                                        }
                                        .padding(.bottom, 5)
                                        
                                        HStack(spacing: 15){
                                            if bothDoses == "Yes"{
                                                MedicalQuestionOptionView(text: "Yes", isSelect: .constant(true))
                                                    .onTapGesture {
                                                        bothDoses = "Yes"
                                                    }
                                                MedicalQuestionOptionView(text: "No", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        bothDoses = "No"
                                                    }
                                            }else if bothDoses == "No"{
                                                MedicalQuestionOptionView(text: "Yes", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        bothDoses = "Yes"
                                                    }
                                                MedicalQuestionOptionView(text: "No", isSelect: .constant(true))
                                                    .onTapGesture {
                                                        bothDoses = "No"
                                                    }
                                            }else{
                                                MedicalQuestionOptionView(text: "Yes", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        bothDoses = "Yes"
                                                    }
                                                MedicalQuestionOptionView(text: "No", isSelect: .constant(false))
                                                    .onTapGesture {
                                                        bothDoses = "No"
                                                    }
                                            }
                                        }
                                        .padding(.leading, 43)
                                        
                                        if bothDoses == "Yes"{
                                            MedicalTextEditor(textField: $txtBothDoses, isYesSelect: true)
                                        }
                                        
                                        Divider()
                                            .frame(width: UIScreen.main.bounds.width - 40)
                                    }
                                }
                                .id(6)
                            }
                            .padding(.horizontal, 4)
                            NavigationLink("", destination: FormDeclerationView().navigationBarHidden(true),isActive: $showDeclerationView).isDetailLink(false)
                            VStack{
                                DetailsViewBottom(textName: "Save & Continue", imageName: "Form_Button_icon_Step5")
                                    .padding(.top, 5)
                                    .onTapGesture {
                                        isButtonClick = true
                                        if foodPrefrence.isEmpty{
                                            alertMessage = "Do you have any dietary preference or  restriction?"
                                            AlertShow = "0"
                                            proxy.scrollTo(1)
                                            showingAlert = true
                                        }else if foodPrefrence == "Other" && txtfoodOther.isEmpty{
                                            alertMessage = "Do you have any dietary preference or  restriction? If Other please specify"
                                            AlertShow = "0"
                                            proxy.scrollTo(1)
                                            showingAlert = true
                                        }else if foodAllergies.isEmpty{
                                            alertMessage = "Do you have any food allergies?"
                                            AlertShow = "0"
                                            proxy.scrollTo(1)
                                            showingAlert = true
                                        }else if foodAllergies == "Yes" && txtFoodAllergies.isEmpty{
                                            alertMessage = "Do you have any food allergies?.If Yes please specify in detail"
                                            AlertShow = "0"
                                            proxy.scrollTo(1)
                                            showingAlert = true
                                        }else if healthDisability.isEmpty{
                                            alertMessage = "Do you have any kind of disability or medical condition (mental or physical)?"
                                            AlertShow = "0"
                                            proxy.scrollTo(2)
                                            showingAlert = true
                                        }else if healthDisability == "Yes" && txthealthDisability.isEmpty{
                                            alertMessage = "Do you have any kind of disability or medical condition (mental or physical)?.If Yes please specify in detail"
                                            AlertShow = "0"
                                            proxy.scrollTo(2)
                                            showingAlert = true
                                        }else if healthTakingMedication.isEmpty{
                                            alertMessage = "Are you taking any medication for any physical or mental condition?"
                                            AlertShow = "0"
                                            proxy.scrollTo(2)
                                            showingAlert = true
                                        }else if healthTakingMedication == "Yes" && txthealthTakingMedication.isEmpty{
                                            alertMessage = "Are you taking any medication for any physical or mental condition?.If Yes please specify in detail"
                                            AlertShow = "0"
                                            proxy.scrollTo(2)
                                            showingAlert = true
                                        }else if healthAllergies.isEmpty{
                                            alertMessage = "Do you have any allergies (including any medication, animals and/ or foods)?"
                                            AlertShow = "0"
                                            proxy.scrollTo(2)
                                            showingAlert = true
                                        }else if healthAllergies == "Yes" && txthealthAllergies.isEmpty{
                                            alertMessage = "Do you have any allergies (including any medication, animals and/ or foods)?.If Yes please specify in detail"
                                            AlertShow = "0"
                                            proxy.scrollTo(2)
                                            showingAlert = true
                                        }else if healthSurgery.isEmpty{
                                            alertMessage = "Have you had any surgery or major injuries in the past 5 (five) years?*"
                                            AlertShow = "0"
                                            proxy.scrollTo(2)
                                            showingAlert = true
                                        }else if healthSurgery == "Yes" && txthealthSurgery.isEmpty{
                                            alertMessage = "Have you had any surgery or major injuries in the past 5 (five) years?*.If Yes please specify in detail"
                                            AlertShow = "0"
                                            proxy.scrollTo(2)
                                            showingAlert = true
                                        }else if diabetes.isEmpty{
                                            alertMessage = "Diabetes?"
                                            AlertShow = "0"
                                            proxy.scrollTo(3)
                                            showingAlert = true
                                        }else if diabetes == "Yes" && txtdiabetes.isEmpty{
                                            alertMessage = "Diabetes?.If Yes please specify in detail"
                                            AlertShow = "0"
                                            proxy.scrollTo(3)
                                            showingAlert = true
                                        }else if hypertension.isEmpty{
                                            alertMessage = "Hypertension/ high blood pressure/ low or high cholesterol?"
                                            AlertShow = "0"
                                            proxy.scrollTo(3)
                                            showingAlert = true
                                        }else if hypertension == "Yes" && txthypertension.isEmpty{
                                            alertMessage = "Hypertension/ high blood pressure/ low or high cholesterol?.If Yes please specify in detail"
                                            AlertShow = "0"
                                            proxy.scrollTo(3)
                                            showingAlert = true
                                        }else if respiratory.isEmpty{
                                            alertMessage = "Respiratory disorders/ asthma/ tuberculosis/ COPD/ bronchitis/ Covid 19?"
                                            AlertShow = "0"
                                            proxy.scrollTo(3)
                                            showingAlert = true
                                        }else if respiratory == "Yes" && txtrespiratory.isEmpty{
                                            alertMessage = "Respiratory disorders/ asthma/ tuberculosis/ COPD/ bronchitis/ Covid 19?.If Yes please specify in detail"
                                            AlertShow = "0"
                                            proxy.scrollTo(3)
                                            showingAlert = true
                                        }else if thyroid.isEmpty{
                                            alertMessage = "Thyroid disease/ Cushing’s disease/ parathyroid/ or any other disease or disorder of the endocrine system?"
                                            AlertShow = "0"
                                            proxy.scrollTo(3)
                                            showingAlert = true
                                        }else if thyroid == "Yes" && txtthyroid.isEmpty{
                                            alertMessage = "Thyroid disease/ Cushing’s disease/ parathyroid/ or any other disease or disorder of the endocrine system?.If Yes please specify in detail"
                                            AlertShow = "0"
                                            proxy.scrollTo(3)
                                            showingAlert = true
                                        }else if hivAids.isEmpty{
                                            alertMessage = "Any Communicable diseases?"
                                            AlertShow = "0"
                                            proxy.scrollTo(4)
                                            showingAlert = true
                                        }else if hivAids == "Yes" && txthivAids.isEmpty{
                                            alertMessage = "Any Communicable diseases?.If Yes please specify in detail"
                                            AlertShow = "0"
                                            proxy.scrollTo(4)
                                            showingAlert = true
                                        }else if anyBlood.isEmpty{
                                            alertMessage = "Any blood or clotting disorders?"
                                            AlertShow = "0"
                                            proxy.scrollTo(4)
                                            showingAlert = true
                                        }else if anyBlood == "Yes" && txtAnyBlood.isEmpty{
                                            alertMessage = "Any blood or clotting disorders?.If Yes please specify in detail"
                                            AlertShow = "0"
                                            proxy.scrollTo(4)
                                            showingAlert = true
                                        }else if liver.isEmpty{
                                            alertMessage = "Liver disease?"
                                            AlertShow = "0"
                                            proxy.scrollTo(4)
                                            showingAlert = true
                                        }else if liver == "Yes" && txtliver.isEmpty{
                                            alertMessage = "Liver disease?.If Yes please specify in detail"
                                            AlertShow = "0"
                                            proxy.scrollTo(4)
                                            showingAlert = true
                                        }else if heart.isEmpty{
                                            alertMessage = "Heart disease or disorder, chest pain or discomfort, irregular heartbeats, palpitations, murmurs?"
                                            AlertShow = "0"
                                            proxy.scrollTo(4)
                                            showingAlert = true
                                        }else if heart == "Yes" && txtheart.isEmpty{
                                            alertMessage = "Heart disease or disorder, chest pain or discomfort, irregular heartbeats, palpitations, murmurs?.If Yes please specify in detail"
                                            AlertShow = "0"
                                            proxy.scrollTo(4)
                                            showingAlert = true
                                        }else if arthritis.isEmpty{
                                            alertMessage = "Arthritis or Joint pain?"
                                            AlertShow = "0"
                                            proxy.scrollTo(4)
                                            showingAlert = true
                                        }else if arthritis == "Yes" && txtarthritis.isEmpty{
                                            alertMessage = "Arthritis or Joint pain?.If Yes please specify in detail"
                                            AlertShow = "0"
                                            proxy.scrollTo(4)
                                            showingAlert = true
                                        }else if kidney.isEmpty{
                                            alertMessage = "Kidney disease?"
                                            AlertShow = "0"
                                            proxy.scrollTo(5)
                                            showingAlert = true
                                        }else if kidney == "Yes" && txtkidney.isEmpty{
                                            alertMessage = "Kidney disease?.If Yes please specify in detail"
                                            AlertShow = "0"
                                            proxy.scrollTo(5)
                                            showingAlert = true
                                        }else if paralysis.isEmpty{
                                            alertMessage = "Epilepsy/ Seizures/ Mental or Psychiatric illness/ Depression/ Anxiety/ Dementia/ Mania/ Paralysis/ Stroke or any other disease of the brain of nervous system?"
                                            AlertShow = "0"
                                            proxy.scrollTo(5)
                                            showingAlert = true
                                        }else if paralysis == "Yes" && txtparalysis.isEmpty{
                                            alertMessage = "Epilepsy/ Seizures/ Mental or Psychiatric illness/ Depression/ Anxiety/ Dementia/ Mania/ Paralysis/ Stroke or any other disease of the brain of nervous system?.If Yes please specify in detail"
                                            AlertShow = "0"
                                            proxy.scrollTo(5)
                                            showingAlert = true
                                        }else if congenital.isEmpty{
                                            alertMessage = "Congenital disease?"
                                            AlertShow = "0"
                                            proxy.scrollTo(5)
                                            showingAlert = true
                                        }else if congenital == "Yes" && txtcongenital.isEmpty{
                                            alertMessage = "Congenital disease?.If Yes please specify in detail"
                                            AlertShow = "0"
                                            proxy.scrollTo(5)
                                            showingAlert = true
                                        }else if physicalHandicaps.isEmpty{
                                            alertMessage = "Physical handicaps or disease of the eye, nose or throat (except any sight related problems corrected by prescription lenses)?"
                                            AlertShow = "0"
                                            proxy.scrollTo(5)
                                            showingAlert = true
                                        }else if physicalHandicaps == "Yes" && txtphysicalHandicaps.isEmpty{
                                            alertMessage = "Physical handicaps or disease of the eye, nose or throat (except any sight related problems corrected by prescription lenses)?.If Yes please specify in detail"
                                            AlertShow = "0"
                                            proxy.scrollTo(5)
                                            showingAlert = true
                                        }else if anyOtherDisease.isEmpty{
                                            alertMessage = "Any other disease/ health adversity/ injury/ condition/ treatment/ deficiency not mentioned above?"
                                            AlertShow = "0"
                                            proxy.scrollTo(5)
                                            showingAlert = true
                                        }else if anyOtherDisease == "Yes" && txtanyOtherDisease.isEmpty{
                                            alertMessage = "Any other disease/ health adversity/ injury/ condition/ treatment/ deficiency not mentioned above?.If Yes please specify in detail"
                                            AlertShow = "0"
                                            proxy.scrollTo(5)
                                            showingAlert = true
                                        }else if testedPositive.isEmpty{
                                            alertMessage = "Have you been tested positive for COVID-19 recently?"
                                            AlertShow = "0"
                                            proxy.scrollTo(6)
                                            showingAlert = true
                                        }else if testedPositive == "Yes" && txttestedPositive.isEmpty{
                                            alertMessage = "Have you been tested positive for COVID-19 recently?.If Yes please specify in detail"
                                            AlertShow = "0"
                                            proxy.scrollTo(6)
                                            showingAlert = true
                                        }else if bothDoses.isEmpty{
                                            alertMessage = "Have you had both doses of the COVID-19 vaccine?"
                                            AlertShow = "0"
                                            proxy.scrollTo(6)
                                            showingAlert = true
                                        }else if bothDoses == "Yes" && txtBothDoses.isEmpty{
                                            alertMessage = "Have you had both doses of the COVID-19 vaccine?.If Yes please specify in detail"
                                            AlertShow = "0"
                                            proxy.scrollTo(6)
                                            showingAlert = true
                                        }else{
                                            SubmitViewModel.fetchLoginDate(
                                                dietry: foodPrefrence,
                                                dietry_text: txtfoodOther,
                                                f_allergies: foodAllergies,
                                                f_allergies_text: txtFoodAllergies,
                                                health: healthDisability,
                                                health_text: txthealthDisability,
                                                medication: healthTakingMedication,
                                                medication_text: txthealthTakingMedication,
                                                allergies: healthAllergies,
                                                allergies_text: txthealthAllergies,
                                                surgery: healthSurgery,
                                                surgery_text: txthealthSurgery,
                                                diagnosed: "",
                                                diagnosed_text: "",
                                                diabetes: diabetes,
                                                diabetes_text: txtdiabetes,
                                                hypertension: hypertension,
                                                hypertension_text: txthypertension,
                                                disorders: respiratory,
                                                disorders_text: txtrespiratory,
                                                disease: thyroid,
                                                disease_text: txtthyroid,
                                                communicable: hivAids,
                                                communicable_text: txthivAids,
                                                liver_d: liver,
                                                liver_d_text: txtliver,
                                                heart_d: heart,
                                                heart_d_text: txtheart,
                                                arthritis: arthritis,
                                                arthritis_text: txtarthritis,
                                                kidney_d: kidney,
                                                kidney_d_text: txtkidney,
                                                paralysis: paralysis,
                                                paralysis_text: txtparalysis,
                                                congenital: congenital,
                                                congenital_text: txtcongenital,
                                                handicaps: physicalHandicaps,
                                                handicaps_text: txtphysicalHandicaps,
                                                any_d: anyOtherDisease,
                                                any_d_text: txtanyOtherDisease,
                                                clotting: anyBlood,
                                                clotting_text: txtAnyBlood,
                                                recently_covid: testedPositive,
                                                recently_covid_text: txttestedPositive,
                                                covid_vaccine: bothDoses,
                                                covid_vaccine_text: txtBothDoses,
                                                appId: studentAppID ?? "",
                                                complition: { MedicalData in
                                                    if MedicalData.status == 1{
                                                        showDeclerationView = true
                                                    }else{
                                                        alertMessage = MedicalData.msg ?? ""
                                                        AlertShow = "0"
                                                        showingAlert = true
                                                    }
                                                })
                                        }
                                    }
                                    .shadow(color: isButtonClick ? .gray : .clear, radius: isButtonClick ? 10 : 0, x: 0, y: 0)
                            }
                            .padding(.bottom)
                        }
                    }
                }
            }
            .alert(alertMessage, isPresented: $showingAlert) {
                Button("OK", role: .cancel) {
                    if AlertShow == "1"{
                        showDeclerationView = true
                    }else{
                        isButtonClick = false
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct MedicalQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        MedicalQuestionView()
    }
}
