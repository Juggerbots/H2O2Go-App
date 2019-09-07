//
//  UsernameViewController.swift
//  H2O2Go
//
//  Created by LamAn Wyner on 8/31/19.
//  Copyright © 2019 LamAn Wyner. All rights reserved.
//

import UIKit

class UsernameViewController: SignUpViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier != "idUsernameSegue" {
            return true
        }
        
        if emailField.text == nil || emailField.text! == "" || !isValidEmail(email: emailField.text!) {
            emailLabel.text = "Invalid email address"
            return false
        }
        emailLabel.text = ""
        
        if usernameField.text == nil || usernameField.text! == "" || !isValidUser(username: usernameField.text!) {
            usernameLabel.text = "Invalid username"
            return false
        }
        usernameLabel.text = ""
        
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier != nil && segue.identifier == "idUsernameSegue" {
            CurrentUser.username = usernameField.text;
            CurrentUser.email = emailField.text;
        }
    }
    
    func isValidEmail(email: String) -> Bool {
        let atInd = email.firstIndex(of: "@")
        let dotInd = email.lastIndex(of: ".")
        return atInd != nil && dotInd != nil && atInd! < dotInd! && email.startIndex < atInd! && email.endIndex > dotInd! && email.distance(from: atInd!, to: dotInd!) > 1
    }
    
    func isValidUser(username: String) -> Bool {
        return true
    }
    
}
