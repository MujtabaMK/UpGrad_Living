//
//  UserProfileTicket.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 06/06/23.
//

import SwiftUI
import Kingfisher

struct UserProfileTicket: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var networkMonitor: NetworkMonitor
    
    @State private var studentAppID = UserDefaults.standard.string(forKey: "studentAppID")
    @StateObject private var viewModel = TicketCategoryViewModel()
    @StateObject private var viewModelPast = PastTicketViewModel()
    @StateObject private var viewModelPostImage = PostTicketPhotoViewModel()
    @StateObject private var viewModelSaveTicket = SaveTicketViewModel()
    
    @State private var arrCategory = [TicketCategory]()
    @State private var categoryName = "Select Category"
    @State private var categoryID = ""
    @State private var ticketDescription = ""
    @FocusState private var focusField: RaiseField?
    
    @State private var arrPast = [PastTicket]()
    
    @State private var arrImages = [String]()
    @State private var arrTicketImage = [TicketImageModel]()
    
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var selectedImage: UIImage?
    @State private var isImagePickerDisplay = false
    
    @State private var randomNumber = 0
    
    let imageManager = ImageConverter()
    @State private var base64String = ""
    
    @State private var alertMessage = String()
    @State private var showingalert = false
    @State private var AlertShow = String()
    
    @State private var raiseTicketSelect = false
    @State private var isCatagorySelect = false
    
    var body: some View {
        NavigationView {
            ZStack{
                ScrollView(showsIndicators: false) {
                    ZStack{
                        Image("Home_Top_Background")
                            .resizable()
                            .scaledToFit()
                            .frame(width: getRect().width, height: 290)
                            .padding(.top, -90)
                        VStack{
                            HStack{
                                Button {
                                    raiseTicketSelect = true
                                    presentationMode.wrappedValue.dismiss()
                                } label: {
                                    Image("back_Button")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 30, height: 30)
                                        .padding(.leading, 20)
                                }
                                Spacer(minLength: 0)
                                Text("Tickets")
                                    .font(.custom(OpenSans_Bold, size: 18))
                                    .foregroundColor(colorScheme == .light ? .white : .white)
                                    .padding(.trailing, 30)
                                Spacer(minLength: 0)
                            }
                            Spacer()
                        }
                        .padding(.top, UIDevice.current.hasNotch ? 50 : 20)
                    }
                    VStack{
                        HStack(spacing: 0){
                            HStack{
                                Image(raiseTicketSelect ? "PastTicket_UnSelect" : "pastTicket_Select")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 21, height: 19)
                                
                                Text("Past Tickets")
                                    .font(.custom(OpenSans_SemiBold, size: 14))
                                    .foregroundColor(raiseTicketSelect ? Color(hex: 0xDE1223) : Color(hex: 0xDE1223))
                            }
                            .onTapGesture {
                                raiseTicketSelect = false
                            }
                            .frame(maxWidth: .infinity, minHeight: 55, maxHeight: 55)
                            .background(raiseTicketSelect ? Color(hex: 0xFEF0F1) : Color(hex: 0xFECDD1))
                            .cornerRadius(15, corners: [.topLeft])
                            
                            HStack{
                                Image(raiseTicketSelect ? "Raise_Ticket_Select" : "raise_Ticket_UnSelect")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 21, height: 19)
                                
                                Text("Raise a Tickets")
                                    .font(.custom(OpenSans_SemiBold, size: 14))
                                    .foregroundColor(raiseTicketSelect ? Color(hex: 0xDE1223) : Color(hex: 0xDE1223))
                            }
                            .onTapGesture {
                                raiseTicketSelect = true
                            }
                            .frame(maxWidth: .infinity, minHeight: 55, maxHeight: 55)
                            .background(raiseTicketSelect ? Color(hex: 0xFECDD1) : Color(hex: 0xFEF0F1))
                            .cornerRadius(15, corners: [.topRight])
                        }
                        
                        if raiseTicketSelect{
                            VStack(alignment: .leading, spacing: 5){
                                HStack{
                                    Text("Ticket Category*")
                                        .font(.custom(OpenSans_Bold, size: 16))
                                        .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                                        .padding(.top, 20)
                                    Spacer()
                                }
                                Button {
                                    isCatagorySelect.toggle()
                                } label: {
                                    HStack{
                                        Text(categoryName)
                                            .font(.custom(OpenSans_SemiBold, size: 14))
                                            .foregroundColor(colorScheme == .light ? Color(hex: 0x868686) : Color(hex: 0x868686))
                                            .padding(.leading)
                                        
                                        Spacer()
                                        
                                        Image(isCatagorySelect ?  "User_Category_DeSelect" : "User_Category_Select")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 18, height: 18)
                                            .padding(.trailing)
                                    }
                                    .frame(width: getRect().width - 40, height: 44)
                                    .background(colorScheme == .light ? Color(hex: 0xF9F9F9) : Color(hex: 0x2E2E2E))
                                    .cornerRadius(5)
                                    .shadow(color: .gray, radius: 2, x: 0, y: 0)
                                }
                            }
                            .padding(.leading)
                            if isCatagorySelect{
                                VStack{
                                    ForEach(arrCategory) { category in
                                        Button {
                                            categoryID = category.id ?? ""
                                            categoryName = category.name ?? ""
                                            isCatagorySelect.toggle()
                                        } label: {
                                            VStack{
                                                HStack{
                                                    Text(category.name ?? "")
                                                        .font(.custom(OpenSans_SemiBold, size: 14))
                                                        .foregroundColor(Color(hex: 0x868686))
                                                        .padding(.leading)
                                                        .padding(.top)
                                                    
                                                    Spacer()
                                                }
                                                HLine()
                                                    .stroke(style: StrokeStyle(lineWidth: 0.5, dash: [1]))
                                                    .foregroundColor(colorScheme == .light ? Color(hex: 0x868686) : Color(hex: 0x868686))
                                                    .frame(width: getRect().width - 40,height: 1)
                                                    .padding(.horizontal)
                                            }
                                        }
                                    }
                                }
                                .frame(width: getRect().width - 40)
                                .background(colorScheme == .light ? Color(hex: 0xF9F9F9) : Color(hex: 0x2E2E2E))
                                .cornerRadius(5)
                                .shadow(color: .gray, radius: 2, x: 0, y: 0)
                                .offset(y: -8)
                                .padding(.leading , -5)
                            }
                            
                            VStack(alignment: .leading, spacing: 5){
                                HStack{
                                    Text("Ticket Description*")
                                        .font(.custom(OpenSans_Bold, size: 16))
                                        .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                                        .padding(.top, 20)
                                    Spacer()
                                }
                                TextEditor(text: $ticketDescription)
                                    .font(.custom(OpenSans_SemiBold, size: 12))
                                    .foregroundColor(Color(hex: 0x868686))
                                    .disableAutocorrection(true)
                                    .focused($focusField, equals: .textField)
                                    .onSubmit {
                                        hideKeyboard()
                                    }
                                    .padding(.leading, 4)
                                    .background(colorScheme == .light ? Color(hex: 0xF9F9F9) : Color(hex: 0x2E2E2E))
                                    .cornerRadius(5)
                                    .frame(width: getRect().width - 40, height: 97)
                                    .toolbar {
                                        ToolbarItemGroup(placement: .keyboard) {
                                            Spacer()
                                            Button("Done") {
                                                hideKeyboard()
                                            }
                                        }
                                    }
                                    .shadow(color: .gray, radius: 2, x: 0, y: 0)
                                
                            }
                            .padding(.leading)
                            
                            VStack{
                                HStack{
                                    Text("Media")
                                        .font(.custom(OpenSans_Bold, size: 16))
                                        .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                                    
                                    if arrImages.count > 0{
                                        Text(String(arrImages.count))
                                            .font(.custom(OpenSans_SemiBold, size: 14))
                                            .foregroundColor(colorScheme == .light ? Color(hex: 0x969696) : Color(hex: 0x969696))
                                        
                                        Image("User_Attechment_icon")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 14, height: 12)
                                    }
                                    Spacer()
                                }
                                if arrTicketImage.count != 3{
                                    HStack(spacing: 15){
                                        VStack{
                                            Image("User_Take_Photo_icon")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 41, height: 34, alignment: .center)
                                            
                                            Text("Take photo")
                                                .font(.custom(OpenSans_SemiBold, size: 12))
                                                .foregroundColor(Color(hex: 0x868686))
                                        }
                                        .frame(width: 160, height: 100)
                                        .background(colorScheme == .light ? Color(hex: 0xF9F9F9) : Color(hex: 0x2E2E2E))
                                        .cornerRadius(5)
                                        .shadow(color: .gray, radius: 2, x: 0, y: 0)
                                        .onTapGesture {
                                            self.sourceType = .camera
                                            self.isImagePickerDisplay.toggle()
                                        }
                                        
                                        VStack{
                                            Image("User_Choose_From_Gallery_icon")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 41, height: 34, alignment: .center)
                                            
                                            Text("Choose from gallery")
                                                .font(.custom(OpenSans_SemiBold, size: 12))
                                                .foregroundColor(Color(hex: 0x868686))
                                        }
                                        .frame(width: 160, height: 100)
                                        .background(colorScheme == .light ? Color(hex: 0xF9F9F9) : Color(hex: 0x2E2E2E))
                                        .cornerRadius(5)
                                        .shadow(color: .gray, radius: 2, x: 0, y: 0)
                                        .onTapGesture {
                                            self.sourceType = .photoLibrary
                                            self.isImagePickerDisplay.toggle()
                                        }
                                    }
                                    .padding(.bottom)
                                }
                                
                                HStack(spacing: 15){
                                    ForEach(Array(arrTicketImage.enumerated()), id: \.offset) { index, image in
                                        ZStack(alignment: .topTrailing) {
                                            KFImage(URL(string: image.imageString))
                                                .resizable()
                                                .scaledToFit()
                                                .cornerRadius(8)
                                                .frame(width: 108, height: 108)
                                            
                                            Image(systemName: "xmark.circle.fill")
                                                .renderingMode(.template)
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 30, height: 30)
                                                .offset(y: -10)
                                                .foregroundColor(colorScheme == .light ? Color(hex: 0x000000, alpha: 0.4) : Color(hex: 0xFFFFFF, alpha: 0.4))
                                            
                                                .onTapGesture {
                                                    viewModelPostImage.getPastTicket(
                                                        file_name: "",
                                                        file_base64: "",
                                                        file_ext: "",
                                                        group_id: String(randomNumber),
                                                        docId: String(image.id),
                                                        type: "2",
                                                        appId: studentAppID ?? "") { post in
                                                            if post.status == 1{
                                                                arrTicketImage.remove(at: index)
                                                                arrImages.remove(at: index)
                                                                print(arrTicketImage)
                                                            }else{
                                                                alertMessage = post.msg ?? ""
                                                                AlertShow = "0"
                                                                showingalert = true
                                                            }
                                                        }
                                                }
                                        }
                                    }
                                    Spacer()
                                }
                                .padding(.leading)
                            }
                            .padding(.leading)
                            .padding(.top, 20)
                            .padding(.bottom)
                            .padding(.trailing)
                            
                            VStack{
                                Button {
                                    if categoryID.isEmpty{
                                        alertMessage = "Please Select Category"
                                        AlertShow = "0"
                                        showingalert = true
                                    }else if ticketDescription.isEmpty{
                                        alertMessage = "Please Enter Ticket Description"
                                        AlertShow = "0"
                                        showingalert = true
                                    }else{
                                        viewModelSaveTicket.postSaveTicket(
                                            ticketCategory: categoryID,
                                            group_id: String(randomNumber),
                                            ticketDisc: ticketDescription,
                                            appId: studentAppID ?? "") { saveTicket in
                                                if saveTicket.status == 1{
                                                    categoryName = "Select Category"
                                                    categoryID = ""
                                                    ticketDescription = ""
                                                    arrTicketImage = [TicketImageModel]()
                                                    arrImages = [String]()
                                                    alertMessage = "Ticket Submitted Successfully"
                                                    AlertShow = "1"
                                                    showingalert = true
                                                }else{
                                                    alertMessage = saveTicket.msg ?? ""
                                                    AlertShow = "0"
                                                    showingalert = true
                                                }
                                            }
                                    }
                                } label: {
                                    HStack{
                                        Spacer()
                                        
                                        Text("Submit")//Save & Continue
                                            .font(.custom(OpenSans_SemiBold, size: 15))
                                            .frame(width: 150, alignment: .center)
                                            .font(.custom(OpenSans_SemiBold, size: 14))
                                            .padding()
                                            .foregroundColor(.white)
                                            .background(
                                                LinearGradient(
                                                    colors: [colorScheme == .light ?  Color(hex: 0xB20710) : Color(hex: 0xD24752),
                                                             colorScheme == .light ? Color(hex: 0xEE2C3C) : Color(hex: 0xE73241)],
                                                    startPoint: .leading,
                                                    endPoint: .trailing))
                                            .clipShape(Capsule())
                                        
                                        Spacer()
                                    }
                                }
                            }
                        }
                        
                        if !raiseTicketSelect{
                            UserPastTicket(arrPast: arrPast)
                        }
                        
                    }
                    .frame(maxWidth: getRect().width)
                    .background(colorScheme == .light ? .white : .black)
                    .cornerRadius(15, corners: [.topLeft, .topRight])
                    .offset(y: -80)
                }
                if viewModelPostImage.isLoadingData{
                    LoadingView()
                }
            }
            .onTapGesture{
                hideKeyboard()
            }
            .ignoresSafeArea()
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .onAppear{
                UITextView.appearance().backgroundColor = .clear
                randomNumber = Int.random(in: 100...999)
                
                if networkMonitor.isConnected{
                    viewModel.getTicketCategory { ticket in
                        if ticket.status == 1{
                            arrCategory = ticket.data?.ticketCategories ?? []
                        }else{
                            alertMessage = ticket.msg ?? ""
                            AlertShow = "0"
                            showingalert = true
                        }
                    }
                    viewModelPast.getPastTicket(appId: studentAppID ?? "") { past in
                        if past.status == 1{
                            arrPast = past.data ?? []
                        }else{
                            alertMessage = past.msg ?? ""
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
            .onChange(of: raiseTicketSelect, perform: { newValue in
                if !raiseTicketSelect{
                    if networkMonitor.isConnected{
                        viewModelPast.getPastTicket(appId: studentAppID ?? "") { past in
                            if past.status == 1{
                                arrPast = past.data ?? []
                            }else{
                                alertMessage = past.msg ?? ""
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
            })
            .alert(alertMessage, isPresented: $showingalert) {
                Button("OK", role: .cancel) {
                    if AlertShow == "1"{
                        randomNumber = Int.random(in: 100...999)
                        raiseTicketSelect.toggle()
                    }else{
                        
                    }
                }
            }
            .sheet(isPresented: $isImagePickerDisplay, onDismiss: didDismiss) {
                ImagePickerView(selectedImage: $selectedImage, sourceType: sourceType)
            }
        }
    }
    
    func didDismiss() {
        let b64Str = imageManager.imageToBase64(selectedImage ?? UIImage())
        base64String = b64Str ?? ""
        
        if base64String.count > 0{
            var newFileName = ""
            
            if sourceType == .photoLibrary{
                newFileName = "GalleryPhoto\(Int.random(in: 100...999))"
                print(newFileName)
            }else{
                newFileName = "CameraPhoto\(Int.random(in: 100...999))"
                print(newFileName)
            }
            
            viewModelPostImage.getPastTicket(
                file_name: newFileName,
                file_base64: base64String,
                file_ext: "png",
                group_id: String(randomNumber),
                docId: "",
                type: "1",
                appId: studentAppID ?? "") { post in
                    if post.status == 1{
                        arrTicketImage.append(TicketImageModel(id: post.data?.id ?? 0, imageString: post.data?.fileURL ?? ""))
                        arrImages.append(post.data?.fileURL ?? "")
                        print(arrTicketImage)
                    }else{
                        alertMessage = post.msg ?? ""
                        AlertShow = "0"
                        showingalert = true
                    }
                }
        }
    }
    
    private enum RaiseField {
        case textField
    }
}

struct UserProfileTicket_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileTicket()
    }
}
