//
//  OnboardingInteractor.swift
//  AFinder
//
//  Created by Daniel Tejeda on 06/02/21.
//  
//

import Foundation

class OnboardingInteractor: OnboardingInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: OnboardingInteractorOutputProtocol?
    var localDatamanager: OnboardingLocalDataManagerInputProtocol?
    var remoteDatamanager: OnboardingRemoteDataManagerInputProtocol?

}

extension OnboardingInteractor: OnboardingRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
