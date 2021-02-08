//
//  MapPresenter.swift
//  AFinder
//
//  Created by Daniel Tejeda on 07/02/21.
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
        self.view?.setUpMap()
        self.interactor?.findAirports()
    }
}

extension MapPresenter: MapInteractorOutputProtocol {
    func foundAirports() {
        
    }
}
