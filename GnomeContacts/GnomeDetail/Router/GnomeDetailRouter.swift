//
//  GnomeDetailRouter.swift
//  GnomeContacts
//
//  Created by Joan Roig on 5/3/18.
//  Copyright © 2018 Joan Roig. All rights reserved.
//

import UIKit

class GnomeDetailRouter : GnomeDetailRouterProtocol{
    static func createGnomeDetail(gnomeData gnome: Gnome) -> UIViewController {
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "GnomeDetailController")
        if let view = viewController as? GnomeDetailView {
            let presenter: GnomeDetailPresenterProtocol = GnomeDetailPresenter()
            
            view.presenter = presenter
            presenter.view = view
            presenter.gnome = gnome
            
            return viewController
        }
        return UIViewController()
    }

static var mainStoryboard: UIStoryboard {
    return UIStoryboard(name: "Main", bundle: Bundle.main)
}

}
