//
//  PasswordViewController.swift
//  H2O2Go
//
//  Created by LamAn Wyner on 8/31/19.
//  Copyright © 2019 LamAn Wyner. All rights reserved.
//

import UIKit

class PasswordViewController: SignUpViewController {
    
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var confirmPasswordField: UITextField!
    
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var confirmPassLabel: UILabel!
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier != "idPasswordSegue" {
            return true
        }
        
        if passwordField.text == nil || passwordField.text! == "" {
            passwordLabel.text = "Enter a password"
            return false
        }
        passwordLabel.text = ""
        
        if confirmPasswordField.text == nil || confirmPasswordField.text! == "" || confirmPasswordField.text! != passwordField.text! {
            confirmPassLabel.text = "Passwords do not match"
            return false
        }
        confirmPassLabel.text = ""
        
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier != nil && segue.identifier == "idPasswordSegue" {
            CurrentUser.password = passwordField.text
        }
    }
    
}
