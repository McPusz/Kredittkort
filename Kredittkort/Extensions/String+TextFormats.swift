//
//  String+TextFormats.swift
//  Kredittkort
//
//  Created by Magdusz on 06.04.2018.
//  Copyright © 2018 com.mcpusz.kredittkort. All rights reserved.
//

import Foundation

extension String {
    func applyCreditCardFormat() -> String {
        let combinedString = self.components(separatedBy: .whitespaces).joined()
        var newFormatString = ""
        guard !combinedString.isEmpty else { return newFormatString }
        
        for (index, char) in combinedString.enumerated() {
            let nextChar = index+1
            newFormatString.append(char)
            //add space every fourth character
            if (nextChar % 4 == 0) && (nextChar < combinedString.count) {
                newFormatString.append(" ")
            }
        }
        return newFormatString
    }
    
    func applyExpDateFormat() -> String {
        let combinedString = self.components(separatedBy: "/").joined()
        var newFormatString = ""
        let maxLength = 3
        guard !combinedString.isEmpty else { return newFormatString }
        for (index, char) in combinedString.enumerated() {
            let nextChar = index+1
            newFormatString.append(char)
            if (nextChar % 2 == 0) && nextChar < maxLength {
                newFormatString.append("/")
            }
        }
        return newFormatString
    }
}
