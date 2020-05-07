//
//  Quake.swift
//  Quakes
//
//  Created by Ezra Black on 5/7/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

import Foundation


//Objective-C based maps, decodable so we can parse the json data that we are going to get.
class Quake: NSObject, Decodable {
    
    enum CodingKeys: String, CodingKey {
        case magnitude = "mag"
    }
    let magnitude: Double
    let place: String
    let time: Date
    let latitude: Double
    let longitude: Double
    //pulling in from the JSON
    required init(from decoder: Decoder)
        throws {
            //Containers
            
            //set each value here
            self.magnitude = 0
            self.place = ""
            self.time = Date()
            self.latitude = 0
            self.longitude = 0
            
            super.init()
    }
}
