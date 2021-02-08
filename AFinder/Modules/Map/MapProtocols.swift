//
//  MapProtocols.swift
//  AFinder
//
//  Created by Daniel Tejeda on 07/02/21.
//  
//

import Foundation
import UIKit
import CoreLocation

protocol MapViewProtocol: class {
    // PRESENTER -> VIEW
    var presenter: MapPresenterProtocol? { get set }
    func centerMapWith(range: Int)
    func foundAirports(airports:AirportResponse)
    func emptyAirports()
    func errorLoadingAirports()
    func deniedMap()
    func grantMap()
    func setUpNoGPSContainer()
    func setUpNoWiFiContainer()
    func setUpMap()
}

protocol MapWireFrameProtocol: class {
    // PRESENTER -> WIREFRAME
    static func createMapModule() -> UIViewController
    func openSettingsAction()
    func openList(from view:MapViewProtocol, airports: AirportResponse?)
}

protocol MapPresenterProtocol: class {
    // VIEW -> PRESENTER
    var view: MapViewProtocol? { get set }
    var interactor: MapInteractorInputProtocol? { get set }
    var wireFrame: MapWireFrameProtocol? { get set }
    
    func viewDidLoad()
    func findAirports(location: CLLocation)
    func deniedMap()
    func grantMap()
    func openSettingsAction()
    func refreshAction()
    func listButtonAction(airports: AirportResponse?)
    func radiusButtonAction()
}

protocol MapInteractorOutputProtocol: class {
    // INTERACTOR -> PRESENTER
    func foundAirports(airports:AirportResponse)
    func emptyAirports()
    func errorLoadingAirports()
    func currentRange(range: Int)
}

protocol MapInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: MapInteractorOutputProtocol? { get set }
    var localDatamanager: MapLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: MapRemoteDataManagerInputProtocol? { get set }
    
    func findAirports(location: CLLocation)
    func getCurrentRange()
}

protocol MapRemoteDataManagerInputProtocol: class {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: MapRemoteDataManagerOutputProtocol? { get set }
    
    func findAirports(location: CLLocation, radius: Int)
}

protocol MapRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
    func foundAirports(airports:AirportResponse?, error: AirportFetchError)
}

protocol MapLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
    var localRequestHandler: MapLocalDataManagerOutputProtocol? { get set }
}

protocol MapLocalDataManagerOutputProtocol: class {
    // LOCALDATAMANAGER -> INTERACTOR
}
