//
//  AdminApprovalRequest.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 04/07/23.
//

import SwiftUI

struct AdminApprovalRequest: View {
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
    
    @State private var isApprovalDropdown = false
    @State private var approvalID = "1"
    @State private var approvalName = "Today"
    
    var body: some View {
        VStack{
            HStack{
                Text("Approval requests")
                    .font(.custom(OpenSans_Bold, size: 20))
                    .foregroundColor(colorScheme == .light ? Color(hex: 0x1A1A1A, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                
                Spacer()
                
                Button {
                    isApprovalDropdown.toggle()
                } label: {
                    HStack{
                        Image(isApprovalDropdown ? "Admin_Drop_Up" : "Admin_Drop_Down")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 18, height: 18)
                        
                        Text(approvalName)
                            .font(.custom(OpenSans_Regular, size: 12))
                            .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                    }
                    .padding(.horizontal)
                    .frame(width: 130, height: 34)
                    .cornerRadius(40)
                    .overlay{
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(Color(hex: 0xF1F1FA), lineWidth: 1)
                        
                    }
                }
            }
            .padding(.top)
            .padding(.bottom, 20)
            
            if isApprovalDropdown{
                HStack{
                    Spacer()
                    VStack{
                        ForEach(arrAdminDrop) { category in
                            Button {
                                approvalName = category.name
                                approvalID = category.id
                                isApprovalDropdown.toggle()
                            } label: {
                                VStack{
                                    HStack{
                                        Text(category.name)
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
                    .frame(width: 130)
                    .background(colorScheme == .light ? Color(hex: 0xF9F9F9) : Color(hex: 0x2E2E2E))
                    .cornerRadius(15)
                    .shadow(color: .gray, radius: 2, x: 0, y: 0)
                    .offset(y: -23)
                }
            }
            
            HStack(spacing: 20){
                ZStack(alignment: .top){
                    VStack(spacing: 8){
                        Text("Pending")
                            .font(.custom(OpenSans_SemiBold, size: 14))
                            .foregroundColor(Color(hex: 0x00D595))
                        
                        Text("2")
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
                        
                        Text("1")
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
                        
                        Text("2")
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
        }
        .padding(.horizontal)
    }
}
