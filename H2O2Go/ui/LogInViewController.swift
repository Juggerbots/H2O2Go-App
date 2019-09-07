//
//  LogInView.swift
//  H2O2Go
//
//  Created by LamAn Wyner on 7/18/19.
//  Copyright © 2019 LamAn Wyner. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    
    let globalUsername = "testuser"
    let globalPassword = "testpassword"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        performOnAllTextFields(_func: { textfield in textfield.setBottomBorder(withColor: UIColor.white.cgColor) })
        
        loginButton.layer.cornerRadius = 5
        signupButton.layer.cornerRadius = 5
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "idLogInSegue" {
            CurrentUser.loginUserWith(username: usernameField.text, andPassword: passwordField.text)
            return CurrentUser.loggedIn
        }
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier != nil && segue.identifier == "idLogInSegue" && CurrentUser.loggedIn {
            print("partial success")
        }
    }
    
    @IBAction func logInEnter(_ sender: Any) {
        CurrentUser.loginUserWith(username: usernameField.text, andPassword: passwordField.text)
        if CurrentUser.loggedIn {
            performSegue(withIdentifier: "idLogInSegue", sender: nil)
        }
    }
    
    @IBAction func cancelSignUp(_ unwindSegue: UIStoryboardSegue) {
    }
    
}
