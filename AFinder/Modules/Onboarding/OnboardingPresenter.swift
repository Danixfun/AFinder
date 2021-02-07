//
//  OnboardingPresenter.swift
//  AFinder
//
//  Created by Daniel Tejeda on 06/02/21.
//  
//

import Foundation

class OnboardingPresenter  {
    
    // MARK: Properties
    weak var view: OnboardingViewProtocol?
    var interactor: OnboardingInteractorInputProtocol?
    var wireFrame: OnboardingWireFrameProtocol?
    
}

extension OnboardingPresenter: OnboardingPresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
        self.view?.setUpViews()
    }
    
    func viewDidLayoutSubviews() {
        self.view?.fixLayoutSubviews()
    }
}

extension OnboardingPresenter: OnboardingInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
