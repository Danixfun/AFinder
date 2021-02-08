//
//  WelcomeProtocols.swift
//  AFinder
//
//  Created by Daniel Tejeda on 05/02/21.
//  
//

import Foundation
import UIKit

protocol WelcomeViewProtocol: class {
    // PRESENTER -> VIEW
    var presenter: WelcomePresenterProtocol? { get set }
<<<<<<< HEAD
    
    func setUpBackground()
=======
    func setUpLabels()
    func setUpButtons()
    func setUpAnimation()
>>>>>>> develop
}

protocol WelcomeWireFrameProtocol: class {
    // PRESENTER -> WIREFRAME
    static func createWelcomeModule() -> UIViewController
    func openOnboardingAction(from view: WelcomeViewProtocol)
    func openMapView(from view: WelcomeViewProtocol)
}

protocol WelcomePresenterProtocol: class {
    // VIEW -> PRESENTER
    var view: WelcomeViewProtocol? { get set }
    var interactor: WelcomeInteractorInputProtocol? { get set }
    var wireFrame: WelcomeWireFrameProtocol? { get set }
    
    func viewDidLoad()
    func viewDidLayoutSubviews()
    func openOnboardingAction()
}

protocol WelcomeInteractorOutputProtocol: class {
    // INTERACTOR -> PRESENTER
    func openMapView()
}

protocol WelcomeInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: WelcomeInteractorOutputProtocol? { get set }
    var localDatamanager: WelcomeLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: WelcomeRemoteDataManagerInputProtocol? { get set }
    
    func setUpNotifications()
}

protocol WelcomeRemoteDataManagerInputProtocol: class {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: WelcomeRemoteDataManagerOutputProtocol? { get set }
}

protocol WelcomeRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
}

protocol WelcomeLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
    var localRequestHandler: WelcomeLocalDataManagerOutputProtocol? { get set }
}

protocol WelcomeLocalDataManagerOutputProtocol: class {
    // LOCALDATAMANAGER -> INTERACTOR
}
