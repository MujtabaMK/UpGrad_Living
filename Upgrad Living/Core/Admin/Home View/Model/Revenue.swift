//
//  Revenue.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 05/07/23.
//

import Foundation

// 1. Data model
struct Revenue: Identifiable {
    let id = UUID()
    let period: String
    let amount: Double
}

// 2. Actual revenue data
let revenueData: [Revenue] = [
    Revenue(period: "2020 Q1", amount: 53711.30),
    Revenue(period: "2020 Q2", amount: 64768.50),
    Revenue(period: "2020 Q3", amount: 43990.90),
    Revenue(period: "2020 Q4", amount: 71546.80),
    Revenue(period: "2021 Q1", amount: 89976.30),
    Revenue(period: "2021 Q2", amount: 98645.80),
    Revenue(period: "2021 Q3", amount: 101944.10),
    Revenue(period: "2021 Q4", amount: 71955.90),
    Revenue(period: "2022 Q1", amount: 125525.25),
    Revenue(period: "2022 Q2", amount: 154389.50),
    Revenue(period: "2022 Q3", amount: 131987.90),
    Revenue(period: "2022 Q4", amount: 178965.80)
]
