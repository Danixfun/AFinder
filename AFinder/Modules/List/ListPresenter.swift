//
//  ListPresenter.swift
//  AFinder
//
//  Created by Daniel Tejeda on 08/02/21.
//  
//

import Foundation

class ListPresenter  {
    
    // MARK: Properties
    weak var view: ListViewProtocol?
    var interactor: ListInteractorInputProtocol?
    var wireFrame: ListWireFrameProtocol?
    
}

extension ListPresenter: ListPresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
        self.view?.setUpButtons()
        self.view?.setUpNavigationBarTitle()
        self.view?.setUpTableView()
    }

    func backButtonAction() {
        self.wireFrame?.dismiss(from: self.view!)
    }
}

extension ListPresenter: ListInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
