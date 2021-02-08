//
//  MapInteractor.swift
//  AFinder
//
//  Created by Daniel Tejeda on 07/02/21.
//  
//

import Foundation
import CoreLocation

class MapInteractor: MapInteractorInputProtocol {
    // MARK: Properties
    weak var presenter: MapInteractorOutputProtocol?
    var localDatamanager: MapLocalDataManagerInputProtocol?
    var remoteDatamanager: MapRemoteDataManagerInputProtocol?
    
    func findAirports(location: CLLocation) {
        if let radius = UserDefaults.standard.value(forKey: UserPreferences.RangeKey) as? Int {
            self.remoteDatamanager?.findAirports(location: location, radius: radius)
        }
    }

}

extension MapInteractor: MapRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
    func foundAirports(airports: AirportResponse?, error: AirportFetchError) {
        self.presenter?.foundAirports(airports: airports, error: error)
    }
}
