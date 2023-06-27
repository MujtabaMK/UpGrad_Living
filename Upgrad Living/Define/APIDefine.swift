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
let Home_Login_API = "\(StartURL)usersLogin"
let Home_Login_OTP_Verify = "\(StartURL)verifyUserOTP"

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

//Booking
let GET_FLOOR = "\(StartURL)getFloors"
let GET_BEDS_DETAILS = "\(StartURL)getBedsDetails"
let POST_FLOOR = "\(StartURL)confirmBed"
let GET_BED_SUCCESS = "\(StartURL)roomDetails"

//Home
let GET_Hoster_offer = "\(StartURL)getHostelOffers"
//Food

let GET_Meal_List = "\(StartURL)mealList"

//Events
let GET_ALL_EVENTS = "\(StartURL)getHostelEvents"
let POST_Add_To_Favorite = "\(StartURL)addToFavorite"
let GET_ALL_Favorite = "\(StartURL)getFavorites"
let GET_Category = "\(StartURL)eventCategories"
let POST_BookTicket = "\(StartURL)bookTicket"
let POST_Reminder = "\(StartURL)addReminder"

//Roomiew
let GET_Roomies_Details = "\(StartURL)roomieProfile"

//Services
let GET_Dining_Details = "\(StartURL)dining"
let GET_Laundry_Details = "\(StartURL)laundry"
let GET_HealthCare_Details = "\(StartURL)healthcare"
let GET_Convinience_Details = "\(StartURL)convinience"

//Community
let GET_Community = "\(StartURL)community"
let GET_Community_Details = "\(StartURL)communityDtl"

//Profile Info
let GET_Profile_Info = "\(StartURL)profileInfo"
let GET_Ticket_Category = "\(StartURL)getTicketCategry"
let GET_Past_Ticket = "\(StartURL)pastTickets"
let GET_Past_Ticket_Details = "\(StartURL)getByTicketId"
let POST_Ticket_Photo = "\(StartURL)uploadTicketDoc"
let POST_Save_Ticket = "\(StartURL)saveTicket"

//Guest Room
let POST_Book_Guest_Room = "\(StartURL)bookGuestRoom"
let GET_Book_Guest_Room = "\(StartURL)myBookings"
let GET_Book_Guest_Room_Details = "\(StartURL)getBookingById"

//Request Approval
let POST_Request_Approval = "\(StartURL)requestApproval"
let GET_Seek_Approval = "\(StartURL)requestList"
let GET_Laundry_Day = "\(StartURL)checkLaundryDay"

//Book Service

let GET_Book_Service_Slot = "\(StartURL)getBookingSlots"
let POST_Book_Service_Slot = "\(StartURL)slotBooking"
let GET_Details_Book_Service_Slot = "\(StartURL)mySlotBookings"

//PARENT

//Home
let GET_Parent_Home_Details = "\(StartURL)parentsHomeScreen"
let GET_Parent_Pending_Details = "\(StartURL)pendingRequestList"

//Pending Approval
let POST_Parent_Pending_Action = "\(StartURL)takeAction"

