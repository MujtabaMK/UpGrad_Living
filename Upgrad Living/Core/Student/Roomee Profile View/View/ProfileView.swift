//
//  ProfileView.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 16/05/23.
//

import SwiftUI
import Kingfisher

struct ProfileView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var networkMonitor: NetworkMonitor
    @StateObject private var viewModel = GetProfileViewModel()
    
    @State private var studentAppID = UserDefaults.standard.string(forKey: "studentAppID")
    @State private var RoomieAppID = UserDefaults.standard.string(forKey: "RoomieAppID")
    
    @State private var isHome = false
    
    @State private var alertMessage = String()
    @State private var showingAlert = false
    @State private var AlertShow = String()
    
    var RoomieId: String
    
    var threeColumnGrid = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    var colors: [Color] = [Color(hex: 0xFEEEF0), Color(hex: 0xA3E4E6), Color(hex: 0xDDDBF3),Color(hex: 0xFEEEF0), Color(hex: 0xA3E4E6), Color(hex: 0xDDDBF3)].shuffled()
    
    //Get Data
    
    @State private var studentName = ""
    @State private var studentImage = ""
    @State private var studentState = ""
    @State private var studentCity = ""
    @State private var studentBloodGroup = ""
    
    @State private var arrCreativity = [Creativity]()
    @State private var arrSports = [Sport]()
    @State private var arrEntertainment = [Entertainment]()
    @State private var arrGoindOut = [GoingOut]()
    @State private var arrFood = [FoodAndDrink]()
    @State private var arrValue = [ValuesAndTrait]()
    @State private var arrRoomies = [RoomMate]()
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom){
                ScrollView(showsIndicators: false){
                    VStack{
                        ZStack(alignment: .top){
                            Image("Home_Top_Background_New")
                                .resizable()
                                .scaledToFill()
                                .frame(width: getRect().width, height: 250)
                            VStack{
                                HStack{
                                    Button {
                                        isHome = true
                                    } label: {
                                        Image("back_Button")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 30, height: 30)
                                            .padding(.leading, 20)
                                    }
                                    Spacer(minLength: 0)
                                    Text("Your Roomie")
                                        .font(.custom(OpenSans_SemiBold, size: 18))
                                        .foregroundColor(colorScheme == .light ? .white : .white)
                                        .padding(.trailing, 30)
                                    Spacer(minLength: 0)
                                }
//                                bckimg
//                                    .overlay {
//                                        KFImage(URL(string: studentImage))
//                                            .resizable()
//                                            .scaledToFit()
//                                            .frame(width: 95, height: 110)
//                                            .mask { bckimg }
//                                    }
                                
                                KFImage(URL(string: studentImage))
                                    .placeholder{
                                            ProgressView()
                                                .progressViewStyle(CircularProgressViewStyle(tint: Color("Student_Profile1")))
                                        }
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 143, height: 143)
                                    .clipShape(Circle())
                                    .padding(5)
                                    .background(colorScheme == .light ? .white : .white)
                                    .clipShape(Circle())
                                    .offset(y: 23)
                            }
                            .padding(.top, UIDevice.current.hasNotch ? 50 : 20)
                        }
                        VStack{
                            HStack{
                                Spacer()
                                Text(studentName)
                                    .font(.custom(OpenSans_Bold, size: 18))
                                    .foregroundColor(colorScheme == .light ? Color(hex: 0x333333) : Color(hex: 0xFFFFFF))
                                Spacer()
                            }
                        }
                        .frame(width: 295, height: 68)
                        .background(colorScheme == .light ? .white : .black)
                        .cornerRadius(20)
                        .shadow(color: .gray, radius: 2, x: 0, y: 0)
                        .offset(y: -20)
                        .zIndex(1)
                        
                        VStack{
                            VStack{
                                HStack{
                                    VStack(alignment: .leading){
                                        Text("Residence")
                                            .font(.custom(OpenSans_Bold, size: 16))
                                            .foregroundColor(Color(hex: 0x1D1617))
                                            .padding(.bottom, 5)
                                        
                                        Text("\(studentCity),")
                                            .font(.custom(OpenSans_SemiBold, size: 14))
                                            .foregroundColor(Color(hex: 0x696969))
                                        
                                        Text(studentState)
                                            .font(.custom(OpenSans_SemiBold, size: 14))
                                            .foregroundColor(Color(hex: 0x696969))
                                    }
                                    Spacer()
                                    Image("Profile_Location")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 92, height: 92)
                                }
                                .padding(.horizontal)
                                .padding()
                            }
                            .frame(maxWidth: getRect().width - 40)
                            .background(
                                LinearGradient(colors: [Color(hex: 0xB5DADC), Color(hex: 0xCAEDE9)], startPoint: .topLeading, endPoint: .bottomTrailing)
                            )
                            .cornerRadius(20)
                            .padding(.top, 80)
                            .shadow(color: .gray, radius: 3, x: 0, y: 0)
                            
                            VStack{
                                HStack{
                                    VStack(alignment: .leading){
                                        Text("Blood Group")
                                            .font(.custom(OpenSans_Bold, size: 16))
                                            .foregroundColor(Color(hex: 0x1D1617))
                                            .padding(.bottom, 5)
                                        
                                        Text(studentBloodGroup)
                                            .font(.custom(OpenSans_SemiBold, size: 14))
                                            .foregroundColor(Color(hex: 0x696969))
                                    }
                                    Spacer()
                                    Image("Profile_Blood_Group")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 92, height: 92)
                                }
                                .padding(.horizontal)
                                .padding()
                            }
                            .frame(maxWidth: getRect().width - 40)
                            .background(
                                LinearGradient(colors: [Color(hex: 0xEBB6D6), Color(hex: 0xFAD7E7)], startPoint: .topLeading, endPoint: .bottomTrailing)
                            )
                            .cornerRadius(20)
                            .padding(.top)
                            .shadow(color: .gray, radius: 3, x: 0, y: 0)
                            
                            VStack{
                                HStack{
                                    VStack(alignment: .leading){
                                        Text("Dietary Preference")
                                            .font(.custom(OpenSans_Bold, size: 16))
                                            .foregroundColor(Color(hex: 0x1D1617))
                                            .padding(.bottom, 5)
                                        
                                        Text("Veg")
                                            .font(.custom(OpenSans_SemiBold, size: 14))
                                            .foregroundColor(Color(hex: 0x696969))
                                    }
                                    Spacer()
                                    Image("Profile_Diatry")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 92, height: 92)
                                }
                                .padding(.horizontal)
                                .padding()
                            }
                            .frame(maxWidth: getRect().width - 40)
                            .background(
                                LinearGradient(colors: [Color(hex: 0xD3CEF6), Color(hex: 0xC0CFE5)], startPoint: .topLeading, endPoint: .bottomTrailing)
                            )
                            .cornerRadius(20)
                            .padding(.top)
                            .shadow(color: .gray, radius: 3, x: 0, y: 0)
                            
                            VStack(alignment: .leading){
                                VStack(alignment: .leading){
                                    StrokeText(text: "Favourites", width: 1.0, color: Color(hex: 0xF47781, alpha: 0.8))
                                        .foregroundColor(colorScheme == .light ?  Color(hex: 0xFFFFFF) : Color(hex: 0x000000))
                                        .font(.custom(OpenSans_Bold, size: 35))
                                        .padding(.top)
                                        .multilineTextAlignment(.leading)
                                        .padding(.leading)
                                }
                                VStack{
                                    VStack(alignment: .leading){
                                        Text("Creativity")
                                            .font(.custom(OpenSans_Bold, size: 16))
                                            .foregroundColor(Color(hex: 0x868686))
                                        
                                        LazyVGrid(columns: threeColumnGrid) {
                                            ForEach(Array(arrCreativity.enumerated()), id: \.offset) { index, element in
                                                Text(element.creativityName ?? "")
                                                    .font(.custom(OpenSans_SemiBold, size: 10))
                                                    .foregroundColor(Color(hex: 0x333333))
                                                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50)
                                                    .background(colors[safe: index] ?? colors[safe: index - colors.count])
                                                    .cornerRadius(15)
                                                    .overlay(
                                                        RoundedRectangle(
                                                            cornerRadius: 15.0)
                                                        .strokeBorder(.gray,
                                                                      style: StrokeStyle(lineWidth: 1.0))
                                                    )
                                                    .padding(.horizontal, 6)
                                            }
                                        }
                                    }
                                    .padding(.horizontal)
                                    
                                    VStack(alignment: .leading){
                                        Text("Sports")
                                            .font(.custom(OpenSans_Bold, size: 16))
                                            .foregroundColor(Color(hex: 0x868686))
                                        
                                        LazyVGrid(columns: threeColumnGrid) {
                                            ForEach(Array(arrSports.enumerated()), id: \.offset) { index, element in
                                                Text(element.sportsName ?? "")
                                                    .font(.custom(OpenSans_SemiBold, size: 10))
                                                    .foregroundColor(Color(hex: 0x333333))
                                                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50)
                                                    .background(colors[safe: index] ?? colors[safe: index - colors.count])
                                                    .cornerRadius(15)
                                                    .overlay(
                                                        RoundedRectangle(
                                                            cornerRadius: 15.0)
                                                        .strokeBorder(.gray,
                                                                      style: StrokeStyle(lineWidth: 1.0))
                                                    )
                                                    .padding(.horizontal, 6)
                                            }
                                        }
                                    }
                                    .padding(.horizontal)
                                    
                                    VStack(alignment: .leading){
                                        Text("Entertainment")
                                            .font(.custom(OpenSans_Bold, size: 16))
                                            .foregroundColor(Color(hex: 0x868686))
                                        
                                        LazyVGrid(columns: threeColumnGrid) {
                                            ForEach(Array(arrEntertainment.enumerated()), id: \.offset) { index, element in
                                                Text(element.entertainmentName ?? "")
                                                    .font(.custom(OpenSans_SemiBold, size: 10))
                                                    .foregroundColor(Color(hex: 0x333333))
                                                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50)
                                                    .background(colors[safe: index] ?? colors[safe: index - colors.count])
                                                    .cornerRadius(15)
                                                    .overlay(
                                                        RoundedRectangle(
                                                            cornerRadius: 15.0)
                                                        .strokeBorder(.gray,
                                                                      style: StrokeStyle(lineWidth: 1.0))
                                                    )
                                                    .padding(.horizontal, 6)
                                            }
                                        }
                                    }
                                    .padding(.horizontal)
                                }
                                .padding()
                                .frame(maxWidth: getRect().width - 30)
                                .background(Color(hex: 0xFFFAFA))
                                .cornerRadius(15)
                                .offset(y: -20)
                                .shadow(color: .gray, radius: 3, x: 0, y: 0)
                            }
                            
                            VStack(alignment: .leading){
                                VStack(alignment: .leading){
                                    StrokeText(text: "Preferences", width: 1.0, color: Color(hex: 0xF47781, alpha: 0.8))
                                        .foregroundColor(colorScheme == .light ?  Color(hex: 0xFFFFFF) : Color(hex: 0x000000))
                                        .font(.custom(OpenSans_Bold, size: 35))
                                        .padding(.top)
                                        .multilineTextAlignment(.leading)
                                        .padding(.leading)
                                }
                                VStack{
                                    VStack(alignment: .leading){
                                        Text("Going out")
                                            .font(.custom(OpenSans_Bold, size: 16))
                                            .foregroundColor(Color(hex: 0x868686))
                                        
                                        LazyVGrid(columns: threeColumnGrid) {
                                            ForEach(Array(arrGoindOut.enumerated()), id: \.offset) { index, element in
                                                Text(element.goingOutName ?? "")
                                                    .font(.custom(OpenSans_SemiBold, size: 10))
                                                    .foregroundColor(Color(hex: 0x333333))
                                                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50)
                                                    .background(colors[safe: index] ?? colors[safe: index - colors.count])
                                                    .cornerRadius(15)
                                                    .overlay(
                                                        RoundedRectangle(
                                                            cornerRadius: 15.0)
                                                        .strokeBorder(.gray,
                                                                      style: StrokeStyle(lineWidth: 1.0))
                                                    )
                                                    .padding(.horizontal, 6)
                                            }
                                        }
                                    }
                                    .padding(.horizontal)
                                    
//                                    VStack(alignment: .leading){
//                                        Text("Staying in")
//                                            .font(.custom(OpenSans_Bold, size: 16))
//                                            .foregroundColor(Color(hex: 0x868686))
//
//                                        LazyVGrid(columns: threeColumnGrid) {
//                                            ForEach(Array(arrProfile.enumerated()), id: \.offset) { index, element in
//                                                Text(element.name)
//
//                                                    .font(.custom(OpenSans_SemiBold, size: 10))
//                                                    .foregroundColor(Color(hex: 0x333333))
//                                                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50)
//                                                    .background(colors[safe: index] ?? colors[safe: index - colors.count])
//                                                    .cornerRadius(15)
//                                                    .overlay(
//                                                        RoundedRectangle(
//                                                            cornerRadius: 15.0)
//                                                        .strokeBorder(.gray,
//                                                                      style: StrokeStyle(lineWidth: 1.0))
//                                                    )
//                                                    .padding(.horizontal, 6)
//                                            }
//                                        }
//                                    }
//                                    .padding(.horizontal)
                                }
                                .padding()
                                .frame(maxWidth: getRect().width - 30)
                                .background(Color(hex: 0xFFFAFA))
                                .cornerRadius(15)
                                .offset(y: -20)
                                .shadow(color: .gray, radius: 3, x: 0, y: 0)
                            }
                            
                            VStack(alignment: .leading){
                                VStack(alignment: .leading){
                                    StrokeText(text: "Habits", width: 1.0, color: Color(hex: 0xF47781, alpha: 0.8))
                                        .foregroundColor(colorScheme == .light ?  Color(hex: 0xFFFFFF) : Color(hex: 0x000000))
                                        .font(.custom(OpenSans_Bold, size: 35))
                                        .padding(.top)
                                        .multilineTextAlignment(.leading)
                                        .padding(.leading)
                                }
                                VStack{
                                    VStack(alignment: .leading){
                                        Text("Food & Drink")
                                            .font(.custom(OpenSans_Bold, size: 16))
                                            .foregroundColor(Color(hex: 0x868686))
                                        
                                        LazyVGrid(columns: threeColumnGrid) {
                                            ForEach(Array(arrFood.enumerated()), id: \.offset) { index, element in
                                                Text(element.foodDrinkName ?? "")
                                                    .font(.custom(OpenSans_SemiBold, size: 10))
                                                    .foregroundColor(Color(hex: 0x333333))
                                                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50)
                                                    .background(colors[safe: index] ?? colors[safe: index - colors.count])
                                                    .cornerRadius(15)
                                                    .overlay(
                                                        RoundedRectangle(
                                                            cornerRadius: 15.0)
                                                        .strokeBorder(.gray,
                                                                      style: StrokeStyle(lineWidth: 1.0))
                                                    )
                                                    .padding(.horizontal, 6)
                                            }
                                        }
                                    }
                                    .padding(.horizontal)
                                    
                                    VStack(alignment: .leading){
                                        Text("Values & Traits")
                                            .font(.custom(OpenSans_Bold, size: 16))
                                            .foregroundColor(Color(hex: 0x868686))
                                        
                                        LazyVGrid(columns: threeColumnGrid) {
                                            ForEach(Array(arrValue.enumerated()), id: \.offset) { index, element in
                                                Text(element.valuesName ?? "")
                                                    .font(.custom(OpenSans_SemiBold, size: 10))
                                                    .foregroundColor(Color(hex: 0x333333))
                                                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50)
                                                    .background(colors[safe: index] ?? colors[safe: index - colors.count])
                                                    .cornerRadius(15)
                                                    .overlay(
                                                        RoundedRectangle(
                                                            cornerRadius: 15.0)
                                                        .strokeBorder(.gray,
                                                                      style: StrokeStyle(lineWidth: 1.0))
                                                    )
                                                    .padding(.horizontal, 6)
                                            }
                                        }
                                    }
                                    .padding(.horizontal)
                                }
                                .padding()
                                .frame(maxWidth: getRect().width - 30)
                                .background(Color(hex: 0xFFFAFA))
                                .cornerRadius(15)
                                .offset(y: -20)
                                .shadow(color: .gray, radius: 3, x: 0, y: 0)
                            }
                            .padding(.bottom, 60)
                        }
                        .frame(maxWidth: getRect().width)
                        .background(colorScheme == .light ? .white : .black)
                        .cornerRadius(15, corners: [.topLeft, .topRight])
                        .offset(y: -80)
                        .padding(.bottom, -50)
                        
                        NavigationLink(
                            "",
                            destination: FirstView(EventScreen: "2", newSelectedIndex: .constant(0)).navigationBarHidden(true),
                            isActive: $isHome).isDetailLink(false)
                    }
                }
                VStack{
                    HStack{
                        ForEach(arrRoomies) { roomie in
                            HStack{
                                Spacer()
                                Button {
                                    viewModel.setReminder(appId: studentAppID ?? "", roomieAppId: roomie.studentAppID ?? "") { roomie in
                                        if roomie.status == 1{
                                            studentName = roomie.data?.appDetails?.studntName ?? ""
                                            studentImage = roomie.data?.appDetails?.profileImg ?? ""
                                            studentState = roomie.data?.appDetails?.stateName ?? ""
                                            studentCity = roomie.data?.appDetails?.cityName ?? ""
                                            studentBloodGroup = roomie.data?.appDetails?.livSBlood ?? ""
                                            
                                            arrRoomies = roomie.data?.roomies ?? []
                                            arrCreativity = roomie.data?.creativity ?? []
                                            arrSports = roomie.data?.sports ?? []
                                            arrEntertainment = roomie.data?.entertainment ?? []
                                            arrGoindOut = roomie.data?.goingOut ?? []
                                            arrFood = roomie.data?.foodAndDrink ?? []
                                            arrValue = roomie.data?.valuesAndTraits ?? []
                                        }else{
                                            alertMessage = "Something Went Wrong"
                                            AlertShow = "0"
                                            showingAlert = true
                                        }
                                    }
                                } label: {
                                    VStack(spacing: 2){
//                                        Newbckimg
//                                            .overlay {
//                                                KFImage(URL(string: roomie.studentImg ?? ""))
//                                                    .resizable()
//                                                    .scaledToFit()
//                                                    .frame(width: 54, height: 75)
//                                                    .mask { Newbckimg }
//                                            }
                                        
                                        KFImage(URL(string: roomie.studentImg ?? ""))
                                            .placeholder{
                                                    ProgressView()
                                                        .progressViewStyle(CircularProgressViewStyle(tint: Color("Student_Profile1")))
                                                }
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 54, height: 54)
                                            .clipShape(Circle())
                                            .clipped()
                                            .padding(2)
                                            .background(colorScheme == .light ? .white : Color(hex: 0x2E2E2E))
                                            .clipShape(Circle())
                                            .shadow(color: .gray, radius: 3, x: 0, y: 0)
                                            .overlay {
                                                Circle()
                                                    .stroke(style: StrokeStyle(lineWidth: 1, dash: [1]))
                                                    .foregroundColor(Color(hex: 0xDE1223))
                                            }
                                        
                                        Text(roomie.studntName ?? "")
                                            .font(.custom(OpenSans_SemiBold, size: 10))
                                            .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                                    }
                                    .padding(.vertical, 5)
                                }
                                Spacer()
                                if roomie != arrRoomies.last{
                                    Rectangle()
                                        .fill(Color(hex: 0xFAB6BC))
                                        .frame(width: 0.5, height: 37)
                                }
                            }
                        }
                    }
                }
                .frame(maxWidth: getRect().width - 10)
                .background(colorScheme == .light ? Color(hex: 0xFFFFFF) : Color(hex: 0x2E2E2E))
                .cornerRadius(12, corners: [.topLeft, .topRight])
            }
            .onAppear{
                print(RoomieId)
                
                if networkMonitor.isConnected{
                    viewModel.setReminder(appId: studentAppID ?? "", roomieAppId: RoomieId) { roomie in
                        if roomie.status == 1{
                            studentName = roomie.data?.appDetails?.studntName ?? ""
                            studentImage = roomie.data?.appDetails?.profileImg ?? ""
                            studentState = roomie.data?.appDetails?.stateName ?? ""
                            studentCity = roomie.data?.appDetails?.cityName ?? ""
                            studentBloodGroup = roomie.data?.appDetails?.livSBlood ?? ""
                            
                            arrRoomies = roomie.data?.roomies ?? []
                            arrCreativity = roomie.data?.creativity ?? []
                            arrSports = roomie.data?.sports ?? []
                            arrEntertainment = roomie.data?.entertainment ?? []
                            arrGoindOut = roomie.data?.goingOut ?? []
                            arrFood = roomie.data?.foodAndDrink ?? []
                            arrValue = roomie.data?.valuesAndTraits ?? []
                        }else{
                            alertMessage = "Something Went Wrong"
                            AlertShow = "0"
                            showingAlert = true
                        }
                    }
                }else{
                    alertMessage = "Please Check Your Internet Connection"
                    AlertShow = "0"
                    showingAlert = true
                }
            }
            .ignoresSafeArea()
            .navigationBarHidden(true)
            .alert(alertMessage, isPresented: $showingAlert) {
                Button("OK", role: .cancel) {
                    if AlertShow == "1"{
                        
                    }else{
                        
                    }
                }
            }
        }
    }
    var bckimg: some View {
        Image("Roomie_Background")
            .resizable()
            .scaledToFit()
            .frame(width: 201, height: 107)
    }
    var Newbckimg: some View {
        Image("Roomie_Background")
            .resizable()
            .scaledToFit()
            .frame(width: 64, height: 70)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(RoomieId: "")
    }
}
