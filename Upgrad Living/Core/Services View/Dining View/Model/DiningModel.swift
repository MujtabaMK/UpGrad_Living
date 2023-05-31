//
//  DiningModel.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 30/05/23.
//

import Foundation

// MARK: - DiningModel
struct DiningModel: Codable {
    let status: Int?
    let msg: String?
    let data: DiningClass?
}

// MARK: - DataClass
struct DiningClass: Codable {
    let timings: [ServiceTiming]?
    let days: [ServiceDay]?
}

// MARK: - Day
struct ServiceDay: Codable {
    let day: String?
    let meals: [ServiceMeal]?
}

// MARK: - Meal
struct ServiceMeal: Codable, Identifiable {
    let id, mealName, foodTime: String?
    let foodImage: String?
    let food: [ServiceFood]?

    enum CodingKeys: String, CodingKey {
        case id = "rel_id"
        case mealName = "meal_name"
        case foodTime = "food_time"
        case foodImage = "food_image"
        case food
    }
}

// MARK: - Food
struct ServiceFood: Codable, Identifiable {
    let id, foodName: String?

    enum CodingKeys: String, CodingKey {
        case id = "food_id"
        case foodName = "food_name"
    }
}

// MARK: - Timing
struct ServiceTiming: Codable {
    let mealName, startTime, endTime: String?

    enum CodingKeys: String, CodingKey {
        case mealName = "meal_name"
        case startTime, endTime
    }
}
