//
//  ServiceModel.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 29/05/23.
//

import Foundation

struct ServiceModel: Codable, Identifiable{
    var id = UUID()
    let NewImageName: String
}

var arrServce = [
    ServiceModel(NewImageName: "Service_Dining"),
    ServiceModel(NewImageName: "Service_Laundry"),
    ServiceModel(NewImageName: "Service_Gym_Fitness"),
    ServiceModel(NewImageName: "Service_Sports"),
    ServiceModel(NewImageName: "Service_HealtCare"),
    ServiceModel(NewImageName: "Service_House_Keeping"),
    ServiceModel(NewImageName: "Service_Convenience"),
    ServiceModel(NewImageName: "Service_Coffee_Barista")
]
