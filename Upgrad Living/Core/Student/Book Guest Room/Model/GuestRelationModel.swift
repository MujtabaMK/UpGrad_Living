//
//  GuestRelationModel.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 09/06/23.
//

import Foundation

struct GuestRelationModel: Codable, Identifiable{
    let id: String
    let Name: String
}

var arrRelation = [
    GuestRelationModel(id: "1", Name: "Father"),
    GuestRelationModel(id: "2", Name: "Mother"),
    GuestRelationModel(id: "3", Name: "Guardian"),
    GuestRelationModel(id: "4", Name: "Other")
]
