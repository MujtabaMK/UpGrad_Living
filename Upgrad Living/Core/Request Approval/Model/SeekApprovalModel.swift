//
//  SeekApprovalModel.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 15/06/23.
//

import Foundation

// MARK: - SeekApprovalModel
struct SeekApprovalModel: Codable {
    let status: Int?
    let msg: String?
    let data: [SeekApprovalRequest]?
}

// MARK: - Datum
struct SeekApprovalRequest: Codable {
    let requestID, requestCategory, guestName, guestNo: String?
    let reasonCateg, startDate, startTime, days: String?
    let dateDetails: String?
    let approvers: [Approver]?

    enum CodingKeys: String, CodingKey {
        case requestID = "requestId"
        case requestCategory, guestName, guestNo, reasonCateg, startDate, startTime, days, dateDetails, approvers
    }
}

// MARK: - Approver
struct Approver: Codable {
    let requestDetails, reqStatus: String?
}
