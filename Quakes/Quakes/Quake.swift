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
        case place
        case time
        case latitude
        case longitude
        
        case properties
        case geometry
        case coordinates
    }
    let magnitude: Double?
    let place: String
    let time: Date
    let latitude: Double
    let longitude: Double
    //pulling in from the JSON
    required init(from decoder: Decoder)
        throws {
            //Containers
            let container = try decoder.container(keyedBy: CodingKeys.self)
            let properties = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .properties)
            let geometry = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .geometry)
            var coordinates = try geometry.nestedUnkeyedContainer(forKey: .coordinates)
            
            //set each value here
            self.magnitude = try properties.decodeIfPresent(Double.self, forKey: .magnitude)
            self.place = try properties.decode(String.self, forKey: .place)
            self.time = try properties.decode(Date.self, forKey: .time)
            self.longitude = try coordinates.decode(Double.self)
            self.latitude = try coordinates.decode(Double.self)
            
            super.init()
    }
}
