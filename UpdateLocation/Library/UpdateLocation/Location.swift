//
//  Location.swift
//  UpdateLocation
//
//  Created by Humza Shahid on 21/08/2016.
//  Copyright © 2016 Humza Shahid. All rights reserved.
//

import Foundation
import CoreLocation

class Location: NSObject, CLLocationManagerDelegate {
    
    //location manager Object
    private var locationManager: CLLocationManager?
    
    // init 
    
    override init() {
        super.init()
        locationManager = CLLocationManager()
        if(CLLocationManager.authorizationStatus() == .AuthorizedWhenInUse){
            if CLLocationManager.locationServicesEnabled() {
                locationManager!.delegate = self
                locationManager!.desiredAccuracy = kCLLocationAccuracyBest
                locationManager!.startMonitoringSignificantLocationChanges()
                locationManager!.startUpdatingLocation()
            }
        }
    }
    
    // kill Location Manger Object Automatically  Called
    deinit {
        locationManager!.stopUpdatingLocation()
        locationManager?.delegate = nil
        locationManager = nil
    }
    
    
    
    @objc func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //let locValue:CLLocationCoordinate2D = manager.location!.coordinate
//        currentLat = "\(locValue.latitude)"
//        currentLong = "\(locValue.longitude)"
        locationManager!.stopUpdatingLocation()
    }
    
    @objc func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        //helper.showAlert("Location Error", message: error.localizedDescription)
    }
}