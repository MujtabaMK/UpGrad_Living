//
//  AdminRequestModel.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 11/07/23.
//

import Foundation

// MARK: - AdminRequestModel
struct AdminRequestModel: Codable {
    let status: Int?
    let msg: String?
    let data: [AdminRequest]?
}

// MARK: - Datum
struct AdminRequest: Codable, Identifiable {
    let id, requestCategory, guestName, guestNo: String?
    let reasonCateg, startDate, startTime, days: String?
    let dateDetails: String?
    let roomName, studntName, studentImg: String?
    let approvers: [AdminApprover]?
    
    enum CodingKeys: String, CodingKey {
        case id = "requestId"
        case requestCategory, guestName, guestNo, reasonCateg, startDate, startTime, days, dateDetails, approvers, roomName, studntName, studentImg
    }
}

// MARK: - Approver
struct AdminApprover: Codable {
    let requestDetails, reqStatus, userCode: String?
}
