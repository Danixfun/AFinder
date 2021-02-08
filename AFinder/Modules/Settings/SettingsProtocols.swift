//
//  SettingsProtocols.swift
//  AFinder
//
//  Created by Daniel Tejeda on 08/02/21.
//  
//

import Foundation
import UIKit

protocol SettingsViewProtocol: class {
    // PRESENTER -> VIEW
    var presenter: SettingsPresenterProtocol? { get set }
}

protocol SettingsWireFrameProtocol: class {
    // PRESENTER -> WIREFRAME
    static func createSettingsModule() -> UIViewController
}

protocol SettingsPresenterProtocol: class {
    // VIEW -> PRESENTER
    var view: SettingsViewProtocol? { get set }
    var interactor: SettingsInteractorInputProtocol? { get set }
    var wireFrame: SettingsWireFrameProtocol? { get set }
    
    func viewDidLoad()
}

protocol SettingsInteractorOutputProtocol: class {
// INTERACTOR -> PRESENTER
}

protocol SettingsInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: SettingsInteractorOutputProtocol? { get set }
    var localDatamanager: SettingsLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: SettingsRemoteDataManagerInputProtocol? { get set }
}

protocol SettingsRemoteDataManagerInputProtocol: class {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: SettingsRemoteDataManagerOutputProtocol? { get set }
}

protocol SettingsRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
}

protocol SettingsLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
    var localRequestHandler: SettingsLocalDataManagerOutputProtocol? { get set }
}

protocol SettingsLocalDataManagerOutputProtocol: class {
    // LOCALDATAMANAGER -> INTERACTOR
}
