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
        self.remoteDatamanager?.findAirports(location: location, radius: rangeFromUserDefaults())
    }
    
    func getCurrentRange() {
        self.presenter?.currentRange(range: rangeFromUserDefaults())
    }
        
    private func rangeFromUserDefaults()->Int{
        if let range = UserDefaults.standard.value(forKey: UserPreferences.RangeKey) as? Int{
            return range
        }
        return RadiusRangeValues.defaultValue//Default value to prevent errors
    }

}

extension MapInteractor: MapRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
    func foundAirports(airports: AirportResponse?, error: AirportFetchError) {
        self.presenter?.foundAirports(airports: airports, error: error)
    }
}
