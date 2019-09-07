//
//  RefillStation.swift
//  H2O2Go
//
//  Created by LamAn Wyner on 9/2/19.
//  Copyright © 2019 LamAn Wyner. All rights reserved.
//

import MapKit

class RefillStation: NSObject, MKAnnotation {
    
    static var allStations: [RefillStation] = []

    let coordinate: CLLocationCoordinate2D
    let title: String?
    let subtitle: String?
    
    init(atCoord coordinate: CLLocationCoordinate2D, withName title: String, andDescription subtitle: String) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
    }
    
    func addToDatabase() {
        let request = HTTPRequest(urlString: "http://18.233.247.52/h2o2go/v1/add_location.php", paramNames: ["name", "description", "lat", "long", "username", "api_key"])
        var requestComplete = false;
        
        request.sendPostRequestWithParams(title, subtitle, String(coordinate.latitude), String(coordinate.longitude), CurrentUser.username, CurrentUser.apiKey) {
            response in
            
            if let error = response["error"] as? Bool {
                if error, let message = response["message"] as? String {
                    print(message)
                }
            }
            
            requestComplete = true
        }
        
        while !requestComplete {
            // continue
        }
    }
    
    static func getAllStations() {
        allStations = []
        
        let request = HTTPRequest(urlString: "http://18.233.247.52/h2o2go/v1/get_locations.php", paramNames: ["username"])
        var requestComplete = false;
        
        request.sendGetRequest(authorization: CurrentUser.apiKey, params: CurrentUser.username) {
            response in
            
            if let error = response["error"] as? Bool {
                if error, let message = response["message"] {
                    print(message)
                } else {
                    let stations = response["locations"] as! [Any]
                    
                    for station in stations {
                        let stationDict = station as! [String:Any]
                        let name = stationDict["location_name"] as! String
                        let description = stationDict["description"] as! String
                        let latitude = stationDict["latitude"] as! Double
                        let longitude = stationDict["longitude"] as! Double
                        
                        allStations.append(RefillStation(atCoord: CLLocationCoordinate2D(latitude: latitude, longitude: longitude), withName: name, andDescription: description))
                    }
                }
            }
            
            requestComplete = true
        }
        
        while !requestComplete {
            // nope
        }
    }
    
}
