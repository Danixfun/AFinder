//
//  WelcomeWireFrame.swift
//  AFinder
//
//  Created by Daniel Tejeda on 05/02/21.
//  
//

import Foundation
import UIKit

class WelcomeWireFrame: WelcomeWireFrameProtocol {

    class func createWelcomeModule() -> UIViewController {
        if let view = mainStoryboard.instantiateViewController(withIdentifier: "WelcomeView") as? WelcomeView {
        
            let presenter: WelcomePresenterProtocol & WelcomeInteractorOutputProtocol = WelcomePresenter()
            let interactor: WelcomeInteractorInputProtocol & WelcomeRemoteDataManagerOutputProtocol = WelcomeInteractor()
            let localDataManager: WelcomeLocalDataManagerInputProtocol = WelcomeLocalDataManager()
            let remoteDataManager: WelcomeRemoteDataManagerInputProtocol = WelcomeRemoteDataManager()
            let wireFrame: WelcomeWireFrameProtocol = WelcomeWireFrame()
            
            view.presenter = presenter
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
        return UIStoryboard(name: "WelcomeView", bundle: Bundle.main)
    }
    
}
