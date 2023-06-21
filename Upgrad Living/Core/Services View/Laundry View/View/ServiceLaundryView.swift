//
//  ServiceLaundryView.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 30/05/23.
//

import SwiftUI

struct ServiceLaundryView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var networkMonitor: NetworkMonitor
    @State private var studentAppID = UserDefaults.standard.string(forKey: "studentAppID")
    @State private var viewModelLaundry = LaundryViewModel()
    
    @Binding var isBackLaundry: Bool
    
    @State private var alertMessage = String()
    @State private var showingAlert = false
    @State private var AlertShow = String()
    
    @State private var arrLaundryTimimg = [LaundryTiming]()
    @State private var arrLaundaryNotes = [LaundryNote]()
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                ZStack(alignment: .top){
                    Image("Service_Laundry_Top")
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: getRect().width, maxHeight: 300)
                    HStack{
                        Button {
                            isBackLaundry = true
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
                        Text("Laundry")
                            .font(.custom(OpenSans_Bold, size: 18))
                            .foregroundColor(colorScheme == .light ?  Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                            .padding(.top, 20)
                            .padding(.leading)
                            .multilineTextAlignment(.leading)
                        Rectangle()
                            .fill(
                                LinearGradient(colors: [Color(hex: 0x00C5CF), Color(hex: 0x00BAA4)], startPoint: .leading, endPoint: .trailing)
                            )
                            .frame(width: getRect().width, height: 4)
                            .padding(.leading)
                        
                        Text("Our laundry services provide a hassle-free solution for students who need clean clothes without the burden of doing their own laundry. Our professional laundry team ensures that students' clothes are washed, dried, and folded with care, and we use high-quality detergents to keep clothes fresh and clean.")
                            .font(.custom(OpenSans_SemiBold, size: 14))
                            .foregroundColor(colorScheme == .light ? Color(hex: 0x969696) : Color(hex: 0x969696))
                            .padding(.leading)
                        
                        VStack(alignment: .leading){
                            HStack{
                                Text("Laundry timings")
                                    .font(.custom(OpenSans_Bold, size: 18))
                                    .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                                Image("Service_Laundry_Time")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 24, height: 24)
                            }
                            .padding(.top)
                            VStack(alignment: .leading) {
                                Text("Every floor is designated certain day for laundry")
                                    .font(.custom(OpenSans_SemiBold, size: 14))
                                    .foregroundColor(colorScheme == .light ? Color(hex: 0x969696) : Color(hex: 0x969696))
                                +
                                Text(" when the students have to hand over the clothes")
                                    .font(.custom(OpenSans_SemiBold, size: 14))
                                    .foregroundColor(colorScheme == .light ? Color(hex: 0x969696) : Color(hex: 0x969696))
                                +
                                Text(" during the allotted time.")
                                    .font(.custom(OpenSans_SemiBold, size: 14))
                                    .foregroundColor(colorScheme == .light ? Color(hex: 0x969696) : Color(hex: 0x969696))
                                
                            }
                            
                            Text("*A student is allowed")
                                .font(.custom(OpenSans_SemiBold, size: 14))
                                .foregroundColor(colorScheme == .light ? Color(hex: 0x969696) : Color(hex: 0x969696))
                            +
                            Text(" 5 kgs")
                                .font(.custom(OpenSans_Bold, size: 14))
                                .foregroundColor(colorScheme == .light ? .black : .white)
                            +
                            Text(" of laundry per week.")
                                .font(.custom(OpenSans_SemiBold, size: 14))
                                .foregroundColor(colorScheme == .light ? Color(hex: 0x969696) : Color(hex: 0x969696))
                        }
                        .padding(.leading)
                        VStack(spacing: 2){
                            HStack(spacing: 2){
                                Text("DAY")
                                    .font(.custom(OpenSans_SemiBold, size: 12))
                                    .foregroundColor(Color(hex: 0x868686))
                                    .frame(width: 70, height: 33, alignment: .center)
                                    .overlay(
                                        RoundedRectangleWithStroke(cornerRadius: CGSize(width: 8, height: 4))
                                            .stroke(Color(hex: 0xBFECEF), lineWidth: 1)
                                    )
                                
                                Text("TIME")
                                    .font(.custom(OpenSans_SemiBold, size: 12))
                                    .foregroundColor(Color(hex: 0x868686))
                                    .frame(maxWidth: .infinity, minHeight: 33,  maxHeight: 33)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 4.0)
                                            .stroke(Color(hex: 0xFACACE), lineWidth: 1)
                                    )
                                
                                Text("FLOOR")
                                    .font(.custom(OpenSans_SemiBold, size: 12))
                                    .foregroundColor(Color(hex: 0x868686))
                                    .frame(maxWidth: .infinity, minHeight: 33, maxHeight: 33)
                                    .overlay(
                                        RoundedRectangleWithStrokeRight(cornerRadius: CGSize(width: 8, height: 4))
                                            .stroke(Color(hex: 0x5AB9E9), lineWidth: 1)
                                    )
                            }
                            
                            ForEach(Array(arrLaundryTimimg.enumerated()), id: \.offset) { index, timing in
                                if timing == arrLaundryTimimg.last {
                                        // do something
                                    ServiceLaundryTiming(day: timing.day ?? "", StartTime: timing.startTime ?? "", endTime: timing.endTime ?? "", Floor: timing.floor ?? "", getIndex: index, lastIndex: true)
                                }else{
                                    ServiceLaundryTiming(day: timing.day ?? "", StartTime: timing.startTime ?? "", endTime: timing.endTime ?? "", Floor: timing.floor ?? "", getIndex: index, lastIndex: false)
                                }
                            }
                        }
                        .padding(.leading)
                        if arrLaundaryNotes.count > 0{
                            VStack(alignment: .leading){
                                Text("*Please note:")
                                    .font(.custom(OpenSans_SemiBold, size: 15))
                                    .foregroundColor(Color(hex: 0xD9404C))
                                
                                VStack(alignment: .leading){
                                    ForEach(arrLaundaryNotes) { notes in
                                        Text(notes.note ?? "")
                                            .font(.custom(OpenSans_SemiBold, size: 15))
                                            .foregroundColor(Color(hex: 0xD9404C))
                                            .padding(2)
                                    }
                                }
                            }
                            .padding(5)
                            .frame(width: getRect().width - 20, alignment: .leading)
                            .padding(.leading, 5)
                            .overlay {
                                RoundedRectangle(cornerRadius: 5)
                                    .strokeBorder(style: StrokeStyle(lineWidth: 0.2, dash: [1]))
                            }
                            .padding(.leading, 20)
                        }
                    }
                    .padding(.bottom)
                    .frame(maxWidth: getRect().width)
                    .background(colorScheme == .light ? .white : .black)
                    .cornerRadius(15, corners: [.topLeft, .topRight])
                    .padding(.top, 290)
                    
                    if viewModelLaundry.isLoadingData{
                        LoadingView()
                    }
                }
            }
            .navigationBarHidden(true)
            .ignoresSafeArea()
            .onAppear{
                if networkMonitor.isConnected{
                    viewModelLaundry.getDiningDetails(appId: studentAppID ?? "") { laundry in
                        if laundry.status == 1{
                            arrLaundryTimimg = laundry.data?.laundryTimings ?? []
                            arrLaundaryNotes = laundry.data?.notes ?? []
                        }else{
                            alertMessage = laundry.msg ?? ""
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
            .alert(alertMessage, isPresented: $showingAlert) {
                Button("OK", role: .cancel) {
                    if AlertShow == "1"{
                        
                    }else{
                        
                    }
                }
            }
        }
    }
    
}
struct RoundedRectangleWithStroke: Shape {
    var cornerRadius: CGSize
    
    func path(in rect: CGRect) -> Path {
        let topLeftRadius = cornerRadius.width
        let topRightRadius = cornerRadius.height
        let bottomRightRadius = cornerRadius.height
        let bottomLeftRadius = cornerRadius.width
        
        var path = Path()
        
        path.move(to: CGPoint(x: rect.minX + topLeftRadius, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX - topRightRadius, y: rect.minY))
        path.addArc(center: CGPoint(x: rect.maxX - topRightRadius, y: rect.minY + topRightRadius), radius: topRightRadius, startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 0), clockwise: false)
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - bottomRightRadius))
        path.addArc(center: CGPoint(x: rect.maxX - bottomRightRadius, y: rect.maxY - bottomRightRadius), radius: bottomRightRadius, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90), clockwise: false)
        path.addLine(to: CGPoint(x: rect.minX + bottomLeftRadius, y: rect.maxY))
        path.addArc(center: CGPoint(x: rect.minX + bottomLeftRadius, y: rect.maxY - bottomLeftRadius), radius: bottomLeftRadius, startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 180), clockwise: false)
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY + topLeftRadius))
        path.addArc(center: CGPoint(x: rect.minX + topLeftRadius, y: rect.minY + topLeftRadius), radius: topLeftRadius, startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 270), clockwise: false)
        
        return path
    }
}

struct RoundedRectangleWithStrokeRight: Shape {
    var cornerRadius: CGSize
    
    func path(in rect: CGRect) -> Path {
        let topLeftRadius = cornerRadius.height
        let topRightRadius = cornerRadius.width
        let bottomRightRadius = cornerRadius.width
        let bottomLeftRadius = cornerRadius.height
        
        var path = Path()
        
        path.move(to: CGPoint(x: rect.minX + topLeftRadius, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX - topRightRadius, y: rect.minY))
        path.addArc(center: CGPoint(x: rect.maxX - topRightRadius, y: rect.minY + topRightRadius), radius: topRightRadius, startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 0), clockwise: false)
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - bottomRightRadius))
        path.addArc(center: CGPoint(x: rect.maxX - bottomRightRadius, y: rect.maxY - bottomRightRadius), radius: bottomRightRadius, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90), clockwise: false)
        path.addLine(to: CGPoint(x: rect.minX + bottomLeftRadius, y: rect.maxY))
        path.addArc(center: CGPoint(x: rect.minX + bottomLeftRadius, y: rect.maxY - bottomLeftRadius), radius: bottomLeftRadius, startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 180), clockwise: false)
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY + topLeftRadius))
        path.addArc(center: CGPoint(x: rect.minX + topLeftRadius, y: rect.minY + topLeftRadius), radius: topLeftRadius, startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 270), clockwise: false)
        
        return path
    }
}
