//
//  ListProtocols.swift
//  AFinder
//
//  Created by Daniel Tejeda on 08/02/21.
//  
//

import Foundation
import UIKit

protocol ListViewProtocol: class {
    // PRESENTER -> VIEW
    var presenter: ListPresenterProtocol? { get set }
    func setUpTableView()
}

protocol ListWireFrameProtocol: class {
    // PRESENTER -> WIREFRAME
    static func createListModule(airports: AirportResponse?) -> UIViewController
}

protocol ListPresenterProtocol: class {
    // VIEW -> PRESENTER
    var view: ListViewProtocol? { get set }
    var interactor: ListInteractorInputProtocol? { get set }
    var wireFrame: ListWireFrameProtocol? { get set }
    
    func viewDidLoad()
}

protocol ListInteractorOutputProtocol: class {
// INTERACTOR -> PRESENTER
}

protocol ListInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: ListInteractorOutputProtocol? { get set }
    var localDatamanager: ListLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: ListRemoteDataManagerInputProtocol? { get set }
}

protocol ListRemoteDataManagerInputProtocol: class {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: ListRemoteDataManagerOutputProtocol? { get set }
}

protocol ListRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
}

protocol ListLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
    var localRequestHandler: ListLocalDataManagerOutputProtocol? { get set }
}

protocol ListLocalDataManagerOutputProtocol: class {
    // LOCALDATAMANAGER -> INTERACTOR
}
