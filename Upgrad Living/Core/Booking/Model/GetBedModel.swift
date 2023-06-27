//
//  GetBedModel.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 04/05/23.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let getBedsModel = try? JSONDecoder().decode(GetBedsModel.self, from: jsonData)

import Foundation

// MARK: - GetBedsModel
struct GetBedModel: Codable {
    let status: Int?
    let msg: String?
    let data: BedClass?
}

// MARK: - BedClass
struct BedClass: Codable {
    let insertID, roomName, floorName, bedNo: String?
    let bedDetails: [BedDetail]?

    enum CodingKeys: String, CodingKey {
        case insertID = "insertId"
        case roomName, floorName, bedNo, bedDetails
    }
}

// MARK: - BedDetail
struct BedDetail: Codable, Identifiable,Equatable {
    let id, studentAppID, clusterCode, clusterSpecialisation: String?
    let specialisationName, studentName, dietry, stateName: String?
    let cityName, bedNoLoop, bedStatus, bedstatus: String?
    let studentImg: String?

    enum CodingKeys: String, CodingKey {
        case id = "student_id"
        case studentAppID = "student_app_id"
        case clusterCode = "cluster_code"
        case clusterSpecialisation = "cluster_specialisation"
        case specialisationName = "specialisation_name"
        case bedNoLoop = "bedNo"
        case studentName, dietry, stateName, cityName, bedStatus, bedstatus, studentImg
    }
}

var BedValue = [BedClass(insertID: "1", roomName: "a", floorName: "a", bedNo: "a", bedDetails: [])]
