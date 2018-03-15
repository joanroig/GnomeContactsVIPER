//
//  FakeGnomeListEntityManager.swift
//  GnomeContactsTests
//
//  Created by Joan Roig on 7/3/18.
//  Copyright © 2018 Joan Roig. All rights reserved.
//

import Foundation
@testable import GnomeContacts

class FakeGnomeListEntityManager: GnomeListEntityManager {
    
    override
    func requestContactDirectory() {
        
        if let path = Bundle.main.path(forResource: "TestData", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let decoder = JSONDecoder()
                let contactDirectory = try decoder.decode(ContactDirectory.self, from: data)
                self.requestHandler?.dataRetrieved(contactDirectory)
            } catch {
                print(error)
            }
        }
    }
}

