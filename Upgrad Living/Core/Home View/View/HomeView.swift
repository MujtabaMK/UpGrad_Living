//
//  HomeView.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 25/04/23.
//

import SwiftUI
import SwiftUIPager
import Kingfisher

struct HomeView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @EnvironmentObject var networkMonitor: NetworkMonitor
    @StateObject private var viewModelMeal = MealListViewModel()
    @State private var studentAppID = UserDefaults.standard.string(forKey: "studentAppID")
    
    //Current Index...
    @State var currentIndex: Int = 0
    @State var currentIndexNotice: Int = 0
    @State private var isButtonClick = false
    @State var pageIndex: Page
    @State var selectedItem = ""
    @Binding var isEvent: Bool
    @Binding var isBackEvent: Bool
    
    @Binding var isProfile: Bool
    @Binding var isEventDetails: Bool
    @Binding var RoomieId: String
    @Binding var isofferView: Bool
    
    @State private var isEventAll = false
    @State private var alertMessage = String()
    @State private var showingAlert = false
    @State private var AlertShow = String()
    @State private var FoodTime = ""
    
    @State private var arrMealList = [Meal]()
    @State private var arrNotes = [Note]()
    @State private var arrEvents = [Event]()
    @State private var arrOffer = [Offer]()
    @State private var arrRoomies = [Roomy]()
    
    @State private var profileImg = ""
    @State private var studentName = ""
    
    @State var callHomeAPIAgain = false
    @State var changeValue = false
    
    var body: some View {
        NavigationView {
            GeometryReader { proxy in
                ScrollView(showsIndicators: false){
                    VStack{
                        VStack{
                            HomeViewTop(ProfileImage: profileImg, StudentName: studentName)
                                .frame(height: 172)
                            ZStack{
                                Color(colorScheme == .light ? .white : .black)
                                VStack{
                                    ScrollView([.horizontal, .vertical], showsIndicators: false){
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
                                        .padding([.top, .bottom])
                                        .padding([.leading, .trailing], 4)
                                    }
                                    
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
                                    .padding(.bottom)
                                    
                                    SnapCarouselEvents(spacing: getRect().height < 750 ? 0 : 0,trailingSpace: getRect().height < 750 ? 25 : 25,index: $currentIndexNotice, items: arrNotes) { post in
                                        NoticeView(notice: post, IndexValue: currentIndexNotice)
                                    }
                                    .offset(y: 40)
                                    .frame(height: arrNotes.count > 0 ? 100 : 0)
                                    .padding(.bottom, getRect().height < 750 ? 40 : 60)
                                    
                                    HStack{
                                        ForEach(arrNotes.indices, id: \.self) { notice in
                                            if notice == currentIndexNotice{
                                                Image("Notice_Indicator_Select")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 8, height: 8)
                                            }else{
                                                Image("Notice_Indicator_NotSelect")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 5, height: 5)
                                            }
                                        }
                                    }
                                    
                                    UpcomingEvents(isEvents: $isEvent, isEventsAll: $isEventAll, arrEvents: arrEvents,isShowAlert: $showingAlert, alertMessage: $alertMessage, callHomeAPIAgain: $callHomeAPIAgain)
                                        .padding(.top)
                                    
                                    HomeRoomiesView(isProfile: $isProfile, RoomieId: $RoomieId, arrRoomie: arrRoomies)
                                    
                                    HomeOfferView(arrDeals: arrOffer, isofferView: $isofferView)
                                        .padding(.bottom, 20)
                                    
                                    NearByView()
                                                                        
                                }
                                VStack{
                                    NavigationLink(
                                        "",
                                        destination: EventAllView(isEventDetails: $isEventDetails, isBackEvent: $isBackEvent).navigationBarHidden(true),
                                        isActive: $isEventAll).isDetailLink(false)
                                }
                            }
                            .cornerRadius(15, corners: [.topLeft, .topRight])
                            .offset(y: -10)
                        }
                    }
                }
                .onAppear{
                    if networkMonitor.isConnected{
                        viewModelMeal.getMealList(hostel_student_id: studentAppID ?? "") { Meal in
                            if Meal.status == 1{
                                arrMealList = Meal.data?.meal ?? []
                                arrNotes = Meal.data?.note ?? []
                                arrEvents = Meal.data?.event ?? []
                                arrOffer = Meal.data?.offer ?? []
                                arrRoomies = Meal.data?.roomies ?? []
                                profileImg = Meal.data?.profile?.studentImg ?? ""
                                studentName = Meal.data?.profile?.studentName ?? ""
                                print(profileImg)
                                do{
                                    // Create JSON Encoder
                                    let encoder = JSONEncoder()
                                    
                                    // Encode Note
                                    let data = try encoder.encode(arrNotes)
                                    
                                    // Write/Set Data
                                    UserDefaults.standard.set(data, forKey: "notesfromMeal")
                                }catch{
                                    print("Unable to Encode Array of Notes (\(error))")
                                }
                            }else{
                                alertMessage = Meal.msg ?? ""
                            }
                        }
                    }else{
                        alertMessage = "Please Check Your Internet Connection"
                        AlertShow = "0"
                        showingAlert = true
                    }
                }
                .onChange(of: callHomeAPIAgain) { newValue in
                    if networkMonitor.isConnected{
                        viewModelMeal.getMealList(hostel_student_id: studentAppID ?? "") { Meal in
                            if Meal.status == 1{
                                arrMealList = Meal.data?.meal ?? []
                                arrNotes = Meal.data?.note ?? []
                                arrEvents = Meal.data?.event ?? []
                                arrOffer = Meal.data?.offer ?? []
                                arrRoomies = Meal.data?.roomies ?? []
                                profileImg = Meal.data?.profile?.studentImg ?? ""
                                studentName = Meal.data?.profile?.studentName ?? ""
                                print(profileImg)
                                
                                do{
                                    // Create JSON Encoder
                                    let encoder = JSONEncoder()
                                    
                                    // Encode Note
                                    let data = try encoder.encode(arrNotes)
                                    
                                    // Write/Set Data
                                    UserDefaults.standard.set(data, forKey: "notesfromMeal")
                                }catch{
                                    print("Unable to Encode Array of Notes (\(error))")
                                }
                                
                            }else{
                                alertMessage = Meal.msg ?? ""
                            }
                        }
                    }else{
                        alertMessage = "Please Check Your Internet Connection"
                        AlertShow = "0"
                        showingAlert = true
                    }
                }
                .alert(alertMessage, isPresented: $showingAlert) {
                    Button("OK", role: .cancel) {
                        if AlertShow == "1"{
                            
                        }else{
                            
                        }
                    }
                }
                .ignoresSafeArea()
                .navigationBarHidden(true)
            }
        }
        
    }
    func setSelectItem(item: String) {
        selectedItem = item
    }
    
    //New Code
    
    //        NavigationView {
    //           // ScrollView{
    //                VStack{
    //                    Pager(page: self.pageIndex,
    //                          data: posts,
    //                          content: { item in
    //                               // create a page based on item
    //                        self.pageView(item: item)
    //                    })
    //                    .itemAspectRatio(0.7)
    //                    .itemSpacing(0)
    //                    .padding(8)
    //                    .interactive(scale: 0.8)
    //
    //                    UpcomingEvents()
    //                }
    //            //}
    //       // }
    //
    //    }
    
    //   // @ViewBuilder
    //    func pageView(item: Post) -> some View{
    //        VStack(spacing: 10){
    //            Image(item.postImage)
    //                .resizable()
    //                .scaledToFit()
    ////                .cornerRadius(12)
    //
    //            Text(item.title)
    //                .font(.title2.bold())
    //
    //            HStack(spacing: 3) {
    //                ForEach(1...5, id: \.self){ index in
    //                    Image(systemName: "star.fill")
    //                        .foregroundColor(index <= item.starRaiting ? .yellow : .gray)
    //                }
    //                Text("(\(item.starRaiting).0)")
    //                    .multilineTextAlignment(.center)
    //            }
    //            .font(.caption)
    //            Text(item.description)
    //                .font(getRect().height < 750 ? .caption : .callout)
    //                .multilineTextAlignment(.center)
    //                .padding(.top, 8)
    //                .padding(.horizontal)
    //        }
    //        .frame(maxWidth: getRect().width, maxHeight: 400)
    //        .background(Color.yellow)
    //    }
    
    //@ViewBuilder
    func CardView(post: Meal) -> some View{
        ZStack{
            ScrollView{
                VStack(alignment: .leading, spacing: 10) {
                    //Image
                    
                    //                GeometryReader { proxy in
                    //                    Image(post.postImage)
                    //                        .resizable()
                    //                        .aspectRatio(contentMode: .fit)
                    //                        .frame(width: proxy.size.width, height: proxy.size.height)
                    //                }
                    //            .padding(15)
                    //            .background(Color.white)
                    //.cornerRadius(25)
                    //.frame(height: 300)
                    
                    KFImage(URL(string: post.foodImage ?? ""))
                        .resizable()
                        .scaledToFit()
                    //.frame(maxWidth: .infinity, maxHeight: .infinity)
                    //.offset(y: -20)
                    
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
    
    func NoticeView(notice: Note, IndexValue: Int) -> some View{
        ZStack{
            Image("Notice_bg")
                .resizable()
                .scaledToFill()
            Text(notice.note ?? "")
                .font(.custom(OpenSans_Bold, size: 20))
                .foregroundColor(colorScheme == .light ? .black : .black)
                .padding(.horizontal, 50)
        }
        .onTapGesture {
            print(IndexValue)
        }
        //.cornerRadius(15, corners: [.topLeft, .topRight, .bottomLeft, .bottomRight])
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(pageIndex: Page.withIndex(0), isEvent: .constant(false), isBackEvent: .constant(false), isProfile: .constant(false), isEventDetails: .constant(false), RoomieId: .constant(""), isofferView: .constant(false))
    }
}

//Screen Bounds

extension View{
    func getRect() -> CGRect{
        return UIScreen.main.bounds
    }
}
