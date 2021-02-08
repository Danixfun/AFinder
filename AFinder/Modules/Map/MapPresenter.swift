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
        self.view?.setUpNoGPSContainer()
        self.view?.setUpNoWiFiContainer()
        self.interactor?.getCurrentRange()
    }
    
    func findAirports(location: CLLocation){
        self.interactor?.findAirports(location: location)
    }
    
    func deniedMap() {
        self.view?.deniedMap()
    }
    
    func grantMap() {
        self.view?.grantMap()
    }
    
    func openDeviceSettingsAction() {
        self.wireFrame?.openDeviceSettingsAction()
    }
    
    func refreshAction() {
        self.interactor?.getCurrentRange()
    }
    
    func listButtonAction(airports: AirportResponse?) {
        self.wireFrame?.openList(from: self.view!, airports: airports)
    }
    
    func openAppSettings() {
        self.wireFrame?.openAppSettings(from: self.view!)
    }
    
}

extension MapPresenter: MapInteractorOutputProtocol {
    func foundAirports(airports: AirportResponse) {
        self.view?.grantMap()
        self.view?.foundAirports(airports: airports)
    }
    
    func emptyAirports() {
        self.view?.grantMap()
        self.view?.emptyAirports()
    }
    
    func errorLoadingAirports() {
        self.view?.errorLoadingAirports()
    }
    
    func currentRange(range: Int) {
        self.view?.centerMapWith(range: range)
    }
    
}
