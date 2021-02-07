//
//  OBStepOneInteractor.swift
//  AFinder
//
//  Created by Daniel Tejeda on 07/02/21.
//  
//

import Foundation

class OBStepOneInteractor: OBStepOneInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: OBStepOneInteractorOutputProtocol?
    var localDatamanager: OBStepOneLocalDataManagerInputProtocol?
    var remoteDatamanager: OBStepOneRemoteDataManagerInputProtocol?

}

extension OBStepOneInteractor: OBStepOneRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
