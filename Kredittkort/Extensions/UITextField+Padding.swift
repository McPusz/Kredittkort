//
//  UITextField+Padding.swift
//  Kredittkort
//
//  Created by Magdusz on 05.04.2018.
//  Copyright © 2018 com.mcpusz.kredittkort. All rights reserved.
//

import UIKit

extension UITextField {
    func addPaddingLeft(_ padding: CGFloat = 6.0) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: frame.height))
        leftView = paddingView
        leftViewMode = .always
    }
}
