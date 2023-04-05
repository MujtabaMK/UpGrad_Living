//
//  GetFormModel.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 04/04/23.
//

import Foundation

// MARK: - GetFormModel
struct GetFormModel: Codable {
    let status: Int?
    let msg: String?
    let data: FormDataClass?
}

// MARK: - DataClass
struct FormDataClass: Codable {
    let pkid, firstName, middleName, lastName: String?
    let mobile, email, bloddGroupID, bloddGroup: String?
    let gender, dateOfBirth, placeOfBirth, nationality: String?
    let aadhar, pancard, passport, cAddress: String?
    let cCountry, cState, cCity, cPincode: String?
    let isSameAddress, pAddress, pCountry, pState: String?
    let pCity, pPincode, fFirstName, fMiddleName: String?
    let fLastName, fMobile, fEmail, mFirstName: String?
    let mMiddleName, mLastName, mMobile, mEmail: String?
    let gFirstName, gMiddleName, gLastName, gMobile: String?
    let gEmail, gRelation, gAddress, gCountry: String?
    let gState, gCity, gPincode, school: String?
    let program, degree, specialization, roomType: String?
    let paymentOption, roomTypeID, dietry, dietryText: String?
    let fAllergies, fAllergiesText, health, healthText: String?
    let medication, medicationText, allergies, allergiesText: String?
    let surgery, surgeryText, diagnosed, diagnosedText: String?
    let diabetes, diabetesText, hypertension, hypertensionText: String?
    let disorders, disordersText, disease, diseaseText: String?
    let communicable, communicableText, liverD, liverDText: String?
    let heartD, heartDText, arthritis, arthritisText: String?
    let kidneyD, kidneyDText, paralysis, paralysisText: String?
    let congenital, congenitalText, handicaps, handicapsText: String?
    let anyD, anyDText, accept: String?
    let clotting, clottingText, recentlyCovid, recentlyCovidText: String?
    let covidVaccine, covidVaccineText: String?
    let genderName,cCountryName, cStateName,cCityName: String?
    let pCountryName, pStateName,pCityName: String?
    let schoolName, programName: String?
    let gCountryName, gStateName, gCityName: String?
    
    enum CodingKeys: String, CodingKey {
        case pkid, firstName, middleName, lastName, mobile, email
        case bloddGroupID = "bloddGroupId"
        case bloddGroup, gender, dateOfBirth, placeOfBirth, nationality, aadhar, pancard, passport, cAddress, cCountry, cState, cCity, cPincode, isSameAddress, pAddress, pCountry, pState, pCity, pPincode, fFirstName, fMiddleName, fLastName, fMobile, fEmail, mFirstName, mMiddleName, mLastName, mMobile, mEmail
        case gFirstName, gMiddleName, gLastName, gMobile, gEmail, gRelation, gAddress, gCountry, gState, gCity, gPincode, school, program, degree, specialization, roomType, paymentOption
        case roomTypeID = "roomTypeId"
        case dietry
        case dietryText = "dietry_text"
        case fAllergies = "f_allergies"
        case fAllergiesText = "f_allergies_text"
        case health
        case healthText = "health_text"
        case medication
        case medicationText = "medication_text"
        case allergies
        case allergiesText = "allergies_text"
        case surgery
        case surgeryText = "surgery_text"
        case diagnosed
        case diagnosedText = "diagnosed_text"
        case diabetes
        case diabetesText = "diabetes_text"
        case hypertension
        case hypertensionText = "hypertension_text"
        case disorders
        case disordersText = "disorders_text"
        case disease
        case diseaseText = "disease_text"
        case communicable
        case communicableText = "communicable_text"
        case liverD = "liver_d"
        case liverDText = "liver_d_text"
        case heartD = "heart_d"
        case heartDText = "heart_d_text"
        case arthritis
        case arthritisText = "arthritis_text"
        case kidneyD = "kidney_d"
        case kidneyDText = "kidney_d_text"
        case paralysis
        case paralysisText = "paralysis_text"
        case congenital
        case congenitalText = "congenital_text"
        case handicaps
        case handicapsText = "handicaps_text"
        case anyD = "any_d"
        case anyDText = "any_d_text"
        case accept
        case clotting
        case clottingText = "clotting_text"
        case recentlyCovid = "recently_covid"
        case recentlyCovidText = "recently_covid_text"
        case covidVaccine = "covid_vaccine"
        case covidVaccineText = "covid_vaccine_text"
        case genderName,cCountryName,cStateName,cCityName
        case pCountryName,pStateName,pCityName
        case schoolName,programName
        case gCountryName,gStateName,gCityName
    }
}
