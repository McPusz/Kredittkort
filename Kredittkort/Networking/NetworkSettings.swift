//
//  NetworkSettings.swift
//  Kredittkort
//
//  Created by Magdusz on 07.04.2018.
//  Copyright © 2018 com.mcpusz.kredittkort. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case dataRetrievingError
}

struct NetworkSettings {
    static let mainURL: String = "https://api.bincodes.com/cc"
    static let format: String = "/json"
    static let apiKey: String = "/5232a9bca11e25c0f8eb4313ff2644be"
    
    static func urlPathFor(cardNumber: String) throws -> URL {
        let urlString = NetworkSettings.mainURL + NetworkSettings.format + NetworkSettings.apiKey + "/\(cardNumber)"
        guard let url = URL(string: urlString) else { throw NetworkError.invalidURL }
        return url
    }
}
