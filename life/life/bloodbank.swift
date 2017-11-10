//
//  bloodbank.swift
//  life
//
//  Created by Arshdeep on 2017-07-04.
//  Copyright © 2017 Arshdeep. All rights reserved.
//

import Foundation


class bloodbank {
    public private(set) var Name    : String
    public private(set) var address : String
    
    public private(set) var bloodGroup : [String]
    
    
    public private(set) var latitude       : Double
    public private(set) var longitude      : Double
  
    init(Name: String, address: String, bloodGroup: [String], latitude: Double, longitude: Double){
        self.Name = Name
        self.address = address
        
        self.bloodGroup = bloodGroup
        self.latitude = latitude
        self.longitude = longitude
    }
    
}
