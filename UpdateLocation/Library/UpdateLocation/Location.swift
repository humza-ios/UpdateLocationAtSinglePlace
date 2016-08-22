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

   // MARK: -location manager Object
   private var locationManager: CLLocationManager?
   // MARK: -responce Block
   var responseBlock: ((coordinates: CLLocationCoordinate2D) -> Void)? = nil
   var errorBlock: ((NSError) -> Void)? = nil

   // MARK: - init  Function
   override init() {
      super.init()
      locationManager = CLLocationManager()
      if (CLLocationManager.authorizationStatus() == .AuthorizedWhenInUse) {
         if CLLocationManager.locationServicesEnabled() {
            locationManager!.delegate = self
            locationManager!.desiredAccuracy = kCLLocationAccuracyBest
            locationManager!.startMonitoringSignificantLocationChanges()
            locationManager!.startUpdatingLocation()
         }
      } else {
         self.locationManager!.requestWhenInUseAuthorization()
         locationManager!.desiredAccuracy = kCLLocationAccuracyBest
      }
   }
   // MARK: - kill Location Manger Object Automatically  Called
   deinit {
      locationManager!.stopUpdatingLocation()
      locationManager?.delegate = nil
      locationManager = nil
   }
   // MARK: - Delegate Function of Location Manager
   func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
      let coordinates: CLLocationCoordinate2D = manager.location!.coordinate
      locationManager!.stopUpdatingLocation()
      locationManager?.delegate = nil
      locationManager = nil
      responseBlock!(coordinates: coordinates)
   }

   func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
      errorBlock!(error)
   }

}