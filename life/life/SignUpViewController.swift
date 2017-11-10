//
//  SignUpViewController.swift
//  life
//
//  Created by Arshdeep on 2017-06-28.
//  Copyright © 2017 Arshdeep. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate {
 // MArk PROPERTIES

   
  
    @IBOutlet weak var UserNameTextField: UITextField!
    @IBOutlet weak var UserEmailTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var RepeatPasswordTextField: UITextField!
   
    @IBOutlet weak var BloodGroupTextField: UITextField!
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        UserNameTextField.delegate = self
        UserEmailTextField.delegate = self
        PasswordTextField.delegate = self
        RepeatPasswordTextField.delegate = self
        BloodGroupTextField.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        UserNameTextField.resignFirstResponder()
        UserEmailTextField.resignFirstResponder()
        PasswordTextField.resignFirstResponder()
        RepeatPasswordTextField.resignFirstResponder()
        BloodGroupTextField.resignFirstResponder()
        return true
    }


    
    @IBAction func SignUp(_ sender: UIButton) {
        
        let userName = UserNameTextField.text
        let userEmail = UserEmailTextField.text
        let password = PasswordTextField.text
        let repeatPassword = RepeatPasswordTextField.text
        let bloodGroup = BloodGroupTextField.text
        // Check Empty fields
        if((userName?.isEmpty)! || (userEmail?.isEmpty)! || (password?.isEmpty)! || (repeatPassword?.isEmpty)!) || (bloodGroup?.isEmpty)!{
            
            // display message
            
            displayAlertMessage(userMessage: "All fields are required")
            return;
            
        }
        
        if(password != repeatPassword){
            
            // alert message
            displayAlertMessage(userMessage: "passwords do not match")
            
            return;
        }
        
        // Store data
        
        UserDefaults().set(userName, forKey: "userName")
        UserDefaults().set(userEmail, forKey: "userEmail")
        UserDefaults().set(password, forKey: "password")
        UserDefaults().set(bloodGroup, forKey: "bloodGroup")
        UserDefaults().synchronize()
        
        // Confirmation Message
        let myAlert = UIAlertController(title: "Alert", message: "SignUp is Successful. Thank you!", preferredStyle: .alert);
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default){ action in
        self.dismiss(animated: true, completion: nil)
        }
        myAlert.addAction(okAction)
        self.present(myAlert, animated: true, completion: nil)
        
        
/*
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! DonateRecieptViewController
        secondViewController.username = UserNameTextField
        secondViewController.bloodgroup = BloodGroupTextField
        
        let secondViewC = self.storyboard?.instantiateViewController(withIdentifier: "secondViewC") as! RecieptViewController
        secondViewC.username = UserNameTextField
        
 */       
        
        
    }
   
    
    
    func displayAlertMessage(userMessage: String)
    {
        let myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: .alert);
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil);
        myAlert.addAction(okAction)
        self.present(myAlert, animated: true, completion: nil)
    }
    
    

}
