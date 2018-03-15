//
//  ContactDirectory.swift
//  GnomeContacts
//
//  Created by Joan Roig on 4/3/18.
//  Copyright © 2018 Joan Roig. All rights reserved.
//

import Foundation

struct ContactDirectory : Codable{
    // Dynamic keys for city names
    struct CityNameKey : CodingKey {
        var stringValue: String
        init?(stringValue: String) {
            self.stringValue = stringValue
        }
        var intValue: Int? { return nil }
        init?(intValue: Int) { return nil }
    }
    let cities : [City]
}

// Custom decoder
extension ContactDirectory {
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CityNameKey.self)
        var cityList: [City] = []
        
        // Iterate over all cities (dynamic keys)
        for key in container.allKeys {
            do{
                let name = key.stringValue
                var citizens: [Gnome] = []
                
                // Get all GnomeContacts from the current city (key)
                var citizensList = try container.nestedUnkeyedContainer(forKey: key)
                while (!citizensList.isAtEnd) {
                    let citizen = try citizensList.decode(Gnome.self)
                    citizens.append(citizen)
                }
                cityList.append(City(cityName: name, citizens: citizens))
            } catch{
                print("Unexpected error: \(error).")
            }
        }
        cities = cityList
    }
}
