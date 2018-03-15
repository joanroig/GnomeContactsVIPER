//
//  GnomeListProtocols.swift
//  GnomeContacts
//
//  Created by Joan Roig on 3/3/18.
//  Copyright © 2018 Joan Roig. All rights reserved.
//

import UIKit

protocol GnomeListRouterProtocol: class {
    static func createGnomeList() -> UIViewController
    // Presenter -> Router
    func presentGnomeDetailScreen(from view: GnomeListViewProtocol, gnome: Gnome)
}

protocol GnomeListPresenterProtocol: class {
    var view: GnomeListViewProtocol? {get set}
    var interactor: GnomeListInteractorInputProtocol? {get set}
    var router: GnomeListRouterProtocol? { get set }
    
    // View -> Presenter
    func viewDidLoad()
    func showGnomeDetail(gnomeData gnome: Gnome)
    
}

protocol GnomeListInteractorInputProtocol: class  {
    var presenter: GnomeListInteractorOutputProtocol? { get set }
    var entityManager: GnomeListEntityManagerInputProtocol? { get set }
    
    // Presenter -> Interactor
    func retrieveContactDirectory()
}


protocol GnomeListEntityManagerInputProtocol: class {
    var requestHandler: GnomeListEntityManagerOutputProtocol? { get set }
    
    // Interactor -> EntityManager
    func requestContactDirectory()
}

protocol GnomeListEntityManagerOutputProtocol: class {
    // EntityManager -> Interactor
    func dataRetrieved(_ data: ContactDirectory)
    func error()
}

protocol GnomeListInteractorOutputProtocol: class  {
    
    // Interactor -> Presenter
    func presentData(_ data: ContactDirectory)
    func error()
}

protocol GnomeListViewProtocol: UsesInternetProtocol {
    var presenter: GnomeListPresenterProtocol? { get set }

    // Presenter -> View
    func showContactDirectory(data: ContactDirectory)
}



