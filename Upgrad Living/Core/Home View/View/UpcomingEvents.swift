//
//  UpcomingEvents.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 29/04/23.
//

import SwiftUI

struct UpcomingEvents: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    var body: some View {
        VStack{
            HStack{
                Text("Upcoming events")
                    .font(.custom(OpenSans_Bold, size: 20))
                    .foregroundColor(colorScheme == .light ? Color(hex: 0x1A1A1A) : Color(hex: 0xFFFFFF))
                
                Spacer()
                Button {
                    
                } label: {
                    Text("See All")
                        .font(.custom(OpenSans_SemiBold, size: 12))
                        .foregroundColor(colorScheme == .light ? Color(hex: 0x868686) : Color(hex: 0x868686))
                }
                
                Image(systemName: "arrowtriangle.forward.fill")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 6, height: 9)

            }
            .padding(.horizontal)
        }
    }
}

struct UpcomingEvents_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingEvents()
    }
}
