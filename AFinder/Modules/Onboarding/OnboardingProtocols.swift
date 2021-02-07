//
//  OnboardingProtocols.swift
//  AFinder
//
//  Created by Daniel Tejeda on 06/02/21.
//  
//

import Foundation
import UIKit

protocol OnboardingViewProtocol: class {
    // PRESENTER -> VIEW
    var presenter: OnboardingPresenterProtocol? { get set }
    func setUpViews()
    func fixLayoutSubviews()
}

protocol OnboardingWireFrameProtocol: class {
    // PRESENTER -> WIREFRAME
    static func createOnboardingModule() -> UIViewController
}

protocol OnboardingPresenterProtocol: class {
    // VIEW -> PRESENTER
    var view: OnboardingViewProtocol? { get set }
    var interactor: OnboardingInteractorInputProtocol? { get set }
    var wireFrame: OnboardingWireFrameProtocol? { get set }
    
    func viewDidLoad()
    func viewDidLayoutSubviews()
}

protocol OnboardingInteractorOutputProtocol: class {
// INTERACTOR -> PRESENTER
}

protocol OnboardingInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: OnboardingInteractorOutputProtocol? { get set }
    var localDatamanager: OnboardingLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: OnboardingRemoteDataManagerInputProtocol? { get set }
}

protocol OnboardingRemoteDataManagerInputProtocol: class {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: OnboardingRemoteDataManagerOutputProtocol? { get set }
}

protocol OnboardingRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
}

protocol OnboardingLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
    var localRequestHandler: OnboardingLocalDataManagerOutputProtocol? { get set }
}

protocol OnboardingLocalDataManagerOutputProtocol: class {
    // LOCALDATAMANAGER -> INTERACTOR
}