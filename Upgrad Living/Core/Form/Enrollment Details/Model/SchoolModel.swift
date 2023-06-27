//
//  SchoolModel.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 31/03/23.
//

import Foundation

// MARK: - SchoolModel
struct SchoolModel: Codable {
    let status: Int?
    let msg: String?
    let data: SchoolClass?
}

// MARK: - SchoolClass
struct SchoolClass: Codable {
    let specialization: [Specialization]?
    let degree: [Degree]?
    let program: [Program]?
    let school: [School]?
}

// MARK: - Degree
struct Degree: Codable, Identifiable {
    let id, abbrivation: String?
}

// MARK: - Program
struct Program: Codable, Identifiable {
    var id = UUID().uuidString
    let certificationID, certificationShortName: String?

    enum CodingKeys: String, CodingKey {
        case certificationID = "certification_id"
        case certificationShortName = "certification_short_name"
    }
}

// MARK: - School
struct School: Codable, Identifiable {
    var id = UUID().uuidString
    let schoolID, schoolFullName, schoolNameShort: String?

    enum CodingKeys: String, CodingKey {
        case schoolID = "school_id"
        case schoolFullName = "school_full_name"
        case schoolNameShort = "school_name_short"
    }
}

// MARK: - Specialization
struct Specialization: Codable, Identifiable {
    var id = UUID().uuidString
    let specialisationID, specialisationName, specialisationShortName: String?

    enum CodingKeys: String, CodingKey {
        case specialisationID = "specialisation_id"
        case specialisationName = "specialisation_name"
        case specialisationShortName = "specialisation_short_name"
    }
}
