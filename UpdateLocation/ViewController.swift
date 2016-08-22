//
//  ViewController.swift
//  UpdateLocation
//
//  Created by Humza Shahid on 21/08/2016.
//  Copyright © 2016 Humza Shahid. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   var location: Location!

   override func viewDidLoad() {
      super.viewDidLoad()
      // get location coordinates
      updateLocation()
   }

   func updateLocation() {
      location = Location()
      location.responseBlock = { location in
         print(location.latitude)
         print(location.longitude)
      }
      location.errorBlock = { error in
         print(error.description)
      }
   }

   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.

   }

}

