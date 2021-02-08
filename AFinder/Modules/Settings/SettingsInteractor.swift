//
//  SettingsInteractor.swift
//  AFinder
//
//  Created by Daniel Tejeda on 08/02/21.
//  
//

import Foundation

class SettingsInteractor: SettingsInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: SettingsInteractorOutputProtocol?
    var localDatamanager: SettingsLocalDataManagerInputProtocol?
    var remoteDatamanager: SettingsRemoteDataManagerInputProtocol?

}

extension SettingsInteractor: SettingsRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
