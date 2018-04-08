//
//  ViewController.swift
//  Kredittkort
//
//  Created by Magdusz on 05.04.2018.
//  Copyright © 2018 com.mcpusz.kredittkort. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //text input
    private(set) var cardNumberTextField = UITextField()
    private(set) var expiryDateTextField = UITextField()
    private(set) var cvvTextField = UITextField()
    
    //buttons
    private(set) var validateButton = UIButton()
    private(set) var generateButton = UIButton()
    
    private(set) var validationStatusImageView = UIImageView()
    
    private(set) var appNameLabel = UILabel()
    private(set) var cardDataLabel = UILabel()
    
    var uiComponents: [UIView] {
        return [
            self.cardNumberTextField, self.expiryDateTextField, self.cvvTextField,
            self.validateButton, self.generateButton,
            self.validationStatusImageView, self.appNameLabel, self.cardDataLabel
        ]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupConstraints()
        self.setupAppearance()
        self.setupTextFieldsHandling()
        self.setupButtonActions()
    }
    
    private func setupButtonActions() {
        self.validateButton.addTarget(self, action: #selector(validateCard(uiButton:)), for: .touchUpInside)
        self.generateButton.addTarget(self, action: #selector(generateCardNumber(uiButton:)), for: .touchUpInside)
    }
    
    @objc private func validateCard(uiButton: UIButton) {
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
        self.cardNumberTextField.text = MasterCardNumberGenerator().generateCardNumber()
    }
}

