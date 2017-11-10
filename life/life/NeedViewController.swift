//
//  NeedViewController.swift
//  life
//
//  Created by Arshdeep on 2017-07-03.
//  Copyright © 2017 Arshdeep. All rights reserved.
//

import UIKit
import Foundation
import MapKit
class NeedViewController: UIViewController, UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource {
    var loc = ""

    
    
    
    @IBOutlet weak var bloodGroup: UITextField!
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var citySelected: UITextField!
    @IBOutlet weak var location: UITextField!
    @IBOutlet weak var picker1: UIPickerView!
    
    @IBOutlet weak var mapObj: MKMapView!
    
    
    
    
    
    
    var bloodBank : [bloodbank] = []
    
    var mapManager = CLLocationManager()
    
    var pickerDataSource = ["A+", "A-", "B+", "B-", "AB+", "AB-", "O+", "O-"]
    
    var pickerDataSource1 = ["Toronto","North York","Brampton","Missisauga", "Oakville","London","Scarborough"]
    override func viewDidLoad() {
        super.viewDidLoad()
    
        picker.delegate = self
        picker1.delegate = self
        mapManager.delegate = self as? CLLocationManagerDelegate                            // ViewController is the "owner" of the map.
        mapManager.desiredAccuracy = kCLLocationAccuracyBest  // Define the best location possible to be used in app.
        mapManager.requestWhenInUseAuthorization()            // The feature will not run in background
        mapManager.startUpdatingLocation()
        loadData()
        // Do any additional setup after loading the view.
    }
    
    // Do any additional setup after loading the view.

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
func loadData()
{
    let t1 = bloodbank(Name: "Yorkland",address: "265,Yorkland blvd", bloodGroup: ["A+","A-","AB+","AB-","O+","O-"], latitude: 45.419124, longitude: -75.704084 )
    let t2 = bloodbank(Name: "Brampton",address: "71,Brampton Terminal", bloodGroup: ["A+","A-","AB+","AB-","O+","O-"], latitude: 43.6661, longitude: -79.7339 )
    let t3 = bloodbank(Name: "missisauga",address: "square one mall", bloodGroup: ["A+","A-","AB+","AB-","O+","O-"], latitude: 43.5929, longitude: -79.6422 )
    
    bloodBank.append(t1)
    bloodBank.append(t2)
    bloodBank.append(t3)
    
}

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        if (pickerView.tag == 1)
        {
            return pickerDataSource.count;
        }
        else
        {
            return pickerDataSource1.count
        }
 
    }
    
    
    //Delegate
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        if pickerView == picker
        {
            return pickerDataSource[row]
        }
        else
        {
            return pickerDataSource1[row]
        }

    
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if pickerView == picker
        {
            self.bloodGroup.text = self.pickerDataSource[row]
            
            
        }
        else
        {
            self.citySelected.text = self.pickerDataSource1[row]
          
                   }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Select(_ sender: UIButton) {
        
 
       let Group = bloodGroup.text
        let city = citySelected.text
        
     
        // Check Empty fields
        // Store data
        
        
        UserDefaults().set(Group, forKey: "Group")
        UserDefaults().set(city, forKey: "city")
       // UserDefaults().set(location, forKey: "location")
        UserDefaults().synchronize()
        
        // Confirmation Message
      /*  let myAlert = UIAlertController(title: "Alert", message: "Selected", preferredStyle: .alert);
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default){ action in
           // self.dismiss(animated: true, completion: nil)
        }*/
       // myAlert.addAction(okAction)
      //  self.present(myAlert, animated: true, completion: nil)
     self.performSegue(withIdentifier: "ToReceipt", sender: self)
      
     /*
        
        let secondViewC = self.storyboard?.instantiateViewController(withIdentifier: "secondViewC") as! RecieptViewController
        secondViewC.bloodgroup = bloodGroup
        secondViewC.locationSelected = citySelected
        
       
        */
    }
    
    
    
    func displayAlertMessage(userMessage: String)
    {
        let myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: .alert);
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil);
        myAlert.addAction(okAction)
        self.present(myAlert, animated: true, completion: nil)
    }
    @IBAction func NearBy(_ sender: UIButton)
    {
        
        
        if let r1 = retrieveData()
        {
            
            
            let userAnnotation =  CLLocationCoordinate2DMake(r1.latitude,r1.longitude)
            
            
            
            // Here we define the map's zoom. The value 0.01 is a pattern
            let zoom:MKCoordinateSpan = MKCoordinateSpanMake(100, 100)
            
            // Store latitude and longitude received from smartphone
            let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(43.653226, -79.383184)
            
            // Based on myLocation and zoom define the region to be shown on the screen
            let region:MKCoordinateRegion = MKCoordinateRegionMake(myLocation, zoom)
            
            // Setting the map itself based previous set-up
            mapObj.setRegion(region, animated: true)
            mapObj.mapType = MKMapType.standard
            
            let restPin = RestPins(title:r1.Name,subtitle:r1.address,coordinate:userAnnotation)
           
           location.text = r1.Name
           
            loc = r1.Name
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let mvc = storyboard.instantiateViewController(withIdentifier: "secondViewC") as! RecieptViewController
            // mvc.obj = obj
            mvc.string = r1.Name
            mvc.stringb = bloodGroup.text!
            
            
            navigationController?.pushViewController(mvc, animated: true)
            present(mvc, animated: true, completion: nil)

            
            mapObj.addAnnotation(restPin)

            
           
        }
        else
        {
            let alert = UIAlertController(title : " Alert ", message : " Invalid Search ", preferredStyle:UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title : " OK ",style: UIAlertActionStyle.default, handler : nil))
            
            self.present(alert,animated : true, completion : nil)
        }
        
        
      
    }
    func retrieveData() -> bloodbank?
    {
        for r in bloodBank
        {
            
                return r
            
        }
        return nil
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView?
    {
        var view = mapView.dequeueReusableAnnotationView(withIdentifier: "1")
        if view == nil
        {
            view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "1")
            view!.canShowCallout = true
        }
        else
        {
            view!.annotation = annotation
        }
        
       view?.rightCalloutAccessoryView = UIButton(type: UIButtonType.contactAdd)
        
        return view
    }
    
    @IBOutlet weak var back: UIButton!
 
}


