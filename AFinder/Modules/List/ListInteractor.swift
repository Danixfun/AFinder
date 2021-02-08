//
//  ListInteractor.swift
//  AFinder
//
//  Created by Daniel Tejeda on 08/02/21.
//  
//

import Foundation

class ListInteractor: ListInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: ListInteractorOutputProtocol?
    var localDatamanager: ListLocalDataManagerInputProtocol?
    var remoteDatamanager: ListRemoteDataManagerInputProtocol?

}

extension ListInteractor: ListRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
