//
//  CreateAccountViewController.swift
//  H2O2Go
//
//  Created by LamAn Wyner on 8/31/19.
//  Copyright © 2019 LamAn Wyner. All rights reserved.
//

import UIKit

class CreateAccountViewController: SignUpViewController {
    
    @IBOutlet weak var firstField: UITextField!
    @IBOutlet weak var lastField: UITextField!
    @IBOutlet weak var bottleField: UITextField!
    
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var lastLabel: UILabel!
    @IBOutlet weak var bottleLabel: UILabel!
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier != "idCreateAccSegue" {
            return true
        }
        
        if firstField.text == nil || firstField.text == "" {
            firstLabel.text = "Enter your first name"
            return false
        }
        firstLabel.text = ""
        
        if lastField.text == nil || lastField.text == "" {
            lastLabel.text = "Enter your last name"
            return false
        }
        lastLabel.text = ""
        
        if bottleField.text == nil || bottleField.text == "" || Double(bottleField.text!) == nil {
            bottleLabel.text = "Invalid bottle size"
            return false
        }
        bottleLabel.text = ""
        
        CurrentUser.firstname = firstField.text
        CurrentUser.lastname = lastField.text
        CurrentUser.bottleSize = Double(bottleField.text!)!
        CurrentUser.createUser()
        
        return CurrentUser.loggedIn
    }
    
}
