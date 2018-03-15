//
//  GnomeListPresenter.swift
//  GnomeContacts
//
//  Created by Joan Roig on 3/3/18.
//  Copyright © 2018 Joan Roig. All rights reserved.
//
import UIKit
class GnomeListPresenter: GnomeListPresenterProtocol {
    
    weak var view: GnomeListViewProtocol?
    var interactor: GnomeListInteractorInputProtocol?
    var router: GnomeListRouterProtocol?

    func viewDidLoad() {
        view?.showLoading()
        interactor?.retrieveContactDirectory()
    }
    
    func showGnomeDetail(gnomeData gnome: Gnome) {
        router?.presentGnomeDetailScreen(from: view!, gnome: gnome)
    }
    
}

extension GnomeListPresenter: GnomeListInteractorOutputProtocol{
    func presentData(_ contactDirectory: ContactDirectory) {
        view?.hideLoading()
        view?.showContactDirectory(data: contactDirectory)
    }
    
    func error() {
        view?.connectionError()
    }
}
