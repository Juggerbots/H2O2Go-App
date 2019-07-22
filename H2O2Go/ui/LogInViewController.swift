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
        
        loginButton.backgroundColor = UIColor.white
        loginButton.layer.cornerRadius = 5
        signupButton.backgroundColor = UIColor.white
        signupButton.layer.cornerRadius = 5
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return identifier != "Log In Segue" || validLogIn(username: usernameField.text, password: passwordField.text)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier != nil && segue.identifier == "Log In Segue" {
            performOnAllTextFields(_func: { textfield in textfield.text = nil })
        }
    }
    
    @IBAction func logInEnter(_ sender: Any) {
        if validLogIn(username: usernameField.text, password: passwordField.text) {
            performSegue(withIdentifier: "Log In Segue", sender: nil)
        } else {
            passwordField.text = nil
        }
    }
    
    func validLogIn(username: String?, password: String?) -> Bool {
        return username != nil && password != nil && username == globalUsername && password == globalPassword
    }
    
}
