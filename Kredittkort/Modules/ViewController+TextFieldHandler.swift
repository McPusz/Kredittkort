//
//  ViewController+TextFieldHandler.swift
//  Kredittkort
//
//  Created by Magdusz on 06.04.2018.
//  Copyright © 2018 com.mcpusz.kredittkort. All rights reserved.
//

import UIKit

extension ViewController {
    func setupTextFieldsHandling() {
        self.cardNumberTextField.addTarget(self, action: #selector(creditCardTextDidChange(textfield:)), for: .editingChanged)
    }
    
    @objc private func creditCardTextDidChange(textfield: UITextField) {
        textfield.text = textfield.text?.applyCreditCardFormat()
    }
    
}

