//
//  ViewController+Constraints.swift
//  Kredittkort
//
//  Created by Magdusz on 05.04.2018.
//  Copyright © 2018 com.mcpusz.kredittkort. All rights reserved.
//

import UIKit

//MARK: Constraints
extension ViewController {
    func setupConstraints() {
        
        //add each UI component as subview of main view
        self.uiComponents
            .forEach { self.view.addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false }
        
        //center logo, buttons and validationImage
        [self.appNameLabel, self.validateButton, self.generateButton, self.validationStatusImageView].forEach {
            $0.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        }
        
        let paddingSmall: CGFloat = 8.0
        let paddingBig: CGFloat = 16.0
        
        //App name label
        
        // not so significant to use it for a quick programming assignment :P
        //        let topAnchor: NSLayoutYAxisAnchor
        //        if #available(iOS 11.0, *) {
        //            topAnchor = self.view.safeAreaLayoutGuide.topAnchor
        //        } else {
        //            topAnchor = self.view.topAnchor }
        
        [self.appNameLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 3/4),
         self.appNameLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: self.view.bounds.height/10),
         self.appNameLabel.bottomAnchor.constraint(equalTo: cardDataLabel.topAnchor, constant: -self.view.bounds.height/10)]
            .forEach{ $0.isActive = true }
        
        //Card data label
        [self.cardDataLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: paddingSmall),
         self.cardDataLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -paddingSmall),
         self.cardDataLabel.topAnchor.constraint(greaterThanOrEqualTo: self.appNameLabel.bottomAnchor, constant: paddingSmall),
         self.cardDataLabel.bottomAnchor.constraint(equalTo: self.cardNumberTextField.topAnchor, constant: -paddingSmall)]
            .forEach{ $0.isActive = true }
        
        //Card data inputs
        [self.expiryDateTextField.bottomAnchor.constraint(equalTo: cardNumberTextField.bottomAnchor),
         self.cvvTextField.bottomAnchor.constraint(equalTo: cardNumberTextField.bottomAnchor),
         self.cardNumberTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: paddingSmall),
         self.cardNumberTextField.trailingAnchor.constraint(equalTo: self.expiryDateTextField.leadingAnchor, constant: -paddingSmall),
         self.expiryDateTextField.trailingAnchor.constraint(equalTo: self.cvvTextField.leadingAnchor, constant: -paddingSmall),
         self.cvvTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -paddingSmall),
         self.expiryDateTextField.widthAnchor.constraint(equalTo: self.cvvTextField.widthAnchor),
         self.cvvTextField.widthAnchor.constraint(equalToConstant: self.view.bounds.width/6),
         self.cardNumberTextField.heightAnchor.constraint(equalToConstant: 30),
         self.expiryDateTextField.heightAnchor.constraint(equalTo: self.cardNumberTextField.heightAnchor),
         self.cvvTextField.heightAnchor.constraint(equalTo: self.cardNumberTextField.heightAnchor)]
            .forEach { $0.isActive = true }
        
        //Validation status image view
        [self.validationStatusImageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: self.view.bounds.height/10),
         self.validationStatusImageView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1/6),
         self.validationStatusImageView.widthAnchor.constraint(equalTo: self.validationStatusImageView.heightAnchor)]
            .forEach{ $0.isActive = true }
        
        //Validate button
        [self.validateButton.topAnchor.constraint(greaterThanOrEqualTo: self.cardNumberTextField.bottomAnchor, constant: paddingBig),
         self.validateButton.bottomAnchor.constraint(equalTo: self.validationStatusImageView.topAnchor, constant: -paddingBig),
         self.validateButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 3/5)]
            .forEach{ $0.isActive = true }
        
        //Generate button
        [self.generateButton.topAnchor.constraint(greaterThanOrEqualTo: self.validationStatusImageView.bottomAnchor, constant: paddingBig),
         self.generateButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -paddingBig),
         self.generateButton.widthAnchor.constraint(equalTo: self.validateButton.widthAnchor)]
            .forEach{ $0.isActive = true }
    }
}
