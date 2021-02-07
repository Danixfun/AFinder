//
//  MapPresenter.swift
//  AFinder
//
//  Created by Daniel Tejeda on 05/02/21.
//  
//

import Foundation

class MapPresenter  {
    
    // MARK: Properties
    weak var view: MapViewProtocol?
    var interactor: MapInteractorInputProtocol?
    var wireFrame: MapWireFrameProtocol?
    
}

extension MapPresenter: MapPresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
    }
}

extension MapPresenter: MapInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
