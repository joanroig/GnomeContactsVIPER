//
//  Gnome.swift
//  GnomeContacts
//
//  Created by Joan Roig on 3/3/18.
//  Copyright © 2018 Joan Roig. All rights reserved.
//

import Foundation

struct Gnome: Codable {
    let id : Int
    let name : String
    let age : Int
    let weight : Double
    let height : Double
    let hair_color : hairColor
    let thumbnail : URL
    let professions: [String]
    let friends: [String]
    
}

enum hairColor : String, Codable {
    case Pink
    case Red
    case Green
    case Black
    case Gray
}


