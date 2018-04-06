//
//  ViewController+TextFieldHandler.swift
//  Kredittkort
//
//  Created by Magdusz on 06.04.2018.
//  Copyright © 2018 com.mcpusz.kredittkort. All rights reserved.
//

import UIKit

extension ViewController: UITextFieldDelegate {
    func setupTextFieldsHandling() {
        self.setupDelegates()
        self.cardNumberTextField.addTarget(self, action: #selector(creditCardTextDidChange(textfield:)), for: .editingChanged)
        self.expiryDateTextField.addTarget(self, action: #selector(expDateDidChange(textfield:)), for: .editingChanged)
    }
    
    private func setupDelegates() {
        self.cardNumberTextField.delegate = self
        self.expiryDateTextField.delegate = self
        self.cvvTextField.delegate = self
    }
    
    @objc private func creditCardTextDidChange(textfield: UITextField) {
        textfield.text = textfield.text?.applyCreditCardFormat()
    }
    
    @objc private func expDateDidChange(textfield: UITextView) {
        textfield.text = textfield.text.applyExpDateFormat()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentCharCount = (textField.text?.count)! + string.count - 1
        
        switch (textField, currentCharCount) {
        case (self.cardNumberTextField, 19):
            self.expiryDateTextField.becomeFirstResponder()
        case (self.expiryDateTextField, 5):
            self.cvvTextField.becomeFirstResponder()
        case (self.cvvTextField, 3):
            self.cvvTextField.resignFirstResponder()
            return false
        default: break
        }
        return true
    }
}

