//
//  GnomeDetailProtocols.swift
//  GnomeContacts
//
//  Created by Joan Roig on 5/3/18.
//  Copyright © 2018 Joan Roig. All rights reserved.
//

import UIKit

protocol GnomeDetailRouterProtocol: class {
    static func createGnomeDetail(gnomeData gnome: Gnome) -> UIViewController
}

protocol GnomeDetailPresenterProtocol: class {
    var view: GnomeDetailViewProtocol? { get set }
    var gnome: Gnome? { get set }
    
    // View -> Presenter
    func viewDidLoad()
}

protocol GnomeDetailViewProtocol: class {
    var presenter: GnomeDetailPresenterProtocol? { get set }
    
    // Presenter -> View
    func showGnomeDetail(gnome: Gnome)
}




