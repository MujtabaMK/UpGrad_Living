//
//  ProfileModel.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 24/05/23.
//

import Foundation

struct ProfileStaticModel: Codable, Identifiable{
    var id = UUID().uuidString
    let name: String
}

var arrProfile = [
    ProfileStaticModel(name: "Misic"),
    ProfileStaticModel(name: "Reading"),
    ProfileStaticModel(name: "Football"),
    ProfileStaticModel(name: "cooking"),
    ProfileStaticModel(name: "Gardaning"),
    ProfileStaticModel(name: "Circket")
]

