//
//  GnomeDetailPresenter.swift
//  GnomeContacts
//
//  Created by Joan Roig on 5/3/18.
//  Copyright © 2018 Joan Roig. All rights reserved.
//

class GnomeDetailPresenter: GnomeDetailPresenterProtocol{
    
    var view: GnomeDetailViewProtocol?
    var gnome: Gnome?
    
    func viewDidLoad() {
        view?.showGnomeDetail(gnome: gnome!)
    }
    
}
