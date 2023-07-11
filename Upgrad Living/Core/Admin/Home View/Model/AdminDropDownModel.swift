//
//  AdminDropDownModel.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 04/07/23.
//

import Foundation

struct AdminDropDownModel: Codable, Identifiable{
    let id: String
    let name: String
}

var arrAdminDrop = [
    AdminDropDownModel(id: "1", name: "Today"),
    AdminDropDownModel(id: "2", name: "Yesterday"),
    AdminDropDownModel(id: "3", name: "Last 7 days"),
    AdminDropDownModel(id: "4", name: "Weekly"),
    AdminDropDownModel(id: "5", name: "Monthly")
]

var arrBeds = [
    AdminDropDownModel(id: "1", name: "1 Bed"),
    AdminDropDownModel(id: "2", name: "2 Bed"),
    AdminDropDownModel(id: "3", name: "3 Bed"),
    AdminDropDownModel(id: "4", name: "4 Bed"),
    AdminDropDownModel(id: "5", name: "All Bed")
]
