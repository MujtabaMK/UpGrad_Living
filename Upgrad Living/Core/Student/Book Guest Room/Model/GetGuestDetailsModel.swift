//
//  GetGuestDetailsModel.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 12/06/23.
//

import Foundation

// MARK: - GetGuestDetailsModel
struct GetGuestDetailsModel: Codable {
    let status: Int?
    let msg: String?
    let data: GuestDetailsClass?
}

// MARK: - GuestDetailsClass
struct GuestDetailsClass: Codable {
    let refrenceID, startDate, endDate, nights: String?
    let pdfURL: String?
    let totalGuests: String?
    let guestDetails: [GetGuestDetail]?

    enum CodingKeys: String, CodingKey {
        case refrenceID = "refrenceId"
        case startDate, endDate, pdfURL, nights, totalGuests, guestDetails
    }
}

// MARK: - GuestDetail
struct GetGuestDetail: Codable {
    let serialNo, guestName: String?
}
