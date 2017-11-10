//
//  mapViewController.swift
//  life
//
//  Created by Arshdeep on 2017-07-04.
//  Copyright © 2017 Arshdeep. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class mapViewController: UIViewController, CLLocationManagerDelegate {

    
    //MARK properties
    @IBOutlet weak var mapObj: MKMapView!
    var bloodBank : [bloodbank] = []
    var mapManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapManager.delegate = self                            // ViewController is the "owner" of the map.
        mapManager.desiredAccuracy = kCLLocationAccuracyBest  // Define the best location possible to be used in app.
        mapManager.requestWhenInUseAuthorization()            // The feature will not run in background
        mapManager.startUpdatingLocation()                    // Continuously geo-position update
        
loadData()
        // Do any additional setup after loading the view.
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // The array locations stores all the user's positions, and the position 0 is the most recent one
        let location = locations[0]
        // Here we define the map's zoom. The value 0.01 is a pattern
        let zoom:MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
        // Store latitude and longitude received from smartphone
        let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        // Based on myLocation and zoom define the region to be shown on the screen
        let region:MKCoordinateRegion = MKCoordinateRegionMake(myLocation, zoom)
        // Setting the map itself based previous set-up
        mapObj.setRegion(region, animated: true)
        // Showing the blue dot in a map
        mapObj.showsUserLocation = true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func loadData()
    {
        let t1 = bloodbank(Name: "Yorkland",address: "265,Yorkland blvd", bloodGroup: ["A+","A-","AB+","AB-","O+","O-"], latitude: 45.419124, longitude: -75.704084 )
        let t2 = bloodbank(Name: "Brampton",address: "71,Brampton Terminal", bloodGroup: ["A+","A-","AB+","AB-","O+","O-"], latitude: 43.6661, longitude: -79.7339 )
        let t3 = bloodbank(Name: "missisauga",address: "square one mall", bloodGroup: ["A+","A-","AB+","AB-","O+","O-"], latitude: 43.5929, longitude: -79.6422 )
        
        bloodBank.append(t1)
        bloodBank.append(t2)
        bloodBank.append(t3)

        }
    
   if let r1 = retrieveData(Name: location.text!)
    {
       let userAnnotation = CLLocationCoordinate2DMake(r1.latitude, r1.longitude)
        let zoom:MKCoordinateSpan  = MKCoordinateSpanMake(0.05, 0.05)
        let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(43.653226, -79.383184)
        
        // Based on myLocation and zoom define the region to be shown on the screen
        let region:MKCoordinateRegion = MKCoordinateRegionMake(myLocation, zoom)
        mapObj.setRegion(region, animated: true)
        mapObj.mapType = MKMapType.satellite
        
        let restPin = RestPins(title:r1.restaurantName,subtitle:r1.address,coordinate:userAnnotation)
        
        mapObj.addAnnotation(restPin)
    }

    

}
