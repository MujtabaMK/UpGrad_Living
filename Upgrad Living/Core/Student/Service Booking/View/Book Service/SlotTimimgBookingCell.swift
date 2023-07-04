//
//  SlotTimimgBookingCell.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 26/06/23.
//

import SwiftUI

struct SlotTimimgBookingCell: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    var timing: ServiceSlotTiming
    var body: some View {
        Text(timing.slotTiming ?? "")
            .font(.custom(OpenSans_SemiBold, size: 14))
            .foregroundColor(colorScheme == .light ? Color(hex: 0x333333) : Color(hex: 0x868686))
            .padding(5)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 33)
            .background(timing.isTimeSlotAvailable == "1" ? Color(hex: 0xFEEEF0) : .clear)
            .cornerRadius(8)
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(timing.isTimeSlotAvailable == "0" ? Color(hex: 0xD96DAE) : Color(hex: 0xDE1223), lineWidth: 1)
            }
    }
}
