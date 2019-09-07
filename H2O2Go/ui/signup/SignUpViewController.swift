//
//  SignUpViewController.swift
//  H2O2Go
//
//  Created by LamAn Wyner on 8/31/19.
//  Copyright © 2019 LamAn Wyner. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        performOnAllTextFields(_func: { textfield in textfield.setBottomBorder(withColor: AppConstants.blue.cgColor) })
    }
    
}
