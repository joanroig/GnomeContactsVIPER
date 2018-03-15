//
//  FakeGnomeListRouter.swift
//  GnomeContactsTests
//
//  Created by Joan Roig on 7/3/18.
//  Copyright © 2018 Joan Roig. All rights reserved.
//

import Foundation
import UIKit
@testable import GnomeContacts

class FakeGnomeListRouter : GnomeListRouter{
    
    var detailRoutingSuccess = false
    
    override
    func presentGnomeDetailScreen(from view: GnomeListViewProtocol, gnome: Gnome) {
        detailRoutingSuccess = true
    }
}

