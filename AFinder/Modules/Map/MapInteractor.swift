//
//  MapInteractor.swift
//  AFinder
//
//  Created by Daniel Tejeda on 07/02/21.
//  
//

import Foundation

class MapInteractor: MapInteractorInputProtocol {
    // MARK: Properties
    weak var presenter: MapInteractorOutputProtocol?
    var localDatamanager: MapLocalDataManagerInputProtocol?
    var remoteDatamanager: MapRemoteDataManagerInputProtocol?
    
    func findAirports() {
        self.remoteDatamanager?.findAirports()
    }

}

extension MapInteractor: MapRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
    func foundAirports() {
        self.presenter?.foundAirports()
    }
}
