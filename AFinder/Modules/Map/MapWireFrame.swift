//
//  MapWireFrame.swift
//  AFinder
//
<<<<<<< HEAD
//  Created by Daniel Tejeda on 05/02/21.
=======
//  Created by Daniel Tejeda on 07/02/21.
>>>>>>> develop
//  
//

import Foundation
import UIKit

class MapWireFrame: MapWireFrameProtocol {
<<<<<<< HEAD

    class func createMapModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "MapView")
        if let view = navController.children.first as? MapView {
=======
    
    // MARK: Init
    class func createMapModule() -> UIViewController {
        if let view = mainStoryboard.instantiateViewController(withIdentifier: "MapView") as? MapView {
>>>>>>> develop
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
<<<<<<< HEAD
            
            return navController
=======
            return view
>>>>>>> develop
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "MapView", bundle: Bundle.main)
    }
    
<<<<<<< HEAD
=======
    // MARK: Functions
    func openDeviceSettingsAction() {
        guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
            return
        }
        if UIApplication.shared.canOpenURL(settingsUrl) {
            UIApplication.shared.open(settingsUrl, completionHandler: nil)
        }
    }
    
    func openAppSettings(from view: MapViewProtocol) {
        let appSettings = SettingsWireFrame.createSettingsModule()
        if let actualView = view as? UIViewController {
            actualView.present(appSettings, animated: true, completion: nil)
        }
    }
    
    func openList(from view:MapViewProtocol, airports: AirportResponse?) {
        let listView = ListWireFrame.createListModule(airports: airports)
        if let actualView = view as? UIViewController{
            actualView.present(listView, animated: true, completion: nil)
        }
    }
    
    
>>>>>>> develop
}
