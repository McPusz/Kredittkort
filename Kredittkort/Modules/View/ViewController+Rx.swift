//
//  ViewController+Rx.swift
//  Kredittkort
//
//  Created by Magdusz on 08.04.2018.
//  Copyright © 2018 com.mcpusz.kredittkort. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

extension ViewController {
    func setupTextObservables() {
        
        self.cardTextfieldObservable = self.setupCardNumberObservable()
        self.expDateTextfieldObservable = self.setupExpDateObservable()
        self.cvvTextfieldObservable = self.setupCvvObservable()
        self.subscribeToObservables()
    }
    
    
    private func setupCardNumberObservable() -> Observable<Bool> {
        return self.cardNumberTextField
            .rx
            .observe(String.self, "text")
            .asObservable()
            .map{$0?.components(separatedBy: .whitespaces).joined()}
            .map { (cardNumber) -> Bool in
                //validity conditions
                let cardNumberLength = 16
                guard let cardNumber = cardNumber else { return false }
                return (!cardNumber.isEmpty) && (cardNumber.count == cardNumberLength)
        }
        
    }
    
    private func setupExpDateObservable() -> Observable<Bool> {
        return self.expiryDateTextField
            .rx
            .text
            .asObservable()
            .map{$0?.components(separatedBy: "/").joined()} //if not joined I could perform month-year validation
            .map({ (expDate) -> Bool in
                guard let expDate = expDate else { return false }
                let mmYYCount = 4
                return (!expDate.isEmpty) && (expDate.count == mmYYCount)
            })
        
    }
    
    private func setupCvvObservable() -> Observable<Bool> {
        return self.cvvTextField
            .rx
            .text
            .asObservable()
            .map{$0?.count == 3}
    }
    
    
    private func subscribeToObservables() {
        let textfieldsObservable = Observable.combineLatest(self.cardTextfieldObservable, self.expDateTextfieldObservable, self.cvvTextfieldObservable) { (s1, s2, s3) -> Bool in
            return s1 && s2 && s3
        }
        
        textfieldsObservable
            .asDriver(onErrorJustReturn: false)
            .drive(onNext: { (valid) in
                self.validateButton.alpha = valid ? 1.0 : 0.5
                let buttonString: String = valid ? "validateButton".localize() : "textFieldsInvalid".localize()
                self.validateButton.setTitle(buttonString, for: .normal)
                self.validateButton.isEnabled = valid 
            }).disposed(by: self.disposeBag)
    }
}
