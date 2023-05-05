//
//  BedSuccessMode.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 04/05/23.
//

import Foundation

// MARK: - GetBedsModel
struct BedSuccessModel: Codable {
    let status: Int?
    let msg: String?
    let data: BedSuccessClass?
}

// MARK: - DataClass
struct BedSuccessClass: Codable {
    let roomName: String?
}
