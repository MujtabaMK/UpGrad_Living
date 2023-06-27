//
//  CountryModel.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 29/03/23.
//

import Foundation

// MARK: - CountryModel
struct CountryModel: Codable {
    let status: Int?
    let msg: String?
    let data: CountryClass?
}

// MARK: - CountryClass
struct CountryClass: Codable {
    let countries: [contry]?, states: [states]?, cities: [City]?
}

// MARK: - City
struct City: Codable, Identifiable {
    let id, name: String?
}

struct states: Codable, Identifiable {
    let id, name: String?
}

struct contry: Codable, Identifiable {
    let id, name: String?
}
