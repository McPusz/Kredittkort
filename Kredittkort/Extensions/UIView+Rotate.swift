//
//  UIView+Rotate.swift
//  Kredittkort
//
//  Created by Magdusz on 08.04.2018.
//  Copyright © 2018 com.mcpusz.kredittkort. All rights reserved.
//

import UIKit

extension UIView {
    private var rotationKey: String {
        return "transform.rotation"
    }
    
    func startRotating() {
        guard self.layer.animation(forKey: self.rotationKey) == nil else { return }
        let animation = CABasicAnimation(keyPath: self.rotationKey)
        animation.duration = 1.0
        animation.repeatCount = .infinity
        animation.fromValue = 0
        animation.toValue = Float.pi*2
        self.layer.add(animation, forKey: self.rotationKey)
    }
    
    func stopRotating() {
        guard self.layer.animation(forKey: self.rotationKey) != nil else { return }
        self.layer.removeAnimation(forKey: self.rotationKey)
    }
}
