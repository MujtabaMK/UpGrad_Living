//
//  ServiceSlotModel.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 22/06/23.
//

import Foundation

// MARK: - ServiceSlotModel
struct ServiceSlotModel: Codable {
    let status: Int?
    let msg: String?
    let data: [ServiceSlot]?
}

// MARK: - Datum
struct ServiceSlot: Codable {
    let slotName, slotID: String?
    let slotTimings: [ServiceSlotTiming]?
    
    enum CodingKeys: String, CodingKey {
        case slotName
        case slotID = "slotId"
        case slotTimings
    }
}

// MARK: - SlotTiming
struct ServiceSlotTiming: Codable, Identifiable {
    let id, slotTiming, isTimeSlotAvailable: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "timeSlotId"
        case slotTiming, isTimeSlotAvailable
    }
}
