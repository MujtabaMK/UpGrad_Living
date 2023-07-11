//
//  RequestReasonModel.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 13/06/23.
//

import Foundation

struct RequestReasonModel: Codable, Identifiable{
    let id: String
    let name: String
}

var arrRequestReason = [
    RequestReasonModel(id: "1", name: "Late night"),
    RequestReasonModel(id: "2", name: "Leave"),
    RequestReasonModel(id: "3", name: "Online delivery"),
    RequestReasonModel(id: "4", name: "Invite a guest")
]
