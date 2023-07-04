//
//  SeekApproval.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 14/06/23.
//

import SwiftUI

struct SeekApproval: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var networkMonitor: NetworkMonitor
    @State private var studentAppID = UserDefaults.standard.string(forKey: "studentAppID")
    
    var arrSeekApproval: SeekApprovalRequest
    
    var body: some View {
        VStack{
            HStack{
                Spacer()
                
                Text(arrSeekApproval.requestCategory ?? "")
                    .font(.custom(OpenSans_Bold, size: 14))
                    .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                
                Spacer()
            }
            
            if arrSeekApproval.reasonCateg == "4"{
                HStack{
                    HStack{
                        Spacer()
                        Text(arrSeekApproval.guestName ?? "")
                            .font(.custom(OpenSans_SemiBold, size: 12))
                            .foregroundColor(Color(hex: 0xF04957))
                            .padding(.leading)
                    }
                    
                    Rectangle()
                        .fill(Color(hex: 0xDFDFDF))
                        .frame(width: 0.5, height: 14)
                    
                    HStack{
                        Text(arrSeekApproval.guestNo ?? "")
                            .font(.custom(OpenSans_SemiBold, size: 12))
                            .foregroundColor(Color(hex: 0xF04957))
                            .padding(.trailing)
                        Spacer()
                    }
                }
            }
            
            if arrSeekApproval.reasonCateg == "5"{
                HStack{
                    HStack{
                        Spacer()
                        Text(arrSeekApproval.reasonCateg == "2" ? arrSeekApproval.dateDetails ?? "" : arrSeekApproval.startDate ?? "")
                            .font(.custom(OpenSans_SemiBold, size: 14))
                            .foregroundColor(colorScheme == .light ? Color(hex: 0x6B6A6A) : Color(hex: 0xB1B1B1))
                        Spacer()
                    }
                    .frame(height: 50)
                    .background(colorScheme == .light ? Color(hex: 0xF4F4F4) : Color(hex: 0x505050))
                    
                    Rectangle()
                        .fill(colorScheme == .light ? Color(hex: 0xFFFFFF) : Color(hex: 0xB1B1B1))
                        .frame(width: 1, height: 50)
                }
            }else{
                HStack{
                    HStack{
                        Spacer()
                        Text(arrSeekApproval.reasonCateg == "2" ? arrSeekApproval.dateDetails ?? "" : arrSeekApproval.startDate ?? "")
                            .font(.custom(OpenSans_SemiBold, size: 14))
                            .foregroundColor(colorScheme == .light ? Color(hex: 0x6B6A6A) : Color(hex: 0xB1B1B1))
                        Spacer()
                    }
                    .frame(height: 50)
                    .background(colorScheme == .light ? Color(hex: 0xF4F4F4) : Color(hex: 0x505050))
                    
                    Rectangle()
                        .fill(colorScheme == .light ? Color(hex: 0xFFFFFF) : Color(hex: 0xB1B1B1))
                        .frame(width: 1, height: 50)
                    
                    HStack{
                        Spacer()
                        Text(arrSeekApproval.reasonCateg == "2" ? arrSeekApproval.days ?? "" : arrSeekApproval.startTime ?? "")
                            .font(.custom(OpenSans_SemiBold, size: 14))
                            .foregroundColor(colorScheme == .light ? Color(hex: 0x6B6A6A) : Color(hex: 0xB1B1B1))
                        Spacer()
                    }
                    .frame(height: 50)
                    .background(colorScheme == .light ? Color(hex: 0xF4F4F4) : Color(hex: 0x505050))
                }
            }
            
            VStack{
                ForEach(Array(arrSeekApproval.approvers!.enumerated()), id: \.offset) { index ,Approvers in
                    if Approvers.reqStatus == "0"{
                        HStack{
                            Image("Seek_Pending_icon")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 21, height: 21)
                            
                            Text(Approvers.requestDetails ?? "")
                                .font(.custom(OpenSans_SemiBold, size: 12))
                                .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                            
                            Spacer()
                        }
                    }else if Approvers.reqStatus == "1"{
                        HStack{
                            Image("Seek_Approved_icon")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 21, height: 21)
                            
                            Text(Approvers.requestDetails ?? "")
                                .font(.custom(OpenSans_SemiBold, size: 12))
                                .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                            Spacer()
                        }
                    }else if Approvers.reqStatus == "2"{
                        HStack{
                            Image("Seek_Reject_icon")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 21, height: 21)
                            
                            Text(Approvers.requestDetails ?? "")
                                .font(.custom(OpenSans_SemiBold, size: 12))
                                .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                            Spacer()
                        }
                    }
                }
            }
            .padding(.horizontal, 20)
        }
        .padding(.vertical)
        .frame(width: getRect().width - 40)
        .background(colorScheme == .light ? Color(hex: 0xFFFFFF) : Color(hex: 0x2E2E2E))
        .cornerRadius(12)
        .overlay {
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color(hex: 0xDE1223), lineWidth: 1)
        }
    }
}
