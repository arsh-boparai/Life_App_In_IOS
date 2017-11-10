//
//  DonateViewController.swift
//  life
//
//  Created by Arshdeep on 2017-06-28.
//  Copyright © 2017 Arshdeep. All rights reserved.
//

import UIKit
import Foundation

class DonateViewController: UIViewController, UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource {
    
   // Mark properties
    
    
   
    @IBOutlet weak var citySelected: UITextField!
    
    
    @IBOutlet weak var picker: UIPickerView!
    
    @IBOutlet weak var back: UIButton!
   
    
    var pickerDataSource = ["Toronto","North York","Brampton","Missisauga", "Oakville","London","Scarborough"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        citySelected.delegate = self
        // Do any additional setup after loading the view.
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
            return pickerDataSource.count
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
            return pickerDataSource[row]
        }
        

       
        
        
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        
            self.citySelected.text = self.pickerDataSource[row]
        
    }


   

    // MARK ACTIONS
    
  
    
    
    
   
    
    
    @IBAction func Select(_ sender: UIButton) {
    
    
    
    
    
        
        let city = citySelected.text
        
        // Check Empty fields
        if (city?.isEmpty)!{
            
            // display message
            
            displayAlertMessage(userMessage: "enter valid city")
            return;
            
        }
      //  UserDefaults().set(citySelected, forKey: "citySelected")
        
        
        
        
       
        
        // Confirmation Message
      /*  let myAlert = UIAlertController(title: "Alert", message: "Selected", preferredStyle: .alert);
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default){ action in
          //  self.dismiss(animated: true, completion: nil)
        }
        myAlert.addAction(okAction)
        self.present(myAlert, animated: true, completion: nil)
        */
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mvc = storyboard.instantiateViewController(withIdentifier: "secondViewC") as! RecieptViewController
        // mvc.obj = obj
        mvc.string = citySelected.text!
        
        
        
        navigationController?.pushViewController(mvc, animated: true)
        present(mvc, animated: true, completion: nil)
        
     //   self.performSegue(withIdentifier: "ToReciept", sender: self)
    
    
    }

    func displayAlertMessage(userMessage: String)
    {
        let myAlert  = UIAlertController(title: "Alert", message: userMessage, preferredStyle: .alert);
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil);
        myAlert.addAction(okAction)
        self.present(myAlert, animated: true, completion: nil)
    }

    




        
        
        
    
}

