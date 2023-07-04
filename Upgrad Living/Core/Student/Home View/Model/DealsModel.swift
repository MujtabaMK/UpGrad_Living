//
//  DealsMode.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 12/05/23.
//

import Foundation

struct DealsModel: Identifiable, Equatable{
    var id = UUID().uuidString
    var Image: String
    var Persentage: String
    var Item: String
}

var arrDeals = [
    DealsModel(Image: "Baskit_icon", Persentage: "50", Item: "Selected Item"),
    DealsModel(Image: "Coffee_icon", Persentage: "50", Item: "Selected Item"),
]

