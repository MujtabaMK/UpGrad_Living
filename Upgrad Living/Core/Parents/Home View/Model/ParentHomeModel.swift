//
//  ParentHomeModel.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 19/06/23.
//

import Foundation
// MARK: - ParentHomeModel
struct ParentHomeModel: Codable {
    let status: Int?
    let msg: String?
    let data: ParentHomeDataClass?
}

// MARK: - ParentHomeDataClass
struct ParentHomeDataClass: Codable {
    let requestsCount: ParentRequestsCount?
    let meal: [ParentMeal]?
    let emergenyContacts: [PatentEmergenyContact]?
    let studentTime: ParentStudentTime?
}

// MARK: - EmergenyContact
struct PatentEmergenyContact: Codable {
    let helpDesk, contactNo, email, whatsappNo: String?
}

// MARK: - Meal
struct ParentMeal: Codable, Identifiable {
    let id, mealName, foodTime: String?
    let foodImage: String?
    let food: [ParentFood]?

    enum CodingKeys: String, CodingKey {
        case id = "rel_id"
        case mealName = "meal_name"
        case foodTime = "food_time"
        case foodImage = "food_image"
        case food
    }
}

// MARK: - Food
struct ParentFood: Codable, Identifiable {
    let id, foodName: String?

    enum CodingKeys: String, CodingKey {
        case id = "food_id"
        case foodName = "food_name"
    }
}

// MARK: - RequestsCount
struct ParentRequestsCount: Codable {
    let pendings, approved, rejected: String?
}

// MARK: - StudentTime
struct ParentStudentTime: Codable {
    let date, exitTime, enteryTime: String?
}
