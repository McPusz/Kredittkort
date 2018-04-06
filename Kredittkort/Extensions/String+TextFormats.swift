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
        let maxLength = 19
        guard !combinedString.isEmpty else { return newFormatString }
        
        for (index, char) in combinedString.enumerated() {
            let nextChar = index+1
            newFormatString.append(char)
            //add space every fourth character
            if (nextChar % 4 == 0) && (nextChar < maxLength) {
                newFormatString.append(" ")
            } else if nextChar > maxLength {
                return newFormatString
            }
        }
        return newFormatString
    }
}
