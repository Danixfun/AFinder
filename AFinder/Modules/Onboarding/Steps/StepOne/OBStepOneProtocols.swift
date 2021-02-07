//
//  OBStepOneProtocols.swift
//  AFinder
//
//  Created by Daniel Tejeda on 07/02/21.
//  
//

import Foundation
import UIKit

protocol OBStepOneViewProtocol: class {
    // PRESENTER -> VIEW
    var presenter: OBStepOnePresenterProtocol? { get set }
    func setUpAnimation()
}

protocol OBStepOneWireFrameProtocol: class {
    // PRESENTER -> WIREFRAME
    static func createOBStepOneModule(step: OnboardingSteps) -> UIViewController
}

protocol OBStepOnePresenterProtocol: class {
    // VIEW -> PRESENTER
    var view: OBStepOneViewProtocol? { get set }
    var interactor: OBStepOneInteractorInputProtocol? { get set }
    var wireFrame: OBStepOneWireFrameProtocol? { get set }
    
    func viewDidLoad()
}

protocol OBStepOneInteractorOutputProtocol: class {
// INTERACTOR -> PRESENTER
}

protocol OBStepOneInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: OBStepOneInteractorOutputProtocol? { get set }
    var localDatamanager: OBStepOneLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: OBStepOneRemoteDataManagerInputProtocol? { get set }
}

protocol OBStepOneRemoteDataManagerInputProtocol: class {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: OBStepOneRemoteDataManagerOutputProtocol? { get set }
}

protocol OBStepOneRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
}

protocol OBStepOneLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
    var localRequestHandler: OBStepOneLocalDataManagerOutputProtocol? { get set }
}

protocol OBStepOneLocalDataManagerOutputProtocol: class {
    // LOCALDATAMANAGER -> INTERACTOR
}
