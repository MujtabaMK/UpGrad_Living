//
//  UserPastTicket.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 06/06/23.
//

import SwiftUI

struct UserPastTicket: View {
    var arrPast: [PastTicket]
    
    @State private var isUserTicket = false
    @State private var getticketId = ""
    
    var body: some View {
        VStack{
            ForEach(arrPast) { past in
                Button {
                    getticketId = past.id ?? ""
                    isUserTicket = true
                } label: {
                    UserPastPicketSub(PastTicket: past)
                        .padding(.bottom)
                        .padding(.leading)
                }                
            }
            
            NavigationLink(
                "",
                destination: UserPastTicketView(ticketId: getticketId).navigationBarHidden(true),
                isActive: $isUserTicket).isDetailLink(false)
        }
        .padding(.top)
    }
}
