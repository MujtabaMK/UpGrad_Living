//
//  ServiceDiningView.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 29/05/23.
//

import SwiftUI

struct ServiceDiningView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var networkMonitor: NetworkMonitor
    @StateObject private var viewModelDining = DiningViewModel()
    @State private var studentAppID = UserDefaults.standard.string(forKey: "studentAppID")
    
    @Binding var isBackDining: Bool
    
    @State private var arrMealList = [Meal]()
    @State private var arrTimimg = [ServiceTiming]()
    @State private var arrDays = [ServiceDay]()
    
    @State private var alertMessage = String()
    @State private var showingAlert = false
    @State private var AlertShow = String()
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                ZStack(alignment: .top){
                    Image("Dining_Details_Top")
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: getRect().width, maxHeight: 300)
                    HStack{
                        Button {
                            isBackDining = true
                        } label: {
                            Image("back_Button")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                                .padding(.leading, 20)
                                .padding(.top)
                        }
                        Spacer()
                    }
                    .padding(.top, UIDevice.current.hasNotch ? 50 : 20)
                    VStack(alignment: .leading){
                        Text("Dining")
                            .font(.custom(OpenSans_Bold, size: 18))
                            .foregroundColor(colorScheme == .light ?  Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                            .padding(.top, 20)
                            .padding(.leading)
                            .multilineTextAlignment(.leading)
                        Rectangle()
                            .fill(
                                LinearGradient(colors: [Color(hex: 0xF04957), Color(hex: 0xEDA02B)], startPoint: .leading, endPoint: .trailing)
                            )
                            .frame(width: getRect().width, height: 4)
                            .padding(.leading)
                        
                        Text("We offer a variety of delicious and nutritious dining menu, including hearty breakfasts, flavorful lunches, and satisfying dinners.")
                            .font(.custom(OpenSans_SemiBold, size: 14))
                            .foregroundColor(colorScheme == .light ? Color(hex: 0x969696) : Color(hex: 0x969696))
                            .padding(.leading)
                        
                        VStack(alignment: .leading){
                            HStack{
                                Text("Meal timings")
                                    .font(.custom(OpenSans_Bold, size: 18))
                                    .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                                Image("Service_Meal_Time")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 24, height: 24)
                            }
                            .padding(.top)
                            Text("Meal times are important for maintaining a healthy")
                                .font(.custom(OpenSans_SemiBold, size: 14))
                                .foregroundColor(colorScheme == .light ? Color(hex: 0x969696) : Color(hex: 0x969696))
                            Text("lifestyle.")
                                .font(.custom(OpenSans_SemiBold, size: 14))
                                .foregroundColor(colorScheme == .light ? Color(hex: 0x969696) : Color(hex: 0x969696))
                            
                            HStack(alignment: .top){
                                if arrTimimg.count > 0{
                                    ServiceMealTimeView(ImageName: "Service_Breakfast_icon", StartTime: arrTimimg[0].startTime ?? "", EndTime: arrTimimg[0].endTime ?? "")
                                    
                                    if arrTimimg.count > 1{
                                        ServiceMealTimeView(ImageName: "Service_Lunch_icon", StartTime: arrTimimg[1].startTime ?? "", EndTime: arrTimimg[1].endTime ?? "")
                                        
                                        if arrTimimg.count > 2{
                                            ServiceMealTimeView(ImageName: "Service_Snacks_icon", StartTime: arrTimimg[2].startTime ?? "", EndTime: arrTimimg[2].endTime ?? "")
                                            
                                            if arrTimimg.count > 3{
                                                ServiceMealTimeView(ImageName: "Service_Dinner_icon", StartTime: arrTimimg[3].startTime ?? "", EndTime: arrTimimg[3].endTime ?? "")
                                            }
                                        }
                                    }
                                }
                            }
                            .padding(.bottom)
                            
                            VStack(alignment: .leading) {
                                HStack{
                                    Text("Menu of the week")
                                        .font(.custom(OpenSans_Bold, size: 18))
                                        .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 0.8) : Color(hex: 0xFFFFFF, alpha: 0.8))
                                    Image(colorScheme == .light ? "Service_Menu_icon" : "Service_Menu_icon_Dark")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 33, height: 26)
                                }
                            }
                            .padding(.bottom, 5)
                            VStack(alignment: .leading) {
                                ForEach(Array(arrDays.enumerated()), id: \.offset) { index, day in
                                    if !(day.meals?.isEmpty ?? false){
                                        ServiceWeekMenuView(arrMeal: day.meals ?? [], daysToPass: day.day ?? "")
                                    }
                                }
                            }
                        }
                        .padding(.leading)
                    }
                    .padding(.bottom)
                    .frame(maxWidth: getRect().width)
                    .background(colorScheme == .light ? .white : .black)
                    .cornerRadius(15, corners: [.topLeft, .topRight])
                    .padding(.top, 290)
                    //.shadow(color: .gray, radius: 2, x: 0, y: 0)
                    if viewModelDining.isLoadingData{
                        LoadingView()
                    }
                }
            }
            .onAppear{
                if networkMonitor.isConnected{
                    viewModelDining.getDiningDetails(appId: studentAppID ?? "") { dining in
                        if dining.status == 1{
                            arrTimimg = dining.data?.timings ?? []
                            arrDays = dining.data?.days ?? []
                        }else{
                            alertMessage = dining.msg ?? ""
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
            .navigationBarHidden(true)
            .ignoresSafeArea()
        }
    }
}

struct ServiceDiningView_Previews: PreviewProvider {
    static var previews: some View {
        ServiceDiningView(isBackDining: .constant(false))
    }
}
