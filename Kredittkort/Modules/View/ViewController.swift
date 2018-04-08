//
//  ViewController.swift
//  Kredittkort
//
//  Created by Magdusz on 05.04.2018.
//  Copyright © 2018 com.mcpusz.kredittkort. All rights reserved.
//

import UIKit
import RxSwift

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
    
    var cardTextfieldObservable: Observable<Bool>!
    var expDateTextfieldObservable: Observable<Bool>!
    var cvvTextfieldObservable: Observable<Bool>!
    var disposeBag = DisposeBag()
    
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
        self.setupTextObservables()
    }
    
   
}

