//
//  MapProtocols.swift
//  AFinder
//
<<<<<<< HEAD
//  Created by Daniel Tejeda on 05/02/21.
=======
//  Created by Daniel Tejeda on 07/02/21.
>>>>>>> develop
//  
//

import Foundation
import UIKit
<<<<<<< HEAD
=======
import CoreLocation
>>>>>>> develop

protocol MapViewProtocol: class {
    // PRESENTER -> VIEW
    var presenter: MapPresenterProtocol? { get set }
<<<<<<< HEAD
=======
    func centerMapWith(location: CLLocation, range: Int)
    func foundAirports(airports:AirportResponse)
    func emptyAirports()
    func errorLoadingAirports()
    func deniedMap()
    func grantMap()
    func setUpNoGPSContainer()
    func setUpNoWiFiContainer()
    func setUpHints()
    func setUpMap()
    func updateHintWithSearchResult(searchResultHint: String)
    func updateHintWith(hint: String)
>>>>>>> develop
}

protocol MapWireFrameProtocol: class {
    // PRESENTER -> WIREFRAME
    static func createMapModule() -> UIViewController
<<<<<<< HEAD
=======
    func openDeviceSettingsAction()
    func openAppSettings(from view: MapViewProtocol)
    func openList(from view: MapViewProtocol, airports: AirportResponse?)
>>>>>>> develop
}

protocol MapPresenterProtocol: class {
    // VIEW -> PRESENTER
    var view: MapViewProtocol? { get set }
    var interactor: MapInteractorInputProtocol? { get set }
    var wireFrame: MapWireFrameProtocol? { get set }
    
    func viewDidLoad()
<<<<<<< HEAD
}

protocol MapInteractorOutputProtocol: class {
// INTERACTOR -> PRESENTER
=======
    func findAirports(location: CLLocation)
    func deniedMap()
    func grantMap()
    func refreshAction()
    func openDeviceSettingsAction()
    func openAppSettings()
    func listButtonAction(airports: AirportResponse?)
}

protocol MapInteractorOutputProtocol: class {
    // INTERACTOR -> PRESENTER
    func foundAirports(airports:AirportResponse, hint: String)
    func emptyAirports(hint: String)
    func errorLoadingAirports()
    func locationDisabled()
    func centerMapWith(location: CLLocation, range: Int)
    func showMap()
    func hideMap()
    func updateHintWith(hint: String)
>>>>>>> develop
}

protocol MapInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: MapInteractorOutputProtocol? { get set }
    var localDatamanager: MapLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: MapRemoteDataManagerInputProtocol? { get set }
<<<<<<< HEAD
=======
    
    func findAirports(location: CLLocation)
    func setUpNotifications()
    func setUpLocationManager()
    func refreshAction()
>>>>>>> develop
}

protocol MapRemoteDataManagerInputProtocol: class {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: MapRemoteDataManagerOutputProtocol? { get set }
<<<<<<< HEAD
=======
    
    func findAirports(location: CLLocation, radius: Int)
>>>>>>> develop
}

protocol MapRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
<<<<<<< HEAD
=======
    func foundAirports(airports:AirportResponse?, error: AirportFetchError)
>>>>>>> develop
}

protocol MapLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
    var localRequestHandler: MapLocalDataManagerOutputProtocol? { get set }
<<<<<<< HEAD
=======
    
    func getRange()->Int
>>>>>>> develop
}

protocol MapLocalDataManagerOutputProtocol: class {
    // LOCALDATAMANAGER -> INTERACTOR
}
