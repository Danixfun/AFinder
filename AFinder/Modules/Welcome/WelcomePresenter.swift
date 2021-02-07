//
//  WelcomePresenter.swift
//  AFinder
//
//  Created by Daniel Tejeda on 05/02/21.
//  
//

import Foundation

class WelcomePresenter  {
    
    // MARK: Properties
    weak var view: WelcomeViewProtocol?
    var interactor: WelcomeInteractorInputProtocol?
    var wireFrame: WelcomeWireFrameProtocol?
    
}

extension WelcomePresenter: WelcomePresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
        self.view?.setUpLabels()
        self.view?.setUpBackground()
        self.view?.setUpButtons()
        self.view?.setUpAnimation()
    }
    
    func openOnboardingAction(){
        self.wireFrame?.openOnboardingAction(from: self.view!)
    }
}

extension WelcomePresenter: WelcomeInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
