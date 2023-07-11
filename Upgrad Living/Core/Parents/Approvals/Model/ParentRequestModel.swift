//
//  ParentRequestModel.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 10/07/23.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let parentRequestModel = try? JSONDecoder().decode(ParentRequestModel.self, from: jsonData)

import Foundation

// MARK: - ParentRequestModel
struct ParentRequestModel: Codable {
    let status: Int?
    let msg: String?
    let data: [ParentRequest]?
}

// MARK: - Datum
struct ParentRequest: Codable, Identifiable {
    let id, requestCategory, guestName, guestNo: String?
    let reasonCateg, startDate, startTime, days: String?
    let dateDetails: String?
    let approvers: [ParentApprover]?

    enum CodingKeys: String, CodingKey {
        case id = "requestId"
        case requestCategory, guestName, guestNo, reasonCateg, startDate, startTime, days, dateDetails, approvers
    }
}

// MARK: - Approver
struct ParentApprover: Codable {
    let requestDetails, reqStatus, userCode: String?
}
