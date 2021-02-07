//
//  OBStepTwoProtocols.swift
//  AFinder
//
//  Created by Daniel Tejeda on 07/02/21.
//  
//

import Foundation
import UIKit

protocol OBStepTwoViewProtocol: class {
    // PRESENTER -> VIEW
    var presenter: OBStepTwoPresenterProtocol? { get set }
}

protocol OBStepTwoWireFrameProtocol: class {
    // PRESENTER -> WIREFRAME
    static func createOBStepTwoModule(step: OnboardingSteps) -> UIViewController
}

protocol OBStepTwoPresenterProtocol: class {
    // VIEW -> PRESENTER
    var view: OBStepTwoViewProtocol? { get set }
    var interactor: OBStepTwoInteractorInputProtocol? { get set }
    var wireFrame: OBStepTwoWireFrameProtocol? { get set }
    
    func viewDidLoad()
}

protocol OBStepTwoInteractorOutputProtocol: class {
// INTERACTOR -> PRESENTER
}

protocol OBStepTwoInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: OBStepTwoInteractorOutputProtocol? { get set }
    var localDatamanager: OBStepTwoLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: OBStepTwoRemoteDataManagerInputProtocol? { get set }
}

protocol OBStepTwoRemoteDataManagerInputProtocol: class {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: OBStepTwoRemoteDataManagerOutputProtocol? { get set }
}

protocol OBStepTwoRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
}

protocol OBStepTwoLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
    var localRequestHandler: OBStepTwoLocalDataManagerOutputProtocol? { get set }
}

protocol OBStepTwoLocalDataManagerOutputProtocol: class {
    // LOCALDATAMANAGER -> INTERACTOR
}
