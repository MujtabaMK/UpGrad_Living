//
//  APIDefine.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 24/03/23.
//

import Foundation

//Base API
let StartURL = BaseAPI.shared.BaseURL

//Login API
let Login_API = "\(StartURL)loginOTPApp"
let Login_OTP_Verify_API = "\(StartURL)loginOTPVerify"

//Master API
let Master_API = "\(StartURL)masters"

//Form API
let Countries_API = "\(StartURL)countries"
let School_API = "\(StartURL)schools"
let School_Details_Submit_API = "\(StartURL)saveFirstStep"
let Parent_Details_Submit_API = "\(StartURL)saveSecondStep"
let Enrollment_Details_Submit_API = "\(StartURL)saveThirdStep"
let RoomType_Submit_API = "\(StartURL)saveFourthStep"
let Medical_Details_Submit_API = "\(StartURL)saveFifthStep"
let Documentation_Details_Submit_API = "\(StartURL)saveSixthStep"
let GET_App_Details = "\(StartURL)getAppDetail"
let GET_Step = "\(StartURL)getStep"

//Save Profile
let POST_Save_Profile = "\(StartURL)saveProfile"

//Upload Document API
let POST_Upload_Document = "\(StartURL)uploadDoc"
let GET_Upload_Document = "\(StartURL)getDocuments"
let VERIFY_Upload_Document = "\(StartURL)verifyDoc"
