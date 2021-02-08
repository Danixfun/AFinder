//
//  MapProtocols.swift
//  AFinder
//
//  Created by Daniel Tejeda on 07/02/21.
//  
//

import Foundation
import UIKit

protocol MapViewProtocol: class {
    // PRESENTER -> VIEW
    var presenter: MapPresenterProtocol? { get set }
    
    func setUpMap()
}

protocol MapWireFrameProtocol: class {
    // PRESENTER -> WIREFRAME
    static func createMapModule() -> UIViewController
}

protocol MapPresenterProtocol: class {
    // VIEW -> PRESENTER
    var view: MapViewProtocol? { get set }
    var interactor: MapInteractorInputProtocol? { get set }
    var wireFrame: MapWireFrameProtocol? { get set }
    
    func viewDidLoad()
}

protocol MapInteractorOutputProtocol: class {
    // INTERACTOR -> PRESENTER
    func foundAirports()
}

protocol MapInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: MapInteractorOutputProtocol? { get set }
    var localDatamanager: MapLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: MapRemoteDataManagerInputProtocol? { get set }
    
    func findAirports()
}

protocol MapRemoteDataManagerInputProtocol: class {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: MapRemoteDataManagerOutputProtocol? { get set }
    
    func findAirports()
}

protocol MapRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
    func foundAirports()
}

protocol MapLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
    var localRequestHandler: MapLocalDataManagerOutputProtocol? { get set }
}

protocol MapLocalDataManagerOutputProtocol: class {
    // LOCALDATAMANAGER -> INTERACTOR
}
