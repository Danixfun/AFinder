//
//  SettingsWireFrame.swift
//  AFinder
//
//  Created by Daniel Tejeda on 08/02/21.
//  
//

import Foundation
import UIKit

class SettingsWireFrame: SettingsWireFrameProtocol {

    // MARK: Init
    class func createSettingsModule() -> UIViewController {
        if let view = mainStoryboard.instantiateViewController(withIdentifier: "SettingsView") as? SettingsView {
            let presenter: SettingsPresenterProtocol & SettingsInteractorOutputProtocol = SettingsPresenter()
            let interactor: SettingsInteractorInputProtocol & SettingsRemoteDataManagerOutputProtocol = SettingsInteractor()
            let localDataManager: SettingsLocalDataManagerInputProtocol = SettingsLocalDataManager()
            let remoteDataManager: SettingsRemoteDataManagerInputProtocol = SettingsRemoteDataManager()
            let wireFrame: SettingsWireFrameProtocol = SettingsWireFrame()
            
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
        return UIStoryboard(name: "SettingsView", bundle: Bundle.main)
    }
    
    
    // MARK: Functions
    
}
