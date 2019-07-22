//
//  SignUpViewController.swift
//  H2O2Go
//
//  Created by LamAn Wyner on 7/19/19.
//  Copyright © 2019 LamAn Wyner. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passField: UITextField!
    @IBOutlet weak var confirmPassField: UITextField!
    
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    // override methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        performOnAllTextFields(_func: { textfield in textfield.setBottomBorder(withColor: UIColor.white.cgColor) })
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return identifier == "Sign Up Segue" && isValidUser(name: nameField.text, username: usernameField.text, email: emailField.text, pass: passField.text, pass2: confirmPassField.text)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Sign Up Segue" {
            clearAllTextFields()
        }
    }
    
    // action methods
    
    @IBAction func goBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    // other methods
    
    func isValidUser(name: String?, username: String?, email: String?, pass: String?, pass2: String?) -> Bool {
        if name != nil, username != nil, email != nil, pass != nil, pass2 != nil {
            return username != "testuser" && isValidEmail(email: email!) && pass == pass2
        }
        
        return false
    }
    
    func isValidEmail(email: String) -> Bool {
        let atInd = email.firstIndex(of: "@")
        let dotInd = email.lastIndex(of: ".")
        return atInd != nil && dotInd != nil && atInd! < dotInd!
    }
    
}
