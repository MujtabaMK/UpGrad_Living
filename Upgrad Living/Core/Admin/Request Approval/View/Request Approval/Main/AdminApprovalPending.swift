//
//  AdminApprovalPending.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 11/07/23.
//

import SwiftUI

struct AdminApprovalPending: View {
    @Binding var startDate: String
    @Binding var endDate: String
    @Binding var startTime: String
    @Binding var endTime: String
    @Binding var guestName: String
    @Binding var guestNo: String
    @Binding var reason: String
    @Binding var callAPI: Bool
    @Binding var requestID: String
    @Binding var requestStatus: String
    
    @Binding var alertMessage: String
    @Binding var showingAlert: Bool
    @Binding var AlertShow: String
    
    var arrPendingParentDetails: [AdminPending]
    
    var body: some View {
        VStack{
            ForEach(Array(arrPendingParentDetails.enumerated()), id: \.offset) { index, pending in
                VStack{
                    if pending.reasonCateg == "1"{
                        AdminRequestLateNight(startDate: $startDate,
                                               endDate: $endDate,
                                               startTime: $startTime,
                                               endTime: $endTime,
                                               guestName: $guestName,
                                               guestNo: $guestNo,
                                               reason: .constant(pending.reason ?? ""),
                                               callAPI: $callAPI,
                                               requestID: $requestID,
                                               requestStatus: $requestStatus,
                                               alertMessage: $alertMessage,
                                               showingAlert: $showingAlert,
                                               AlertShow: $AlertShow,
                                               arrPending: pending)
                        .padding(.top)
                    }
                    if pending.reasonCateg == "2"{
                        AdminRequestLeave(startDate: $startDate,
                                           endDate: $endDate,
                                           startTime: $startTime,
                                           endTime: $endTime,
                                           guestName: $guestName,
                                           guestNo: $guestNo,
                                           reason: .constant(pending.reason ?? ""),
                                           callAPI: $callAPI,
                                           requestID: $requestID,
                                           requestStatus: $requestStatus,
                                           alertMessage: $alertMessage,
                                           showingAlert: $showingAlert,
                                           AlertShow: $AlertShow,
                                           arrPending: pending)
                        .padding(.top)
                    }
                }
                VStack{
                    if pending.reasonCateg == "3"{
                        AdminRequestFoodDelivery(startDate: $startDate,
                                                  endDate: $endDate,
                                                  startTime: $startTime,
                                                  endTime: $endTime,
                                                  guestName: $guestName,
                                                  guestNo: $guestNo,
                                                  reason: .constant(pending.reason ?? ""),
                                                  callAPI: $callAPI,
                                                  requestID: $requestID,
                                                  requestStatus: $requestStatus,
                                                  alertMessage: $alertMessage,
                                                  showingAlert: $showingAlert,
                                                  AlertShow: $AlertShow,
                                                  arrPending: pending)
                        .padding(.top)
                    }
                    if pending.reasonCateg == "4"{
                        AdminRequestInviteaGuest(startDate: $startDate,
                                                  endDate: $endDate,
                                                  startTime: $startTime,
                                                  endTime: $endTime,
                                                  guestName: $guestName,
                                                  guestNo: $guestNo,
                                                  reason: .constant(pending.reason ?? ""),
                                                  callAPI: $callAPI,
                                                  requestID: $requestID,
                                                  requestStatus: $requestStatus,
                                                  alertMessage: $alertMessage,
                                                  showingAlert: $showingAlert,
                                                  AlertShow: $AlertShow,
                                                  arrPending: pending)
                        .padding(.top)
                    }
                }
            }
        }
    }
}
