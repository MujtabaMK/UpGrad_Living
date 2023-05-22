//
//  RoomieModel.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 11/05/23.
//

import Foundation

struct RoomieModel: Identifiable, Equatable{
    var id = UUID().uuidString
    var Image: String
}

var arrRoomie = [
    RoomieModel(Image: "Jon_Deo"),
    RoomieModel(Image: "Jon_Deo"),
    RoomieModel(Image: "Jon_Deo"),
]
