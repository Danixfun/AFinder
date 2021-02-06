//
//  WelcomeInteractor.swift
//  AFinder
//
//  Created by Daniel Tejeda on 05/02/21.
//  
//

import Foundation

class WelcomeInteractor: WelcomeInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: WelcomeInteractorOutputProtocol?
    var localDatamanager: WelcomeLocalDataManagerInputProtocol?
    var remoteDatamanager: WelcomeRemoteDataManagerInputProtocol?

}

extension WelcomeInteractor: WelcomeRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
