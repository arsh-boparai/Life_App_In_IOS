//
//  RecieptViewController.swift
//  life
//
//  Created by Arshdeep on 2017-07-05.
//  Copyright © 2017 Arshdeep. All rights reserved.
//

import UIKit

class RecieptViewController: UIViewController, UITextFieldDelegate
{
    var string = ""
var stringb = ""
    var usernames = "Username 1"
    // Properties
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var bloodgroup: UITextField!
    @IBOutlet weak var locationSelected: UITextField!
    
    @IBOutlet weak var dateLabel: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = DateFormatter.Style.short
        dateFormatter.timeStyle = DateFormatter.Style.short
        
        let strDate = dateFormatter.string(from: datePicker.date)
        dateLabel.text = strDate
    }
    @IBOutlet weak var loca: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        locationSelected.text = string
        bloodgroup.text = stringb
        username.text = usernames
        print("value \(string)")
        username.delegate = self
        bloodgroup.delegate = self
        locationSelected.delegate = self
        dateLabel.delegate = self
        // Do any additional setup after loading the view.
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        username.resignFirstResponder()
        bloodgroup.resignFirstResponder()
        locationSelected.resignFirstResponder()
        dateLabel.resignFirstResponder()
       
        return true
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func Print(_ sender: UIButton) {
        
        let myAlert = UIAlertController(title: "Alert", message: "Printing Data", preferredStyle: .alert);
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default){ action in
            self.dismiss(animated: true, completion: nil)
        }
        myAlert.addAction(okAction)
        self.present(myAlert, animated: true, completion: nil)
    }
  
}
