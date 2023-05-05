//
//  FloorSelectionView.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 03/05/23.
//

import Foundation

// MARK: - GetFloorModel
struct GetFloorModel: Codable {
    let status: Int?
    let msg: String?
    let data: FloorClass?
}

// MARK: - DataClass
struct FloorClass: Codable {
    let roomType, floorType,dietry: String?
    let floors: [Floor]?
}

// MARK: - Floor
struct Floor: Codable,Identifiable {
    let id, livingFloorName, livingFloorCode: String?

    enum CodingKeys: String, CodingKey {
        case id = "living_floor_id"
        case livingFloorName = "living_floor_name"
        case livingFloorCode = "living_floor_code"
    }
}

//var Floors = [
//    FloorSelectionModel(name: "5", isActive: false),
//    FloorSelectionModel(name: "6", isActive: false),
//    FloorSelectionModel(name: "7", isActive: false),
//    FloorSelectionModel(name: "8", isActive: false),
//    FloorSelectionModel(name: "9", isActive: false)
//]
