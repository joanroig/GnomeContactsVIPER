//
//  GnomeListEntityManager.swift
//  GnomeContacts
//
//  Created by Joan Roig on 4/3/18.
//  Copyright © 2018 Joan Roig. All rights reserved.
//

import UIKit

class GnomeListEntityManager: GnomeListEntityManagerInputProtocol{
    var requestHandler: GnomeListEntityManagerOutputProtocol?
    
    func requestContactDirectory() {
        let url = URL(string: "https://raw.githubusercontent.com/rrafols/mobile_test/master/data.json")
        URLSession.shared.dataTask(with:url!, completionHandler: {(data, response, error) in
            guard let data = data, error == nil else {
                self.requestHandler?.error()
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let contactDirectory = try decoder.decode(ContactDirectory.self, from: data)
                
//                for city in contactDirectory.cities{
//                    print(city.cityName)
//                    for gnome in city.citizens{
//                        print("  " + gnome.name)
//                    }
//                }
                
                self.requestHandler?.dataRetrieved(contactDirectory)
                
            } catch let error as NSError {
                print(error)
            }
        }).resume()
    }
    
    
}
