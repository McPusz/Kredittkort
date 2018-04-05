//
//  String+Localize.swift
//  Kredittkort
//
//  Created by Magdusz on 05.04.2018.
//  Copyright © 2018 com.mcpusz.kredittkort. All rights reserved.
//

import Foundation

extension String {
    public func localize() -> String {
        return NSLocalizedString(self, comment: "")
    }
}
