//
//  HTTPRequest.swift
//  H2O2Go
//
//  Created by LamAn Wyner on 9/5/19.
//  Copyright © 2019 LamAn Wyner. All rights reserved.
//

import Foundation

struct HTTPRequest {
    let urlString: String
    let paramNames: [String]
    
    func sendPostRequestWithParams(_ params: String?..., completion: @escaping ([String:Any]) -> Void) {
        if (params.count != paramNames.count) {
            return completion(["error":true,"message":"Number of parameter values do not match number of parameter names"])
        }
        var paramStr = ""
        for i in 0..<params.count {
            if let param = params[i] {
                paramStr = paramStr + "\(paramNames[i])=\(param)&"
            } else {
                return completion(["error":true,"message":"One or more parameters nil"])
            }
        }
        paramStr.remove(at: paramStr.index(before: paramStr.endIndex))
        
        if let requestURL = URL(string: urlString) {
            var request = URLRequest(url: requestURL)
            request.httpMethod = "POST"
            request.httpBody = paramStr.data(using: .utf8)
            
            let _ = URLSession.shared.dataTask(with: request) {
                data, response, error in
                
                if error != nil {
                    print("Error: \(error!).")
                    return
                }
                
                do {
                    let jsonRaw = try JSONSerialization.jsonObject(with: data!)
                    if let json = jsonRaw as? [String:Any] {
                        return completion(json)
                    } else {
                        return completion(["error":true,"message":"Could not convert \(type(of: jsonRaw)) to [String:Any]"])
                    }
                } catch {
                    return completion(["error":true,"message":"Could not get JSON object"])
                }
            }.resume()
        }
    }
    
    func sendGetRequest(authorization: String?, params: String?..., completion: @escaping ([String:Any]) -> Void) {
        if params.count != paramNames.count || authorization == nil {
            return completion(["error":true,"message":"Parameters or authorization missing."])
        }
        var paramStr = "?"
        for i in 0..<params.count {
            if let param = params[i] {
                paramStr = paramStr + "\(paramNames[i])=\(param)&"
            } else {
                return completion(["error":true,"message":"One or more parameters nil"])
            }
        }
        paramStr.remove(at: paramStr.index(before: paramStr.endIndex))
        
        if let requestURL = URL(string: urlString + paramStr) {
            var request = URLRequest(url: requestURL)
            request.httpMethod = "GET"
            request.setValue(authorization, forHTTPHeaderField: "Authorization")
            
            let _ = URLSession.shared.dataTask(with: request) {
                data, response, error in
                
                if error != nil {
                    print("Error: \(error!)")
                    return
                }
                
                do {
                    let jsonRaw = try JSONSerialization.jsonObject(with: data!)
                    if let json = jsonRaw as? [String:Any] {
                        return completion(json)
                    } else {
                        return completion(["error":true,"message":"Could not convert \(type(of: jsonRaw)) to [String:Any]"])
                    }
                } catch {
                    return completion(["error":true,"message":"Could not get JSON object"])
                }
            }.resume()
        }
    }
}
