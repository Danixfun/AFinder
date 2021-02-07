//
//  OBStepTwoInteractor.swift
//  AFinder
//
//  Created by Daniel Tejeda on 07/02/21.
//  
//

import Foundation

class OBStepTwoInteractor: OBStepTwoInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: OBStepTwoInteractorOutputProtocol?
    var localDatamanager: OBStepTwoLocalDataManagerInputProtocol?
    var remoteDatamanager: OBStepTwoRemoteDataManagerInputProtocol?

}

extension OBStepTwoInteractor: OBStepTwoRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
