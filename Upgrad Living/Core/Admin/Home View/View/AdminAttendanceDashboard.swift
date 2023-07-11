//
//  AdminAttendanceDashboard.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 05/07/23.
//

import SwiftUI

struct AdminAttendanceDashboard: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @EnvironmentObject var networkMonitor: NetworkMonitor
    @StateObject private var viewModelMeal = ParentHomeViewModel()
    @State private var studentAppID = UserDefaults.standard.string(forKey: "studentAppID")
    
    @State private var alertMessage = String()
    @State private var showingAlert = false
    @State private var AlertShow = String()
    
    @State private var alert2Message = ""
    @State private var show2Alert = false
    @State private var buttonTitle = ""
    
    @State private var isBookingDropdown = false
    @State private var BookingID = "1"
    @State private var BookingName = "Today"
    
    @State private var isAttendanceDropdown = false
    @State private var AttendanceID = "1"
    @State private var AttendanceName = "Day Scholar"
    
    var body: some View {
        VStack{
            HStack{
                Text("Attendance Dashboard ")
                    .font(.custom(OpenSans_Bold, size: 20))
                    .foregroundColor(colorScheme == .light ? Color(hex: 0x1A1A1A, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                
                Spacer()
            }
            .padding(.top)
            .padding(.bottom, 20)
        }
        .padding(.horizontal)
    }
}
