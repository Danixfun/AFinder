//
//  MapPresenter.swift
//  AFinder
//
//  Created by Daniel Tejeda on 07/02/21.
//  
//

import Foundation
import CoreLocation

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
    }
    
    func findAirports(location: CLLocation){
        self.interactor?.findAirports(location: location)
    }
}

extension MapPresenter: MapInteractorOutputProtocol {
    func foundAirports(airports: AirportResponse?, error: AirportFetchError) {
        self.view?.foundAirports(airports: airports, error: error)
    }
}
