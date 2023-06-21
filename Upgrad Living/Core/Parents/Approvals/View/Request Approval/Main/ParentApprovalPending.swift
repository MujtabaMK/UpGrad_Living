//
//  ParentApprovalPending.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 20/06/23.
//

import SwiftUI

struct ParentApprovalPending: View {
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
    
    var arrPendingParentDetails: [ParentPending]
    
    var body: some View {
        VStack{
            ForEach(Array(arrPendingParentDetails.enumerated()), id: \.offset) { index, pending in
                VStack{
                    if pending.reasonCateg == "1"{
                        ParentRequestLateNight(startDate: $startDate,
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
                        ParentRequestLeave(startDate: $startDate,
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
                        ParentRequestFoodDelivery(startDate: $startDate,
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
                        ParentRequestInviteaGuest(startDate: $startDate,
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
