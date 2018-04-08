//
//  ViewController+ButtonActions.swift
//  Kredittkort
//
//  Created by Magdusz on 08.04.2018.
//  Copyright © 2018 com.mcpusz.kredittkort. All rights reserved.
//

import UIKit

extension ViewController {
    func setupButtonActions() {
        self.validateButton.addTarget(self, action: #selector(validateCard(uiButton:)), for: .touchUpInside)
        self.generateButton.addTarget(self, action: #selector(generateCardNumber(uiButton:)), for: .touchUpInside)
    }
    
    @objc private func validateCard(uiButton: UIButton) {
        //If more time I would add observables on all three textfiel texts that would enable this button when all three textfielsd validation became successful
        self.startSpinner()
        let cardNumber: String = self.cardNumberTextField.text?.components(separatedBy: .whitespaces).joined() ?? ""
        NetworkManager.checkValidity(for: cardNumber) { (result) in
            switch result {
            case .success(let cardInfo):
                print(cardInfo)
                self.validationStatusImageView.stopRotating()
                self.validationStatusImageView.image = #imageLiteral(resourceName: "validation_success_icon")
            case .failure(let error):
                print("error: \(error)")
                self.validationStatusImageView.stopRotating()
                self.validationStatusImageView.image = #imageLiteral(resourceName: "unknown_status_icon")
            case .error(let error):
                print("Valid error: \(error)")
                self.validationStatusImageView.stopRotating()
                self.validationStatusImageView.image = #imageLiteral(resourceName: "validation_failed_icon")
            }
        }
    }
    
    private func startSpinner() {
        self.validationStatusImageView.image = #imageLiteral(resourceName: "loader_icon")
        self.validationStatusImageView.startRotating()
    }
    
    @objc private func generateCardNumber(uiButton: UIButton) {
        let cardNumber = MasterCardNumberGenerator().generateCardNumber()
        self.cardNumberTextField.insertText(cardNumber)
    }
}
