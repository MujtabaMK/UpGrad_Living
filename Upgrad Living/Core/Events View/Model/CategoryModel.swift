//
//  CategoryModel.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 23/05/23.
//

import Foundation


import Foundation

// MARK: - CategoryModel
struct CategoryModel: Codable {
    let status: Int?
    let msg: String?
    let data: [FilterCatagory]?
}

// MARK: - Datum
struct FilterCatagory: Codable, Identifiable {
    let id, categName: String?

    enum CodingKeys: String, CodingKey {
        case id = "categ_id"
        case categName = "categ_name"
    }
}
