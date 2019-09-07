//
//  CurrentUser.swift
//  H2O2Go
//
//  Created by LamAn Wyner on 9/5/19.
//  Copyright © 2019 LamAn Wyner. All rights reserved.
//

import Foundation

class CurrentUser {
    
    static var loggedIn: Bool = false
    
    static var username: String?
    static var password: String?
    static var email: String?
    static var firstname: String?
    static var lastname: String?
    static var apiKey: String?
    
    static var bottleSize: Double = 0;
    private(set) static var nRefills: Double = 0;
    static var refillOz: Double {
        return bottleSize * nRefills
    }
    static var gallons: Double {
        return refillOz / 128
    }
    static var bottles: Double {
        return refillOz / 16.9
    }
    static var barrels: Double {
        return (refillOz / (16.9/4)) / (128*42)
    }
    static var money: Double {
        return bottles * 1.45
    }
    
    static func loginUserWith(username: String?, andPassword password: String?) {
        let request = HTTPRequest(urlString: "http://18.233.247.52/h2o2go/v1/login.php", paramNames: ["username", "password"])
        var requestComplete = false
        
        request.sendPostRequestWithParams(username, password) {
            response in
            
            if let error = response["error"] as? Bool {
                if error, let message = response["message"] as? String {
                    print(message)
                } else {
                    self.username = response["username"] as? String
                    self.email = response["email"] as? String
                    firstname = response["firstname"] as? String
                    lastname = response["lastname"] as? String
                    bottleSize = response["bottlesize"] as! Double
                    apiKey = response["api_key"] as? String
                    loggedIn = true
                }
            }
            
            requestComplete = true
        }
        
        while !requestComplete {
            // isn't that unfortunate
        }
    }
    
    static func loadRefills() {
        let request = HTTPRequest(urlString: "http://18.233.247.52/h2o2go/v1/get_refills.php", paramNames: ["username"])
        var requestComplete = false
        
        request.sendGetRequest(authorization: apiKey, params: username) {
            response in
            
            if let error = response["error"] as? Bool {
                if error, let message = response["message"] as? String {
                    print(message)
                } else {
                    nRefills = response["n_refills"] as! Double
                }
            }
            
            requestComplete = true
        }
        
        while !requestComplete {
            // boop
        }
    }
    
    static func createUser() {
        let request = HTTPRequest(urlString: "http://18.233.247.52/h2o2go/v1/register.php", paramNames: ["username", "password", "email", "firstname", "lastname", "bottlesize"])
        var requestComplete = false
        
        request.sendPostRequestWithParams(username, password, email, firstname, lastname, "\(bottleSize)") {
            response in
            
            if let error = response["error"] as? Bool {
                if error, let message = response["message"] as? String {
                    print(message)
                } else {
                    apiKey = response["api_key"] as? String
                    loggedIn = true
                }
            }
            
            requestComplete = true
        }
        
        while !requestComplete {
            // whoops can't move forward
        }
    }
    
    static func refill(_ amount: FillAmount) {
        let request = HTTPRequest(urlString: "http://18.233.247.52/h2o2go/v1/log_refill.php", paramNames: ["username","amount","api_key"])
        var requestComplete = false
        
        request.sendPostRequestWithParams(username, String(amount.doubleValue), apiKey) {
            response in
            
            if let error = response["error"] as? Bool {
                if error, let message = response["message"] as? String {
                    print(message)
                }
            }
            
            requestComplete = true
        }
        
        while !requestComplete {
            // yup yup
        }
    }
    
}
