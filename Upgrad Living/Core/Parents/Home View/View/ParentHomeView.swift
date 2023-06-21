//
//  ParentHomeView.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 19/06/23.
//

import SwiftUI
import Kingfisher

struct ParentHomeView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @EnvironmentObject var networkMonitor: NetworkMonitor
    @StateObject private var viewModelMeal = ParentHomeViewModel()
    @State private var studentAppID = UserDefaults.standard.string(forKey: "studentAppID")
    
    @State private var arrMealList = [ParentMeal]()
    
    @State private var alertMessage = String()
    @State private var showingAlert = false
    @State private var AlertShow = String()
    
    @State private var alert2Message = ""
    @State private var show2Alert = false
    @State private var buttonTitle = ""
    
    //Current Index...
    @State var currentIndex: Int = 0
    
    @State var changeValue = false
    
    @Binding var isParentHelpdesk: Bool
    @Binding var isBackParentHelpdesk: Bool
    @Binding var isLogout: Bool
    
    @State private var pendingCount = ""
    @State private var approvedCount = ""
    @State private var rejectCount = ""
    @State private var studentDate = ""
    @State private var exitTime = ""
    @State private var enteryTime = ""
    
    @State private var arrHelpDesk = [PatentEmergenyContact]()
    
    var body: some View {
        NavigationView {
            ZStack{
                ScrollView(showsIndicators: false) {
                    ZStack(alignment: .top){
                        Image("Home_Top_Background")
                            .resizable()
                            .scaledToFit()
                            .frame(width: getRect().width, height: 290)
                            .padding(.top, -90)
                        
                        HStack{
                            Image("Upgrad_Logo_White")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 169, height: 30)
                            
                            Spacer()
                            
                            Button {
                                
                            } label: {
                                Image("Home_Notification")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 25,height: 25)
                            }

                            Button {
                                alert2Message = "Are you sure you want to Logout?"
                                buttonTitle = "Logout"
                                show2Alert = true
                            } label: {
                                Image("Parent_Home_Logout")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 25,height: 25)
                            }

                        }
                        .padding(.horizontal)
                        .padding(.top, UIDevice.current.hasNotch ? 50 : 20)
                    }
                    VStack{
                        VStack {
                            HStack{
                                Text("Approval requests")
                                    .font(.custom(OpenSans_Bold, size: 20))
                                    .foregroundColor(colorScheme == .light ? Color(hex: 0x1A1A1A, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                                
                                Spacer()
                            }
                            .padding(.leading)
                            .padding(.top)
                            .padding(.bottom, 20)
                            
                            HStack(spacing: 20){
                                ZStack(alignment: .top){
                                    VStack(spacing: 8){
                                        Text("Pending")
                                            .font(.custom(OpenSans_SemiBold, size: 14))
                                            .foregroundColor(Color(hex: 0x00D595))
                                        
                                        Text(pendingCount)
                                            .font(.custom(OpenSans_Bold, size: 16))
                                            .foregroundColor(colorScheme == .light ? Color(hex: 0x868686) : Color(hex: 0x868686))
                                    }
                                    .padding()
                                    .background(colorScheme == .light ? Color(hex: 0xFFFFFF) : Color(hex: 0x2E2E2E))
                                    .cornerRadius(5)
                                    .shadow(color: .gray, radius: 2, x: 0, y: 0)
                                    
                                    Image("Seek_Pending_icon")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 25, height: 25)
                                        .offset(y: -15)
                                }
                                
                                ZStack(alignment: .top){
                                    VStack(spacing: 8){
                                        Text("Approved")
                                            .font(.custom(OpenSans_SemiBold, size: 14))
                                            .foregroundColor(Color(hex: 0xED7E2B))
                                        
                                        Text(approvedCount)
                                            .font(.custom(OpenSans_Bold, size: 16))
                                            .foregroundColor(colorScheme == .light ? Color(hex: 0x868686) : Color(hex: 0x868686))
                                    }
                                    .padding()
                                    .background(colorScheme == .light ? Color(hex: 0xFFFFFF) : Color(hex: 0x2E2E2E))
                                    .cornerRadius(5)
                                    .shadow(color: .gray, radius: 2, x: 0, y: 0)
                                    
                                    Image("Seek_Approved_icon")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 25, height: 25)
                                        .offset(y: -15)
                                }
                                
                                ZStack(alignment: .top){
                                    VStack(spacing: 8){
                                        Text("Rejected")
                                            .font(.custom(OpenSans_SemiBold, size: 14))
                                            .foregroundColor(Color(hex: 0xF8A6AC))
                                        
                                        Text(rejectCount)
                                            .font(.custom(OpenSans_Bold, size: 16))
                                            .foregroundColor(colorScheme == .light ? Color(hex: 0x868686) : Color(hex: 0x868686))
                                    }
                                    .padding()
                                    .background(colorScheme == .light ? Color(hex: 0xFFFFFF) : Color(hex: 0x2E2E2E))
                                    .cornerRadius(5)
                                    .shadow(color: .gray, radius: 2, x: 0, y: 0)
                                    
                                    Image("Seek_Reject_icon")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 25, height: 25)
                                        .offset(y: -15)
                                }
                            }
                            .padding(.bottom)
                            
                            VStack{
                                if arrMealList.count > 0{
                                    HStack{
                                        Text("Hostel Menu of the day")
                                            .font(.custom(OpenSans_Bold, size: 20))
                                            .foregroundColor(colorScheme == .light ? Color(hex: 0x1A1A1A, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                                        
                                        Spacer()
                                    }
                                    .padding(.leading)
                                    
                                    VStack{
                                        ScrollView(.horizontal, showsIndicators: false){
                                            HStack{
                                                ForEach(Array(arrMealList.enumerated()), id: \.offset) { index, food in
                                                    Button {
                                                        changeValue = true
                                                        currentIndex = index
                                                    } label: {
                                                        Rectangle()
                                                            .fill(currentIndex == index ? Color(hex: 0xD9404C) : Color(hex: 0xFFFFFF))
                                                            .frame(width: 80, height: 38)
                                                            .cornerRadius(15)
                                                            .shadow(color: .gray, radius: 3, x: 0, y: 0)
                                                            .overlay {
                                                                Text(food.mealName ?? "")
                                                                    .font(.custom(OpenSans_SemiBold, size: 12))
                                                                    .foregroundColor(currentIndex == index ? .white : .black)
                                                            }
                                                    }
                                                }
                                            }
                                            .frame(width: getRect().width - 20, alignment: .center)
                                            .padding([.top, .bottom])
                                            .padding([.leading, .trailing], 4)
                                        }
                                        .frame(width: getRect().width - 20, alignment: .center)
                                        
                                        ForEach(Array(arrMealList.enumerated()), id: \.offset) { index, food in
                                            if currentIndex == index{
                                                Text(food.foodTime ?? "")
                                                    .font(.custom(OpenSans_Bold, size: 16))
                                                    .foregroundColor(colorScheme == .light ? Color(hex: 0x868686) : Color(hex: 0xFFFFFF, alpha: 0.8))
                                                    .padding([.top, .bottom], 0)
                                            }
                                        }
                                        
                                        Image("Home_Time_Line")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 206, height: 8)
                                            .padding(.top, -12)
                                        
                                        //Posts
                                        SnapCarousel(changeValue: $changeValue, spacing: getRect().height < 750 ? 0 : 0,trailingSpace: getRect().height < 750 ? 100 : 150,index: $currentIndex, items: arrMealList) { post in
                                            CardView(post: post)
                                        }
                                        .offset(y: 40)
                                        .frame(height: 300)
                                        .padding(.bottom, 50)
                                    }
                                }
                                VStack{
                                    HStack{
                                        Text("Emergency Contact")
                                            .font(.custom(OpenSans_Bold, size: 20))
                                            .foregroundColor(colorScheme == .light ? Color(hex: 0x1A1A1A, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                                        
                                        Spacer()
                                        
                                        Button {
                                            isParentHelpdesk = true
                                        } label: {
                                            Text("View all")
                                                .font(.custom(OpenSans_SemiBold, size: 12))
                                                .foregroundColor(colorScheme == .light ? Color(hex: 0x969696) : Color(hex: 0x969696))
                                        }
                                    }
                                    .padding(.horizontal)
                                    .padding(.bottom)
                                    
                                    VStack(spacing: 20){
                                        if arrHelpDesk.count > 0{
                                            VStack(alignment: .leading, spacing: 5){
                                                HStack{
                                                    Text(arrHelpDesk[0].helpDesk ?? "".uppercased())
                                                        .font(.custom(OpenSans_Bold, size: 18))
                                                        .foregroundColor(Color(hex: 0x333333))
                                                    Spacer()
                                                }
                                                .padding(.leading)
                                                HStack{
                                                    Text(arrHelpDesk[0].contactNo ?? "")
                                                        .font(.custom(OpenSans_SemiBold, size: 14))
                                                        .foregroundColor(Color(hex: 0x565656))
                                                    
                                                    Spacer()
                                                    
                                                    Image("Service_Phone_Call")
                                                        .resizable()
                                                        .scaledToFit()
                                                        .frame(width: 24, height: 24)
                                                        .foregroundColor(Color(hex: 0xFB6876))
                                                        .onTapGesture {
                                                            let phone = "tel://"
                                                            let phoneNumberformatted = "\(phone)\(Text(arrHelpDesk[0].contactNo ?? ""))"
                                                            guard let url = URL(string: phoneNumberformatted) else { return }
                                                            UIApplication.shared.open(url)
                                                        }
                                                }
                                                .padding(.horizontal)
                                            }
                                            .frame(width: getRect().width - 20, height: 100)
                                            .background(Color(hex: 0xFAC2C7))
                                            
                                            if arrHelpDesk.count > 1{
                                                VStack(alignment: .leading, spacing: 5){
                                                    HStack{
                                                        Text(arrHelpDesk[1].helpDesk ?? "".uppercased())
                                                            .font(.custom(OpenSans_Bold, size: 18))
                                                            .foregroundColor(Color(hex: 0x333333))
                                                        Spacer()
                                                    }
                                                    .padding(.leading)
                                                    HStack{
                                                        Text(arrHelpDesk[1].contactNo ?? "")
                                                            .font(.custom(OpenSans_SemiBold, size: 14))
                                                            .foregroundColor(Color(hex: 0x565656))
                                                        
                                                        Spacer()
                                                        
                                                        Image("Service_Phone_Call")
                                                            .resizable()
                                                            .scaledToFit()
                                                            .frame(width: 24, height: 24)
                                                            .foregroundColor(Color(hex: 0x13A2A7))
                                                            .onTapGesture {
                                                                let phone = "tel://"
                                                                let phoneNumberformatted = "\(phone)\(Text(arrHelpDesk[1].contactNo ?? ""))"
                                                                guard let url = URL(string: phoneNumberformatted) else { return }
                                                                UIApplication.shared.open(url)
                                                            }
                                                    }
                                                    .padding(.horizontal)
                                                }
                                                .frame(width: getRect().width - 20, height: 100)
                                                .background(Color(hex: 0xB1D9ED))
                                            }
                                        }
                                    }
                                }
                                .padding(.bottom, 20)
                                
                                if !exitTime.isEmpty{
                                    VStack{
                                        HStack{
                                            Text("Student Check-in/ Check-out time")
                                                .font(.custom(OpenSans_Bold, size: 20))
                                                .foregroundColor(colorScheme == .light ? Color(hex: 0x1A1A1A, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                                            
                                            Spacer()
                                        }
                                        .padding(.leading)
                                        
                                        VStack{
                                            Image("User_CheckIN_CheckOut_icon")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 206, height: 105)
                                                .padding(.bottom, 20)
                                            
                                            Text(studentDate)
                                                .font(.custom(OpenSans_Bold, size: 18))
                                                .foregroundColor(colorScheme == .light ? Color(hex: 0x00000, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                                            
                                            HStack{
                                                Spacer()
                                                
                                                Text("Exit time")
                                                    .font(.custom(OpenSans_SemiBold, size: 14))
                                                    .foregroundColor(colorScheme == .light ? Color(hex: 0x616161) : Color(hex: 0x616161))
                                                
                                                Spacer()
                                                
                                                Rectangle()
                                                    .strokeBorder(style: StrokeStyle(lineWidth: 0.2, dash: [2]))
                                                    .foregroundColor(.clear)
                                                    .frame(width: 1)
                                                
                                                
                                                Spacer()
                                                
                                                Text("Entry time")
                                                    .font(.custom(OpenSans_SemiBold, size: 14))
                                                    .foregroundColor(colorScheme == .light ? Color(hex: 0x616161) : Color(hex: 0x616161))
                                                
                                                Spacer()
                                                
                                            }
                                            .frame(height: 31)
                                            .background(Color(hex: 0xFDDFE3))
                                            
                                            HStack{
                                                Spacer()
                                                Text(exitTime)
                                                    .font(.custom(OpenSans_Bold, size: 16))
                                                    .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                                                Spacer()
                                                
                                                Rectangle()
                                                    .strokeBorder(style: StrokeStyle(lineWidth: 0.2, dash: [2]))
                                                    .foregroundColor(Color(hex: 0x969696))
                                                    .frame(width: 1)
                                                
                                                Spacer()
                                                Text(enteryTime)
                                                    .font(.custom(OpenSans_Bold, size: 16))
                                                    .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                                                
                                                Spacer()
                                            }
                                            .frame(height: 48)
                                            .padding(.top, -6)
                                            
                                            Rectangle()
                                                .strokeBorder(style: StrokeStyle(lineWidth: 0.2, dash: [2]))
                                                .foregroundColor(Color(hex: 0x969696))
                                                .frame(width: getRect().width - 40, height: 0.5)
                                                .padding(.top, -8)
                                            
                                            VStack{
                                                Text("Please note:")
                                                    .font(.custom(OpenSans_SemiBold, size: 14))
                                                    .foregroundColor(colorScheme == .light ? Color(hex: 0x969696) : Color(hex: 0x969696))
                                                
                                                +
                                                
                                                Text(" Above timings shown are 1st exit from the hostel and ")
                                                    .font(.custom(OpenSans_SemiBold, size: 14))
                                                    .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                                                
                                                +
                                                
                                                Text(" last entry into the hostel")
                                                    .font(.custom(OpenSans_SemiBold, size: 14))
                                                    .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                                                
                                            }
                                            .padding(.horizontal)
                                        }
                                        .padding(.vertical, 20)
                                        .background(colorScheme == .light ? Color(hex: 0xFFFFFF) : Color(hex: 0x2E2E2E))
                                        .cornerRadius(20)
                                        .frame(width: getRect().width - 40)
                                        .shadow(color: .gray, radius: 4, x: 0, y: 0)
                                    }
                                }
                                Text("")
                            }
                        }
                    }
                    .frame(maxWidth: getRect().width)
                    .background(colorScheme == .light ? .white : .black)
                    .cornerRadius(15, corners: [.topLeft, .topRight])
                    .offset(y: -80)
                }
            }
            .ignoresSafeArea()
            .navigationBarHidden(true)
            .onAppear{
                if networkMonitor.isConnected{
                    viewModelMeal.getProfileInfo(appId: studentAppID ?? "") { Home in
                        if Home.status == 1{
                            pendingCount = Home.data?.requestsCount?.pendings ?? ""
                            approvedCount = Home.data?.requestsCount?.approved ?? ""
                            rejectCount = Home.data?.requestsCount?.rejected ?? ""
                            studentDate = Home.data?.studentTime?.date ?? ""
                            exitTime = Home.data?.studentTime?.exitTime ?? ""
                            enteryTime = Home.data?.studentTime?.enteryTime ?? ""
                            arrMealList = Home.data?.meal ?? []
                            arrHelpDesk = Home.data?.emergenyContacts ?? []
                            
                            do{
                                // Create JSON Encoder
                                let encoder = JSONEncoder()
                                
                                // Encode Note
                                let data = try encoder.encode(Home)
                                
                                // Write/Set Data
                                UserDefaults.standard.set(data, forKey: "ParentHome")
                            }catch{
                                print("Unable to Encode Array of Notes (\(error))")
                            }
                            
                        }else{
                            alertMessage = Home.msg ?? ""
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
            .alert(isPresented:$show2Alert) {
                Alert(
                    title: Text(alert2Message),
                    message: Text(""),
                    primaryButton: .destructive(Text(buttonTitle)) {
                        UserDefaults.standard.set(false, forKey: "isLogin")
                        isLogout = true
                    },
                    secondaryButton: .cancel()
                )
            }
        }
    }
    
    //@ViewBuilder
    func CardView(post: ParentMeal) -> some View{
        ZStack{
            ScrollView{
                VStack(alignment: .leading, spacing: 10) {
                    KFImage(URL(string: post.foodImage ?? ""))
                        .resizable()
                        .scaledToFit()
                    
                    //Move Data...
                    
                    ForEach(post.food ?? [], content: { food in
                        VStack(alignment: .leading, spacing: 0){
                            HStack(spacing: 3){
                                HLine()
                                    .stroke(style: StrokeStyle(lineWidth: 0.5, dash: [2]))
                                    .foregroundColor(colorScheme == .light ? Color(hex: 0xEE2C3C) : Color(hex: 0xEE2C3C))
                                    .frame(width: 19,height: 1)
                                Text(food.foodName ?? "")
                                    .font(.custom(OpenSans_SemiBold, size: 14))
                                    .foregroundColor(colorScheme == .light ? Color(hex: 0x333333) : Color(hex: 0xFFFFFF))
                            }
                        }
                        .padding(.leading, 5)
                    })
                }
            }
        }
        .padding(.bottom)
        .background(colorScheme == .light ? Color.white : Color(.black))
        .cornerRadius(15, corners: [.topLeft, .topRight, .bottomLeft, .bottomRight])
        .shadow(color: .gray, radius: 3, x: 0, y: 0)
    }
}
