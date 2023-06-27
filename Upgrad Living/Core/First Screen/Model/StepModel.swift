//
//  StepModel.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 05/04/23.
//

import Foundation

// MARK: - StepModel
struct StepModel: Codable {
    let status: Int?
    let msg: String?
    let data: StepDataClass?
}

// MARK: - StepDataClass
struct StepDataClass: Codable {
    let step: String?
}
