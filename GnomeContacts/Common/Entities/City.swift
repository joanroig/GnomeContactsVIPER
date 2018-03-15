//
//  City.swift
//  GnomeContacts
//
//  Created by Joan Roig on 4/3/18.
//  Copyright © 2018 Joan Roig. All rights reserved.
//

import Foundation

struct City : Codable {
    var cityName : String
    var citizens : [Gnome]
}
