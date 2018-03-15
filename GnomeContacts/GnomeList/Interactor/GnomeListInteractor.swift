//
//  GnomeListInteractor.swift
//  GnomeContacts
//
//  Created by Joan Roig on 3/3/18.
//  Copyright © 2018 Joan Roig. All rights reserved.
//

import UIKit

class GnomeListInteractor: GnomeListInteractorInputProtocol {
    weak var presenter: GnomeListInteractorOutputProtocol?
    var entityManager: GnomeListEntityManagerInputProtocol?

    func retrieveContactDirectory(){
        entityManager?.requestContactDirectory()
    }
}
extension GnomeListInteractor: GnomeListEntityManagerOutputProtocol {
    
    func dataRetrieved(_ contactDirectory: ContactDirectory) {
        presenter?.presentData(contactDirectory)
    }
    
    func error() {
        presenter?.error()
    }
    
}
