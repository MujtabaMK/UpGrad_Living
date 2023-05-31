//
//  OfferModel.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 29/05/23.
//

import Foundation

// MARK: - OfferModel
struct OfferModel: Codable {
    let status: Int?
    let msg: String?
    let data: [HostelOffer]?
}

// MARK: - Datum
struct HostelOffer: Codable, Identifiable {
    let id, name, productName, description: String?
    let offerImage: String?

    enum CodingKeys: String, CodingKey {
        case id = "offer_id"
        case name
        case productName = "product_name"
        case description
        case offerImage = "offer_image"
    }
}
