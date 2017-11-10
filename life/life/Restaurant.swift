//
//  Restaurant.swift
//  RestBooking
//
//  Created by SinGh HarpAl on 2017-06-29.
//  Copyright © 2017 SinGh HarpAl. All rights reserved.
//

import Foundation

class Restaurant {
    public private(set) var restaurantName    : String
    public private(set) var address : String
    public private(set) var rating : Int
    public private(set) var availTable : Int
    public private(set) var latitude       : Double
    public private(set) var longitude      : Double
    
    init(restaurantName: String, address: String, rating: Int, availTable: Int, latitude: Double, longitude: Double){
        self.restaurantName = restaurantName
        self.address = address
        self.rating = rating
        self.availTable = availTable

        self.latitude = latitude
        self.longitude = longitude
    }
    
}
