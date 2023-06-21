//
//  TicketCategoryModel.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 06/06/23.
//

import Foundation

// MARK: - TicketCategoryModel
struct TicketCategoryModel: Codable {
    let status: Int?
    let msg: String?
    let data: TicketCategoryClass?
}

// MARK: - DataClass
struct TicketCategoryClass: Codable {
    let ticketCategories: [TicketCategory]?
}

// MARK: - TicketCategory
struct TicketCategory: Codable, Identifiable {
    let id, name: String?
}
