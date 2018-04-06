//
//  ViewController+Appearance.swift
//  Kredittkort
//
//  Created by Magdusz on 05.04.2018.
//  Copyright © 2018 com.mcpusz.kredittkort. All rights reserved.
//

import UIKit

extension ViewController {
    func setupAppearance() {
        self.setupBackgroundColors()
        self.setupFontColors()
        self.setupTextAttributes()
        self.setupStaticTextContent()
        self.setupRoundCorners()
    }
    
    private func setupBackgroundColors() {
        self.view.backgroundColor = Colors.crayola
        self.validateButton.backgroundColor = Colors.roseMadder
        self.generateButton.backgroundColor = Colors.roseMadder
        self.cardNumberTextField.backgroundColor = Colors.babyPowder.withAlphaComponent(0.2)
        self.expiryDateTextField.backgroundColor = Colors.babyPowder.withAlphaComponent(0.2)
        self.cvvTextField.backgroundColor = Colors.babyPowder.withAlphaComponent(0.2)
        self.validationStatusImageView.backgroundColor = Colors.babyPowder.withAlphaComponent(0.2)
    }
    
    private func setupFontColors() {
        self.appNameLabel.textColor = Colors.babyPowder
        self.cardDataLabel.textColor = Colors.babyPowder
        self.cardNumberTextField.textColor = Colors.babyPowder
        self.expiryDateTextField.textColor = Colors.babyPowder
        self.cvvTextField.textColor = Colors.babyPowder
        self.validateButton.setTitleColor(Colors.babyPowder, for: .normal)
        self.generateButton.setTitleColor(Colors.babyPowder, for: .normal)
    }
    
    private func setupTextAttributes() {
        self.appNameLabel.font = UIFont.systemFont(ofSize: 32)
        self.cardDataLabel.font = UIFont.systemFont(ofSize: 20)
        self.appNameLabel.textAlignment = .center
        [self.cardNumberTextField, self.expiryDateTextField, self.cvvTextField].forEach{
            $0.addPaddingLeft()
            $0.keyboardType = .numberPad
        }
    }
    
    private func setupStaticTextContent() {
        self.appNameLabel.text = "appNameLabel".localize()
        self.cardDataLabel.text = "cardDataLabel".localize()
        self.cardNumberTextField.placeholder = "cardNumberPlaceholder".localize()
        self.expiryDateTextField.placeholder = "expDatePlaceholder".localize()
        self.cvvTextField.placeholder = "cvvPlaceholder".localize()
        self.validateButton.setTitle("validateButton".localize(), for: .normal)
        self.generateButton.setTitle("generateButton".localize(), for: .normal)
    }
    
    private func setupRoundCorners() {
        let cornerRoundSize: CGFloat = 6
        [self.cardNumberTextField, self.expiryDateTextField, self.cvvTextField,
         self.generateButton, self.validateButton, self.validationStatusImageView].forEach { $0.layer.cornerRadius = cornerRoundSize}
        
        
    }
}
