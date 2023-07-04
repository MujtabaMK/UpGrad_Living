//
//  UserProfile.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 01/06/23.
//

import SwiftUI
import Kingfisher

struct UserProfile: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var networkMonitor: NetworkMonitor
    @State private var studentAppID = UserDefaults.standard.string(forKey: "studentAppID")
    
    @Binding var isBackUserProfile: Bool
    @Binding var isLogout: Bool
    
    @State private var showActionSheet = false
    
    @State private var showingAlert = false
    @State private var alertTitle = ""
    @State private var buttonTitle = ""
    
    @State private var alertMessage = String()
    @State private var showingalert = false
    @State private var AlertShow = String()
    
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var selectedImage: UIImage?
    @State private var isImagePickerDisplay = false
    
    @State private var isShowPhotoPopup = false
    
    @State private var isProfileDetails = false
    @State private var isUserInterest = false
    @State private var isUserHelpDesk = false
    @State private var isUserTicket = false
    @State private var isCheckINOUTPopup = false
    
   
    @State private var profileImg = ""
    @State private var studentName = ""
    @State private var RoomNumber = ""
    @State private var applicationId = ""
    @State private var mobileNumber = ""
    @State private var emailId = ""
    
    @State private var studnetDate = ""
    @State private var exitTime = ""
    @State private var enteryTime = ""
    
    let imageManager = ImageConverter()
    @State private var base64String = ""
    //
    
    @State private var document: InputDoument = InputDoument(input: "")
    @StateObject private var viewModel = PostDocumentViewModel()
    @State private var isImporting: Bool = false
    @State private var fileName = ""
    
    @StateObject private var viewModelProfile = ProfileInfoViewModel()
    
    var body: some View {
        ZStack{
            ScrollView(showsIndicators: false) {
                ZStack(alignment: .top){
                    Image("Home_Top_Background")
                        .resizable()
                        .scaledToFit()
                        .frame(width: getRect().width, height: 390)
                        .padding(.top, -100)
                    VStack{
                        HStack{
                            Button {
                                isBackUserProfile = true
                            } label: {
                                Image("back_Button")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                    .padding(.leading, 20)
                            }
                            Spacer(minLength: 0)
                            Text("Profile")
                                .font(.custom(OpenSans_SemiBold, size: 18))
                                .foregroundColor(colorScheme == .light ? .white : .white)
                                .padding(.trailing, 30)
                            Spacer(minLength: 0)
                        }
                        Spacer()
                    }
                    .padding(.top, UIDevice.current.hasNotch ? 50 : 20)
                }
                ZStack(alignment: .bottomTrailing) {
                    VStack{
                        KFImage(URL(string: profileImg))
                            .placeholder{
                                    ProgressView()
                                        .progressViewStyle(CircularProgressViewStyle(tint: Color("Student_Profile1")))
                                }
                            .resizable()
                            .scaledToFill()
                            .frame(width: 143, height: 143)
                            .clipShape(Circle())
                            .padding(5)
                            .background(colorScheme == .light ? .white : .black)
                            .clipShape(Circle())
                    }
                    Button {
                        isShowPhotoPopup = true
                    } label: {
                        Image("Community_capture")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                            .padding(.bottom, -25)
                            .padding(.trailing, -5)
                    }
                }
                .offset(y: -210)
                .zIndex(1)
                VStack{
                    VStack{
                        VStack{
                            Text(studentName)
                                .font(.custom(OpenSans_Bold, size: 16))
                                .foregroundColor(colorScheme == .light ? Color(hex: 0x333333) : Color(hex: 0xFFFFFF))
                                .padding(.top, 100)
                            Rectangle()
                                .fill(colorScheme == .light ? Color(hex: 0x969696) : Color(hex: 0x969696))
                                .frame(width: 105, height: 1)
                            HStack{
                                Text("Room No.")
                                    .font(.custom(OpenSans_Bold, size: 16))
                                    .foregroundColor(colorScheme == .light ? Color(hex: 0x868686) : Color(hex: 0x868686))
                                Text(RoomNumber)
                                    .font(.custom(OpenSans_Bold, size: 16))
                                    .foregroundColor(colorScheme == .light ? Color(hex: 0xDE1223) : Color(hex: 0xDE1223))
                            }
                            VStack(alignment: .leading){
                                HStack(spacing: 10){
                                    VStack(alignment: .leading){
                                        HStack{
                                            Spacer()
                                            Image("Profile_AppId_icon")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 29, height: 35)
                                                .padding(.trailing)
                                        }
                                        Text("Application ID")
                                            .font(.custom(OpenSans_SemiBold, size: 12))
                                            .foregroundColor(Color(hex: 0x868686))
                                            .padding(.leading)
                                        Text(applicationId)
                                            .font(.custom(OpenSans_SemiBold, size: 14))
                                            .foregroundColor(colorScheme == .light ? Color(hex: 0x333333) : Color(hex: 0x333333))
                                            .padding(.leading)
                                    }
                                    .frame(height: 110)
                                    .background(Color(hex: 0xCDC8EC))
                                    .cornerRadius(8, corners: [.topLeft])
                                    
                                    VStack(alignment: .leading){
                                        HStack{
                                            Spacer()
                                            Image("Profile_MobileNo_icon")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 29, height: 35)
                                                .padding(.trailing)
                                        }
                                        Text("Mob no.")
                                            .font(.custom(OpenSans_SemiBold, size: 12))
                                            .foregroundColor(Color(hex: 0x868686))
                                            .padding(.leading)
                                        Text(mobileNumber)
                                            .font(.custom(OpenSans_SemiBold, size: 14))
                                            .foregroundColor(colorScheme == .light ? Color(hex: 0x333333) : Color(hex: 0x333333))
                                            .padding(.leading)
                                    }
                                    .frame(height: 110)
                                    .background(Color(hex: 0xC5E2F1))
                                    .cornerRadius(8, corners: [.topRight])
                                    
                                }
                                .padding(.horizontal, 30)
                                
                                VStack(alignment: .leading){
                                    HStack{
                                        Spacer()
                                        Image("Profile_email_icon")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 33, height: 29)
                                            .padding(.trailing)
                                    }
                                    Text("Email id")
                                        .font(.custom(OpenSans_SemiBold, size: 12))
                                        .foregroundColor(Color(hex: 0x868686))
                                        .padding(.leading)
                                    Text(emailId)
                                        .font(.custom(OpenSans_SemiBold, size: 14))
                                        .accentColor(colorScheme == .light ? Color(hex: 0x333333) : Color(hex: 0x333333))
                                        .padding(.leading)
                                }
                                .frame(height: 100)
                                .background(Color(hex: 0xFF9CA5))
                                .cornerRadius(8, corners: [.bottomLeft, .bottomRight])
                                .padding(.horizontal, 30)
                                
                                VStack(alignment: .leading){
                                    Text("Account")
                                        .font(.custom(OpenSans_Bold, size: 16))
                                        .foregroundColor(colorScheme == .light ? Color(hex: 0x333333) : Color(hex: 0xFFFFFF))
                                        .padding(.top)
                                        .padding(.leading)
                                    
                                    VStack{
                                        HStack{
                                            Image("Profile_Person_icon")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 19, height: 22)
                                            
                                            Text("Profile details")
                                                .font(.custom(OpenSans_SemiBold, size: 14))
                                                .foregroundColor(colorScheme == .light ? Color(hex: 0x868686) : Color(hex: 0xFFFFFF))
                                            
                                            Spacer()
                                            
                                            Image("Profile_arrow_icon")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 18, height: 18)
                                            
                                        }
                                        .onTapGesture {
                                            isProfileDetails = true
                                        }
                                        .padding(.horizontal, 20)
                                        .padding(.top)
                                        Rectangle()
                                            .strokeBorder(style: StrokeStyle(lineWidth: 0.2, dash: [1]))
                                            .frame(maxWidth: .infinity, maxHeight: 1)
                                            .padding(.leading, 20)
                                            .padding(.trailing, 20)
                                        
                                        HStack{
                                            Image("Profile_Person_icon")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 19, height: 22)
                                            
                                            Text("My interests")
                                                .font(.custom(OpenSans_SemiBold, size: 14))
                                                .foregroundColor(colorScheme == .light ? Color(hex: 0x868686) : Color(hex: 0xFFFFFF))
                                            
                                            Spacer()
                                            
                                            Image("Profile_arrow_icon")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 18, height: 18)
                                            
                                        }
                                        .onTapGesture {
                                            isUserInterest = true
                                        }
                                        .padding(.horizontal, 20)
                                        .padding(.top)
                                        Rectangle()
                                            .strokeBorder(style: StrokeStyle(lineWidth: 0.2, dash: [1]))
                                            .frame(maxWidth: .infinity, maxHeight: 1)
                                            .padding(.leading, 20)
                                            .padding(.trailing, 20)
                                        
                                        HStack{
                                            Image("User_CheckIn_CheckOut")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 19, height: 22)
                                            
                                            Text("Check in/ Check out")
                                                .font(.custom(OpenSans_SemiBold, size: 14))
                                                .foregroundColor(colorScheme == .light ? Color(hex: 0x868686) : Color(hex: 0xFFFFFF))
                                            
                                            Spacer()
                                            
                                            Image("Profile_arrow_icon")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 18, height: 18)
                                            
                                        }
                                        .onTapGesture {
                                            isCheckINOUTPopup = true
                                        }
                                        .padding(.horizontal, 20)
                                        .padding(.top)
                                        Rectangle()
                                            .strokeBorder(style: StrokeStyle(lineWidth: 0.2, dash: [1]))
                                            .frame(maxWidth: .infinity, maxHeight: 1)
                                            .padding(.leading, 20)
                                            .padding(.trailing, 20)
                                        
                                        HStack{
                                            Image("Profile_Hostal_Payment_icon")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 19, height: 22)
                                            
                                            Text("Hostel payment")
                                                .font(.custom(OpenSans_SemiBold, size: 14))
                                                .foregroundColor(colorScheme == .light ? Color(hex: 0x868686) : Color(hex: 0xFFFFFF))
                                            
                                            Spacer()
                                            
                                            Image("Profile_arrow_icon")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 18, height: 18)
                                            
                                        }
                                        .padding(.horizontal, 20)
                                        .padding(.top)
                                        .padding(.bottom, 5)
                                    }
                                    .padding(.vertical)
                                    .background(colorScheme == .light ? .white : Color(hex: 0x2E2E2E))
                                    .frame(width: getRect().width - 40)
                                    .cornerRadius(15)
                                    .padding(.horizontal)
                                    .overlay{
                                        RoundedRectangle(cornerRadius: 15)
                                            .strokeBorder(Color(hex: 0xF36773), lineWidth: 1)
                                            .padding(.horizontal)
                                            .shadow(color: .gray, radius: 3, x: 0, y: 0)
                                    }
                                    
                                }
                                
                                VStack(alignment: .leading){
                                    Text("Other")
                                        .font(.custom(OpenSans_Bold, size: 16))
                                        .foregroundColor(colorScheme == .light ? Color(hex: 0x333333) : Color(hex: 0xFFFFFF))
                                        .padding(.top)
                                        .padding(.leading)
                                    
                                    VStack{
                                        HStack{
                                            Image("Profile_Helpdesk_icon")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 19, height: 22)
                                            
                                            Text("Help Desk")
                                                .font(.custom(OpenSans_SemiBold, size: 14))
                                                .foregroundColor(colorScheme == .light ? Color(hex: 0x868686) : Color(hex: 0xFFFFFF))
                                            
                                            Spacer()
                                            
                                            Image("Profile_arrow_icon")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 18, height: 18)
                                            
                                        }
                                        .onTapGesture{
                                            isUserHelpDesk = true
                                        }
                                        .padding(.horizontal, 20)
                                        .padding(.top)
                                        Rectangle()
                                            .strokeBorder(style: StrokeStyle(lineWidth: 0.2, dash: [1]))
                                            .frame(maxWidth: .infinity, maxHeight: 1)
                                            .padding(.leading, 20)
                                            .padding(.trailing, 20)
                                        
                                        HStack{
                                            Image("Profile_RaiseTicket_icon")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 19, height: 22)
                                            
                                            Text("Raise a ticket")
                                                .font(.custom(OpenSans_SemiBold, size: 14))
                                                .foregroundColor(colorScheme == .light ? Color(hex: 0x868686) : Color(hex: 0xFFFFFF))
                                            
                                            Spacer()
                                            
                                            Image("Profile_arrow_icon")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 18, height: 18)
                                            
                                        }
                                        .onTapGesture{
                                            isUserTicket = true
                                        }
                                        .padding(.horizontal, 20)
                                        .padding(.top)
                                        Rectangle()
                                            .strokeBorder(style: StrokeStyle(lineWidth: 0.2, dash: [1]))
                                            .frame(maxWidth: .infinity, maxHeight: 1)
                                            .padding(.leading, 20)
                                            .padding(.trailing, 20)
                                        
                                        HStack{
                                            Image("Profile_Handbook_icon")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 19, height: 22)
                                            
                                            Text("upGrad Living Handbook")
                                                .font(.custom(OpenSans_SemiBold, size: 14))
                                                .foregroundColor(colorScheme == .light ? Color(hex: 0x868686) : Color(hex: 0xFFFFFF))
                                            
                                            Spacer()
                                            
                                            Image("Profile_arrow_icon")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 18, height: 18)
                                        }
                                        .padding(.horizontal, 20)
                                        .padding(.top)
                                        .padding(.bottom, 5)
                                    }
                                    .padding(.vertical)
                                    .background(colorScheme == .light ? .white : Color(hex: 0x2E2E2E))
                                    .frame(width: getRect().width - 40)
                                    .cornerRadius(15)
                                    .padding(.horizontal)
                                    .overlay{
                                        RoundedRectangle(cornerRadius: 15)
                                            .strokeBorder(Color(hex: 0xF36773), lineWidth: 1)
                                            .padding(.horizontal)
                                            .shadow(color: .gray, radius: 3, x: 0, y: 0)
                                    }
                                }
                                .padding(.top, 20)
                                
                                VStack(alignment: .center){
                                    HStack{
                                        Image("Profile_Logout_icon")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 19, height: 17)
                                        
                                        Text("Log out")
                                            .font(.custom(OpenSans_SemiBold, size: 14))
                                            .foregroundColor(Color(hex: 0xDE1223))
                                    }
                                    .frame(width: getRect().width - 90, height: 50, alignment: .center)
                                    .background(Color(hex: 0xFEEEF0))
                                    .cornerRadius(30)
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 30)
                                            .strokeBorder(Color(hex: 0xF36773), lineWidth: 1)
                                            .shadow(color: .gray, radius: 3, x: 0, y: 0)
                                    }
                                    .onTapGesture {
                                        alertTitle = "Are you sure you want to Logout?"
                                        buttonTitle = "Logout"
                                        showingAlert = true
                                    }
                                    
                                    Text("Delete Account")
                                        .font(.custom(OpenSans_SemiBold, size: 14))
                                        .foregroundColor(Color(hex: 0xDE1223))
                                        .underline(true, color: Color(hex: 0xDE1223))
                                        .padding(.top, 15)
                                        .onTapGesture {
                                            alertTitle = "Are you sure you want to Delete your Account?"
                                            buttonTitle = "Delete"
                                            showingAlert = true
                                        }
                                    
                                }
                                .padding(.leading, 40)
                                .padding(.top)
                            }
                        }
                    }
                }
                .frame(maxWidth: getRect().width)
                .background(colorScheme == .light ? .white : .black)
                .cornerRadius(15, corners: [.topLeft, .topRight])
                .offset(y: -290)
                .padding(.bottom, -290)
                
                NavigationLink(
                    "",
                    destination: UserProfileDetailsView().navigationBarHidden(true),
                    isActive: $isProfileDetails).isDetailLink(false)
                
                NavigationLink(
                    "",
                    destination: UserIntrestsView().navigationBarHidden(true),
                    isActive: $isUserInterest).isDetailLink(false)
                
                NavigationLink(
                    "",
                    destination: UserProfileHelpDeskView().navigationBarHidden(true),
                    isActive: $isUserHelpDesk).isDetailLink(false)
                
                NavigationLink(
                    "",
                    destination: UserProfileTicket().navigationBarHidden(true),
                    isActive: $isUserTicket).isDetailLink(false)
            }
            if isShowPhotoPopup{
                VStack(spacing: 30){
                    HStack{
                        Spacer()
                        
                        Image(systemName: "xmark")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 15, height: 15)
                            .foregroundColor(colorScheme == .light ? .black : .white)
                            .padding(.trailing)
                            .onTapGesture {
                                isShowPhotoPopup = false
                            }
                    }
                    
                    Text("Change Profile Picture")
                        .font(.custom(OpenSans_Bold, size: 18))
                        .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                    
                    if selectedImage != nil {
                        Image(uiImage: selectedImage!)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 143, height: 143)
                            .clipShape(Circle())
                    }else{
                        KFImage(URL(string: profileImg))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 143, height: 143)
                            .clipShape(Circle())
                    }
                    
                    RoundedRectangle(cornerRadius: 30)
                        .strokeBorder(Color(hex: 0xD9404C), lineWidth: 1)
                        .padding(.horizontal)
                        .frame(width: 230, height: 50)
                        .overlay {
                            Text("Browse")
                                .font(.custom(OpenSans_SemiBold, size: 15))
                                .foregroundColor(colorScheme == .light ? Color(hex: 0xDE1223) : Color(hex: 0xDE1223))
                        }
                        .onTapGesture {
//                            self.sourceType = .photoLibrary
//                            self.isImagePickerDisplay.toggle()
                            isImporting = true
                        }
                    
                    
                    RoundedRectangle(cornerRadius: 30)
                        .fill(
                            LinearGradient(colors: [Color(hex: 0xB20710), Color(hex: 0xEE2C3C)], startPoint: .leading, endPoint: .trailing)
                        )
                        .frame(width: 230, height: 50)
                        .overlay{
                            HStack{
                                Image("Profile_Save_icon")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 24, height: 24)
                                
                                Text("Save Picture")
                                    .font(.custom(OpenSans_SemiBold, size: 15))
                                    .foregroundColor(Color(hex: 0xFFFFFF))
                                
                            }
                        }
                        .padding(.horizontal)
                }
                .padding()
                .padding(.vertical)
                .background(colorScheme == .light ? Color(hex: 0xFFFFFF) : Color(hex: 0x2E2E2E))
                .cornerRadius(15)
                .frame(width: getRect().width - 40)
                .shadow(color: .gray, radius: 4, x: 0, y: 0)
            }
            if viewModel.isLoadingData{
                LoadingView()
            }
            if viewModelProfile.isLoadingData{
                LoadingView()
            }
            if isCheckINOUTPopup{
                UserCheckInCheckOut(
                    show: $isCheckINOUTPopup,
                    studentDate: $studnetDate,
                    exitTime: $exitTime,
                    entryTime: $enteryTime
                )
            }
        }
        .edgesIgnoringSafeArea(.top)
        .alert(isPresented:$showingAlert) {
            Alert(
                title: Text(alertTitle),
                message: Text(""),
                primaryButton: .destructive(Text(buttonTitle)) {
                    UserDefaults.standard.set(false, forKey: "isLogin")
                    isLogout = true
                },
                secondaryButton: .cancel()
            )
        }
        .actionSheet(isPresented: $showActionSheet) {
            ActionSheet(title: Text(""), message: Text("Choose one of this:"), buttons: [
                .default(Text("Gallery")) {
                    self.sourceType = .photoLibrary
                    self.isImagePickerDisplay.toggle()
                },
                .default(Text("Camera")) {
                    self.sourceType = .camera
                    self.isImagePickerDisplay.toggle()
                },
                .cancel()
            ])
        }
        .fileImporter(isPresented: $isImporting, allowedContentTypes: [.png, .jpeg]) { result in
            do{
                let fileUrl = try result.get()
                let NewFileNmae = fileUrl.lastPathComponent
                let fullNameArr = NewFileNmae.components(separatedBy: ".")
                if fullNameArr.count > 1{
                    self.fileName = fullNameArr[1]
                }
                if fileUrl.startAccessingSecurityScopedResource() {
                    defer {
                        DispatchQueue.main.async {
                            fileUrl.stopAccessingSecurityScopedResource()
                        }
                    }
                    do {
                        let fileData = try Data.init(contentsOf: fileUrl)
                        let array = [UInt8](fileData)
                        print("Image size in bytes:\(array.count)")
                        if array.count < 2168584{
                            let fileStream:String = fileData.base64EncodedString()
                            base64String = fileStream
                            viewModel.postUploadDocument(file_name: "photograph",
                                                         file_base64: base64String,
                                                         file_ext: fileName,
                                                         doc_upload_doc_id: "104",
                                                         appId: studentAppID ?? "") { postDoc in
                                if postDoc.status == 1{
                                    profileImg = ""
                                    getAPI()
                                    alertMessage = "Profile Picture Upload Successfully"
                                    AlertShow = "1"
                                    showingalert = true
                                }else{
                                    alertMessage = postDoc.msg ?? ""
                                    showingalert = true
                                }
                            }
                        }else{
                            alertMessage = "File Size Should be less than 2MB"
                            showingalert = true
                        }
                    } catch {
                        print("error")
                        print(error.localizedDescription)
                    }
                }
            }catch{
                print("Error reading docs")
                print(error.localizedDescription)
            }
        }
        .alert(alertMessage, isPresented: $showingalert) {
            Button("OK", role: .cancel) {
                if AlertShow == "1"{

                }else{
                    
                }
            }
        }
        .onAppear{
            if networkMonitor.isConnected{
                viewModelProfile.getProfileInfo(appId: studentAppID ?? "") { profile in
                    if profile.status == 1{
                        clearKingFisherCache()
                        
                        profileImg = profile.data?.profile?.profileImg ?? ""
                        studentName = profile.data?.profile?.studntName ?? ""
                        RoomNumber = profile.data?.profile?.livSBedNo ?? ""
                        applicationId = profile.data?.profile?.appID ?? ""
                        mobileNumber = profile.data?.profile?.mob ?? ""
                        emailId = profile.data?.profile?.email ?? ""
                        studnetDate = profile.data?.studentTime?.date ?? ""
                        exitTime = profile.data?.studentTime?.exitTime ?? ""
                        enteryTime = profile.data?.studentTime?.enteryTime ?? ""
                        
                        do{
                            // Create JSON Encoder
                            let encoder = JSONEncoder()
                            
                            // Encode Note
                            let data = try encoder.encode(profile)
                            
                            // Write/Set Data
                            UserDefaults.standard.set(data, forKey: "profileInfo")
                        }catch{
                            print("Unable to Encode Array of Notes (\(error))")
                        }
                        
                    }else{
                        alertMessage = profile.msg ?? ""
                        AlertShow = "0"
                        showingalert = true
                    }
                }
            }else{
                alertMessage = "Please Check Your Internet Connection"
                AlertShow = "0"
                showingalert = true
            }
        }
    }
    
    func didDismiss() {
        let b64Str = imageManager.imageToBase64(selectedImage ?? UIImage())
        base64String = b64Str ?? ""
     }
    
    func getAPI(){
        if networkMonitor.isConnected{
            viewModelProfile.getProfileInfo(appId: studentAppID ?? "") { profile in
                if profile.status == 1{
                    clearKingFisherCache()
                    profileImg = profile.data?.profile?.profileImg ?? ""
                    studentName = profile.data?.profile?.studntName ?? ""
                    RoomNumber = profile.data?.profile?.livSBedNo ?? ""
                    applicationId = profile.data?.profile?.appID ?? ""
                    mobileNumber = profile.data?.profile?.mob ?? ""
                    emailId = profile.data?.profile?.email ?? ""
                    studnetDate = profile.data?.studentTime?.date ?? ""
                    exitTime = profile.data?.studentTime?.exitTime ?? ""
                    enteryTime = profile.data?.studentTime?.enteryTime ?? ""
                    isShowPhotoPopup = false
                }else{
                    alertMessage = profile.msg ?? ""
                    AlertShow = "0"
                    showingalert = true
                }
            }
        }else{
            alertMessage = "Please Check Your Internet Connection"
            AlertShow = "0"
            showingalert = true
        }
    }
    func clearKingFisherCache(){
        KingfisherManager.shared.cache.clearMemoryCache()
        KingfisherManager.shared.cache.clearDiskCache()
        KingfisherManager.shared.cache.cleanExpiredDiskCache()
    }
}
