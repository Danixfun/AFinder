//
//  OBStepOneWireFrame.swift
//  AFinder
//
//  Created by Daniel Tejeda on 07/02/21.
//  
//

import Foundation
import UIKit

class OBStepOneWireFrame: OBStepOneWireFrameProtocol {

    class func createOBStepOneModule(step: OnboardingSteps) -> UIViewController {
        if let view = mainStoryboard.instantiateViewController(withIdentifier: step.storyboardId) as? OBStepOneView {
            let presenter: OBStepOnePresenterProtocol & OBStepOneInteractorOutputProtocol = OBStepOnePresenter()
            let interactor: OBStepOneInteractorInputProtocol & OBStepOneRemoteDataManagerOutputProtocol = OBStepOneInteractor()
            let localDataManager: OBStepOneLocalDataManagerInputProtocol = OBStepOneLocalDataManager()
            let remoteDataManager: OBStepOneRemoteDataManagerInputProtocol = OBStepOneRemoteDataManager()
            let wireFrame: OBStepOneWireFrameProtocol = OBStepOneWireFrame()
            
            view.presenter = presenter
            view.index = step.id
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            return view
        }
        
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "OnboardingView", bundle: Bundle.main)
    }
    
}
