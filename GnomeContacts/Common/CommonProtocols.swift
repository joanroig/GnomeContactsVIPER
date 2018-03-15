//
//  CommonProtocols.swift
//  GnomeContacts
//
//  Created by Joan Roig on 6/3/18.
//  Copyright © 2018 Joan Roig. All rights reserved.
//

import UIKit

// Protocol for classes retrieving data from the Internet
protocol UsesInternetProtocol: class {
    func connectionError()
    func showLoading()
    func hideLoading()
}
