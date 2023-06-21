//
//  ProfileInfoModel.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 05/06/23.
//

import Foundation

// MARK: - ProfileInfoModel
struct ProfileInfoModel: Codable {
    let status: Int?
    let msg: String?
    let data: ProfileInfoClass?
}

// MARK: - DataClass
struct ProfileInfoClass: Codable {
    let profile: ProfileInfo?
    let creativity: [ProfileCreativity]?
    let sports: [ProfileSport]?
    let entertainment: [ProfileEntertainment]?
    let goingOut: [ProfileGoingOut]?
    let foodAndDrink: [ProfileFoodAndDrink]?
    let stayingIn: [ProfileStayingIn]?
    let valuesAndTraits: [ProfileValuesAndTrait]?
    let helpDesk: [ProfileHelpDesk]?
    let studentTime: StudentTime?
}

// MARK: - Creativity
struct ProfileCreativity: Codable, Equatable {
    let creativityName: String?

    enum CodingKeys: String, CodingKey {
        case creativityName = "creativity_name"
    }
}

// MARK: - Entertainment
struct ProfileEntertainment: Codable {
    let entertainmentName: String?

    enum CodingKeys: String, CodingKey {
        case entertainmentName = "entertainment_name"
    }
}

// MARK: - FoodAndDrink
struct ProfileFoodAndDrink: Codable {
    let foodDrinkName: String?

    enum CodingKeys: String, CodingKey {
        case foodDrinkName = "food_drink_name"
    }
}

// MARK: - GoingOut
struct ProfileGoingOut: Codable {
    let goingOutName: String?

    enum CodingKeys: String, CodingKey {
        case goingOutName = "going_out_name"
    }
}

// MARK: - HelpDesk
struct ProfileHelpDesk: Codable {
    let helpDesk, contactNo: String?
}

// MARK: - Profile
struct ProfileInfo: Codable {
    let typeID, livSBlood, livSDob, livSBedNo: String?
    let stateName, cityName, ugLivID, livSDietary: String?
    let appID, mob, email: String?
    let profileImg: String?
    let studntName, fathersName, fmob, femail: String?
    let mothersName, mmob, memail: String?

    enum CodingKeys: String, CodingKey {
        case typeID = "type_id"
        case livSBlood = "liv_s_blood"
        case livSDob = "liv_s_dob"
        case livSBedNo = "liv_s_bed_no"
        case stateName, cityName
        case ugLivID = "ug_liv_id"
        case livSDietary = "liv_s_dietary"
        case appID = "appId"
        case mob, email, profileImg, studntName, fathersName, fmob, femail, mothersName, mmob, memail
    }
}

// MARK: - Sport
struct ProfileSport: Codable {
    let sportsName: String?

    enum CodingKeys: String, CodingKey {
        case sportsName = "sports_name"
    }
}

// MARK: - StayingIn
struct ProfileStayingIn: Codable {
    let stayingInName: String?

    enum CodingKeys: String, CodingKey {
        case stayingInName = "staying_in_name"
    }
}

// MARK: - ValuesAndTrait
struct ProfileValuesAndTrait: Codable {
    let valuesName: String?

    enum CodingKeys: String, CodingKey {
        case valuesName = "values_name"
    }
}

// MARK: - StudentTime
struct StudentTime: Codable {
    let date, exitTime, enteryTime: String?
}
