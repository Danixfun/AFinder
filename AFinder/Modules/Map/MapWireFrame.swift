//
//  MapWireFrame.swift
//  AFinder
//
//  Created by Daniel Tejeda on 05/02/21.
//  
//

import Foundation
import UIKit

class MapWireFrame: MapWireFrameProtocol {

    class func createMapModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "MapView")
        if let view = navController.children.first as? MapView {
            let presenter: MapPresenterProtocol & MapInteractorOutputProtocol = MapPresenter()
            let interactor: MapInteractorInputProtocol & MapRemoteDataManagerOutputProtocol = MapInteractor()
            let localDataManager: MapLocalDataManagerInputProtocol = MapLocalDataManager()
            let remoteDataManager: MapRemoteDataManagerInputProtocol = MapRemoteDataManager()
            let wireFrame: MapWireFrameProtocol = MapWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            return navController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "MapView", bundle: Bundle.main)
    }
    
}
