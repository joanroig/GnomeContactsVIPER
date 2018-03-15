//
//  GnomeListRouter.swift
//  GnomeContacts
//
//  Created by Joan Roig on 3/3/18.
//  Copyright © 2018 Joan Roig. All rights reserved.
//

import UIKit

class GnomeListRouter : GnomeListRouterProtocol{
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    class func createGnomeList() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "MainNavigationController")
        if let view : UsesInternetProtocol & GnomeListViewProtocol = navController.childViewControllers.first as? GnomeListView {
            
            let presenter: GnomeListPresenterProtocol & GnomeListInteractorOutputProtocol = GnomeListPresenter()
            let interactor: GnomeListInteractorInputProtocol & GnomeListEntityManagerOutputProtocol = GnomeListInteractor()
            let entityManager: GnomeListEntityManagerInputProtocol = GnomeListEntityManager()
            let router: GnomeListRouterProtocol = GnomeListRouter()
            
            view.presenter = presenter
            presenter.view = view
            presenter.router = router
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.entityManager = entityManager
            entityManager.requestHandler = interactor
            
            return navController
        }
        return UIViewController()
    }
    
    func presentGnomeDetailScreen(from view: GnomeListViewProtocol, gnome: Gnome) {
        let postDetailViewController = GnomeDetailRouter.createGnomeDetail(gnomeData: gnome)
        
        if let sourceView = view as? UIViewController {
            sourceView.navigationController?.pushViewController(postDetailViewController, animated: true)
        }
    }
}





