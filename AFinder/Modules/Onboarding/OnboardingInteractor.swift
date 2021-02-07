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
    
    // MARK: Functions
    func setUpNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.nextStep(n:)), name: NotiNames.nextOnboardingStep, object: nil)
    }
    
    @objc func nextStep(n: Notification){
        if let newIndex:Int = (n.userInfo?["goto"] as? OnboardingSteps)?.id {
            self.presenter?.updateStep(index: newIndex)
        }
    }

}

extension OnboardingInteractor: OnboardingRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
