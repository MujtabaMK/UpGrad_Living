//
//  ListServiceSlotModel.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 23/06/23.
//

import Foundation

// MARK: - ListServiceSlotModel
struct ListServiceSlotModel: Codable {
    let status: Int?
    let msg: String?
    let data: [ListServiceSlot]?
}

// MARK: - Datum
struct ListServiceSlot: Codable, Identifiable {
    let id, categoryName, slotName, slotTiming: String?
    let fulldate: String?
    let image: String?
    let ticketPDF: String?

    enum CodingKeys: String, CodingKey {
        case id = "bookingId"
        case categoryName, slotName, slotTiming, fulldate, image
        case ticketPDF = "ticketPdf"
    }
}
