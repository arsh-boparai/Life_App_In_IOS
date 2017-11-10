//
//  ProtectedViewController.swift
//  life
//
//  Created by Arshdeep on 2017-07-05.
//  Copyright © 2017 Arshdeep. All rights reserved.
//

import UIKit

class ProtectedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func viewDidAppear(_ animated: Bool) {
        
        
        let isUserLoggedIn = UserDefaults().bool(forKey: "isUserLoggedIn")
        if(!isUserLoggedIn)
        {
        
        self.performSegue(withIdentifier: "ToLoginView", sender: self)
        }
        else
        {
            self.performSegue(withIdentifier: "AfterLoginView", sender: self)
        }
    }

}
