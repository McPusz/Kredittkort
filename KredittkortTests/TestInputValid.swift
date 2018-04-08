//
//  TestInputValid.swift
//  KredittkortTests
//
//  Created by Magdusz on 08.04.2018.
//  Copyright © 2018 com.mcpusz.kredittkort. All rights reserved.
//

import XCTest
@testable import Kredittkort

class TestInputValid: XCTestCase {
    
    var sut: ViewController!
    
    let validCardNumber = "5157359818590564"
    let validExpDate = "11/21"
    let validCvv = "123"
    let invalidCardNumber = "51574"
    let invalidExpDate = "11/211"
    let invalidCvv = "1233"
    
    override func setUp() {
        super.setUp()
        self.sut = ViewController()
        _ = self.sut.view
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testCardNumberInvalid() {
        self.sut.cardNumberTextField.text = self.invalidCardNumber
        XCTAssertFalse(self.sut.validateButton.isEnabled)
    }
    
    func testExpDateInvalid() {
        self.sut.expiryDateTextField.text = self.invalidExpDate
        XCTAssertFalse(self.sut.validateButton.isEnabled)
    }

    func testCvvInvalid() {
        self.sut.cvvTextField.text = self.invalidCvv
        XCTAssertFalse(self.sut.validateButton.isEnabled)
    }
    
    func testDataValidity() {
        self.sut.cardNumberTextField.insertText(self.validCardNumber)
        self.sut.expiryDateTextField.insertText(self.validExpDate)
        self.sut.cvvTextField.insertText(self.validCvv)
        XCTAssertTrue(self.sut.validateButton.isEnabled)
    }
    
    func testOneTextFieldInvalid() {
        self.sut.cardNumberTextField.insertText(self.invalidCardNumber)
        self.sut.expiryDateTextField.insertText(self.validExpDate)
        self.sut.cvvTextField.insertText(self.validCvv)
        XCTAssertFalse(self.sut.validateButton.isEnabled)
    }
}
