//
//  CardModel.swift
//  Kredittkort
//
//  Created by Magdusz on 07.04.2018.
//  Copyright © 2018 com.mcpusz.kredittkort. All rights reserved.
//

import Foundation

struct CardModel: Codable {
    let bin: String
    let bank: String
    let card: String
    let type: String
    let level: String
    let country: String
    let countrycode: String
    let website: String
    let phone: String
    let valid: String
}
