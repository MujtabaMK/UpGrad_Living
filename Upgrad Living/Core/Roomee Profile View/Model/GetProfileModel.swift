//
//  GetProfileModel.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 24/05/23.
//
import Foundation

// MARK: - CategoryModel
struct GetProfileModel: Codable {
    let status: Int?
    let msg: String?
    let data: ProfileClass?
}

// MARK: - ProfileClass
struct ProfileClass: Codable {
    let appDetails: AppDetails?
    let roomies: [RoomMate]?
    let creativity: [Creativity]?
    let sports: [Sport]?
    let entertainment: [Entertainment]?
    let goingOut: [GoingOut]?
    let foodAndDrink: [FoodAndDrink]?
    let valuesAndTraits: [ValuesAndTrait]?
}

// MARK: - AppDetails
struct AppDetails: Codable {
    let typeID, livSBlood, stateName, cityName: String?
    let ugLivID: String?
    let profileImg: String?
    let studntName: String?

    enum CodingKeys: String, CodingKey {
        case typeID = "type_id"
        case livSBlood = "liv_s_blood"
        case stateName, cityName
        case ugLivID = "ug_liv_id"
        case profileImg, studntName
    }
}

// MARK: - Creativity
struct Creativity: Codable, Identifiable {
    let id, creativityAppID, creativityName, creativityCreatedAt: String?

    enum CodingKeys: String, CodingKey {
        case id = "creativity_id"
        case creativityAppID = "creativity_app_id"
        case creativityName = "creativity_name"
        case creativityCreatedAt = "creativity_created_at"
    }
}

// MARK: - Entertainment
struct Entertainment: Codable, Identifiable {
    let id, entertainmentAppID, entertainmentName, entertainmentCreatedAt: String?

    enum CodingKeys: String, CodingKey {
        case id = "entertainment_id"
        case entertainmentAppID = "entertainment_app_id"
        case entertainmentName = "entertainment_name"
        case entertainmentCreatedAt = "entertainment_created_at"
    }
}

// MARK: - FoodAndDrink
struct FoodAndDrink: Codable, Identifiable {
    let id, foodDrinkAppAp, foodDrinkName, foodDrinkCreatedAt: String?

    enum CodingKeys: String, CodingKey {
        case id = "food_drink_id"
        case foodDrinkAppAp = "food_drink_app_ap"
        case foodDrinkName = "food_drink_name"
        case foodDrinkCreatedAt = "food_drink_created_at"
    }
}

// MARK: - GoingOut
struct GoingOut: Codable, Identifiable {
    let id, goingOutAppID, goingOutName, goingOutCreatedAt: String?

    enum CodingKeys: String, CodingKey {
        case id = "going_out_id"
        case goingOutAppID = "going_out_app_id"
        case goingOutName = "going_out_name"
        case goingOutCreatedAt = "going_out_created_at"
    }
}

// MARK: - Roomy
struct RoomMate: Codable ,Identifiable, Equatable{
    let id, bookingStudentID, studentAppID, studntName: String?
    let studentImg: String?

    enum CodingKeys: String, CodingKey {
        case id = "room_bed_id"
        case bookingStudentID = "booking_student_id"
        case studentAppID = "student_app_id"
        case studntName, studentImg
    }
}

// MARK: - Sport
struct Sport: Codable, Identifiable {
    let id, sportsAppID, sportsName, sportsCreatedAt: String?

    enum CodingKeys: String, CodingKey {
        case id = "sports_id_pk"
        case sportsAppID = "sports_app_id"
        case sportsName = "sports_name"
        case sportsCreatedAt = "sports_created_at"
    }
}

// MARK: - ValuesAndTrait
struct ValuesAndTrait: Codable, Identifiable {
    let id, valuesAppID, valuesName, valuesCreatedID: String?

    enum CodingKeys: String, CodingKey {
        case id = "values_id"
        case valuesAppID = "values_app_id"
        case valuesName = "values_name"
        case valuesCreatedID = "values_created_id"
    }
}
