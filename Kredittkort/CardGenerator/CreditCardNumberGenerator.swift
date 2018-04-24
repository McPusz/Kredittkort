//
//  CreditCardNumberGenerator.swift
//  Kredittkort
//
//  Created by Magdusz on 08.04.2018.
//  Copyright © 2018 com.mcpusz.kredittkort. All rights reserved.
//

import Foundation

enum CreditCardFormat {
    case whitespaces
    case plain
}

struct MasterCardNumberGenerator {
    private let lengthLimit: Int = 16
    private let firstDigit: Int = 5
    //second digit's range is from 1 to 6
    private var secondDigit: Int {
        return Int(arc4random_uniform(5) + 1)
    }
    
    func generateCardNumber(with format: CreditCardFormat? = .whitespaces) -> String {
        var cardNumber: [Int] = [Int](repeating: 0, count: self.lengthLimit)
        cardNumber[0] = self.firstDigit
        cardNumber[1] = self.secondDigit
        for digit in 2..<lengthLimit {
            let randomDigit = Int(arc4random_uniform(10))
            cardNumber[digit] = randomDigit
        }
        
        let lastDigit = self.lastDigitFormula(cardNumber: cardNumber)
        cardNumber[cardNumber.count - 1] = lastDigit
        
        let cardNumberString = cardNumber.map{String($0)}.joined()
        return format == .whitespaces ? cardNumberString.applyCreditCardFormat() : cardNumberString
    }
    
    private func lastDigitFormula(cardNumber: [Int]) -> Int {
        let offset = (self.lengthLimit+1)%2
        var sum = 0
        for i in 0..<self.lengthLimit-1 {
            if ((i+offset) % 2) == 1 {
                var temp = cardNumber[i] * 2
                if temp > 9{
                    temp -= 9
                }
                sum += temp
            }
            else{
                sum += cardNumber[i]
            }
        }
        let finalDigit = (10 - (sum % 10)) % 10
        return finalDigit
    }
    
}
