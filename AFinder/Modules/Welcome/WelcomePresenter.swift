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
<<<<<<< HEAD
        self.view?.setUpBackground()
=======
        self.view?.setUpLabels()
        self.view?.setUpButtons()
        self.interactor?.setUpNotifications()
    }
    
    func viewDidLayoutSubviews() {
        self.view?.setUpAnimation()
    }
    
    func openOnboardingAction() {
        self.wireFrame?.openOnboardingAction(from: self.view!)
>>>>>>> develop
    }
}

extension WelcomePresenter: WelcomeInteractorOutputProtocol {
    // TODO: implement interactor output methods
    func openMapView() {
        self.wireFrame?.openMapView(from: self.view!)
    }
}
