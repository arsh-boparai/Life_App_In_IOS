//
//  ViewController.swift
//  life
//
//  Created by Arshdeep on 2017-06-27.
//  Copyright © 2017 Arshdeep. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    // MARK PROPERTIES
    
    
    @IBOutlet weak var username_input: UITextField!
    @IBOutlet weak var password_input: UITextField!
  
    
    // MARK AUTHENTICATION
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        username_input.delegate = self
        password_input.delegate = self
    
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        username_input.resignFirstResponder()
        password_input.resignFirstResponder()
        return true
    }

    
    // MARK SEGUE


    

    @IBAction func loginButton(_ sender: UIButton) {
        let userName = username_input.text
        let password = password_input.text
        
        let userNameStored = UserDefaults().string(forKey: "userName")
        let userPasswordStored = UserDefaults().string(forKey: "password")
        if (userNameStored == userName)
        {
            if (userPasswordStored == password)
            {
                UserDefaults().set(true, forKey: "isUserLoggedIn")
                UserDefaults().synchronize()

                func viewDidAppear(animated: Bool){
                    let isUserLoggedIn = UserDefaults().bool(forKey: "isUserLoggedIn")
                    if(isUserLoggedIn)
                    {
                        self.performSegue(withIdentifier: "AfterLoginView", sender: self)
                    }
                }
                
                self.dismiss(animated: true, completion: nil)
        }
        }
        
    }
    
    
    // MARK ACTIONS
   
  
    @IBAction func SignUp(_ sender: UIButton) {
    }
   
        @IBAction func unwindToBrand(segue: UIStoryboardSegue)
    {
        
    }

    
       
        

}

