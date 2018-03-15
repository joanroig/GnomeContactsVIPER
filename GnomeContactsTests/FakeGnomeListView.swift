//
//  FakeGnomeListView.swift
//  GnomeContactsTests
//
//  Created by Joan Roig on 7/3/18.
//  Copyright © 2018 Joan Roig. All rights reserved.
//

import Foundation
@testable import GnomeContacts

class FakeGnomeListView: GnomeListViewProtocol {
    
    var presenter: GnomeListPresenterProtocol?
    
    var dataReceived: ContactDirectory?
    
    func viewDidLoad() {
        presenter?.viewDidLoad()
    }
    
    func showContactDirectory(data: ContactDirectory) {
        dataReceived = data
    }
    
    func connectionError() {
        
    }
    
    func showLoading() {
        
    }
    
    func hideLoading() {
        
    }
    
    
}


