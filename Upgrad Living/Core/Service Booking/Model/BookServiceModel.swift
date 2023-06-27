//
//  BookServiceModel.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 22/06/23.
//

import Foundation

struct BookServiceModel: Codable, Identifiable{
    let id: String
    let ServiceName: String
}


var arrBookService = [
    BookServiceModel(id: "1", ServiceName: "Houskeeeping"),
    BookServiceModel(id: "2", ServiceName: "Dining"),
    BookServiceModel(id: "3", ServiceName: "Laundry"),
    BookServiceModel(id: "4", ServiceName: "Gym & Fitness Studio"),
    BookServiceModel(id: "5", ServiceName: "Multi-Sport Turf"),
    BookServiceModel(id: "6", ServiceName: "Healthcare")
]
