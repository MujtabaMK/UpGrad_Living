//
//  MasterModel.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 29/03/23.
//

import Foundation
// MARK: - MasterModel
struct MasterModel: Codable {
    let status: Int?
    let msg: String?
    let data: DataClass?
}

// MARK: - DataClass
struct DataClass: Codable {
    let gender: [gender], bloodGroups: [BloodGroup], countries: [countries]?
}

// MARK: - BloodGroup
struct BloodGroup: Codable, Identifiable {
    let id, name: String?
}

// MARK: - gender
struct gender: Codable, Identifiable {
    let id, name: String?
}

// MARK: - Country
struct countries: Codable, Identifiable {
    let id, name: String?
}
