//
//  NetworkingManager.swift
//  Kredittkort
//
//  Created by Magdusz on 07.04.2018.
//  Copyright © 2018 com.mcpusz.kredittkort. All rights reserved.
//

import Foundation

enum Result<T> {
    case success(T)
    case failure(Error)
}
struct NetworkManager {
    
    static func checkValidity(for cardNum: String, completion: ((Result<CardModel>)-> Void)?) {
        
        let url = try? NetworkSettings.urlPathFor(cardNumber: cardNum)
        
        //FIXME: error handling
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    completion?(.failure(error))
                } else if let jsonData = data {
                    let decoder = JSONDecoder()
                    
                    do {
                        let card = try decoder.decode(CardModel.self, from: jsonData)
                        completion?(.success(card))
                    } catch {
                        completion?(.failure(NetworkError.dataRetrievingError))
                    }
                }
            }
        }
        task.resume()
    }
    
}
