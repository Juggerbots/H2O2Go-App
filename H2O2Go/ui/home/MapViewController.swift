//
//  MapViewController.swift
//  H2O2Go
//
//  Created by LamAn Wyner on 9/2/19.
//  Copyright © 2019 LamAn Wyner. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager: CLLocationManager = CLLocationManager()
    let initialRadius: CLLocationDistance = 1000
    var currentPinCoord: CLLocationCoordinate2D!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationAuthStatus()
        startReceivingLocationChanges()
        centerMapOnLocation(mapView.userLocation.coordinate)
        RefillStation.getAllStations()
        addLocationsAsAnnotations()
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(dropPin(_:)))
        longPress.minimumPressDuration = 1.5
        mapView.addGestureRecognizer(longPress)
    }
    
    func locationAuthStatus() {
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse || CLLocationManager.authorizationStatus() == .authorizedAlways {
            mapView.showsUserLocation = true
            return
        }
        
        locationManager.requestWhenInUseAuthorization()
    }
    
    func startReceivingLocationChanges() {
        let authorizationStatus = CLLocationManager.authorizationStatus()
        if authorizationStatus != .authorizedWhenInUse && authorizationStatus != .authorizedAlways {
            return
        }
        
        if !CLLocationManager.locationServicesEnabled() {
            return
        }
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        locationManager.distanceFilter = 10.0
        locationManager.pausesLocationUpdatesAutomatically = true
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
    }
    
    func centerMapOnLocation(_ location: CLLocationCoordinate2D) {
        mapView.setRegion(MKCoordinateRegion(center: location, latitudinalMeters: initialRadius, longitudinalMeters: initialRadius), animated: false)
    }
    
    func addLocationsAsAnnotations() {
        for station in RefillStation.allStations {
            mapView.addAnnotation(station)
        }
    }
    
    @objc func dropPin(_ recognizer: UIGestureRecognizer) {
        let touchedAt = recognizer.location(in: mapView)
        currentPinCoord = mapView.convert(touchedAt, toCoordinateFrom: mapView)
        
        let annotationViewController = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "annotationViewController")
        present(annotationViewController, animated: true, completion: nil)
    }
    
    @IBAction func cancelAnnotation(_ unwindSegue: UIStoryboardSegue) {
    }
    
    @IBAction func addAnnotation(_ unwindSegue: UIStoryboardSegue) {
        let sourceViewController = unwindSegue.source as! AnnotationViewController
        let newStation = RefillStation(atCoord: currentPinCoord, withName: sourceViewController.nameTextField.text!, andDescription: sourceViewController.descriptionTextField.text!)
        newStation.addToDatabase()
        
        mapView.addAnnotation(newStation)
    }
    
}
