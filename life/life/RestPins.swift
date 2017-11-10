//
//  RestPins.swift
//  life
//
//  Created by Arshdeep on 2017-07-05.
//  Copyright © 2017 Arshdeep. All rights reserved.
//

import Foundation
import MapKit

class RestPins: NSObject, MKAnnotation
{
    var title: String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D
    
    init(title:String,subtitle:String,coordinate:CLLocationCoordinate2D)
    {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
    }
    
    
    // getTitle
}
