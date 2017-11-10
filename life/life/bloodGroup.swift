//
//  bloodGroup.swift
//  life
//
//  Created by Arshdeep on 2017-07-04.
//  Copyright © 2017 Arshdeep. All rights reserved.
//

import Foundation

class bloodGroup {
    
    public private(set) var bloodGroup : [String]
    public private(set) var Availability : String
    
    init(bloodGroup: [String], Availability: String){
        self.bloodGroup = bloodGroup
        self.Availability = Availability
    }
    
    
}
