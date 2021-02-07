//
//  OBStepOnePresenter.swift
//  AFinder
//
//  Created by Daniel Tejeda on 07/02/21.
//  
//

import Foundation

class OBStepOnePresenter  {
    
    // MARK: Properties
    weak var view: OBStepOneViewProtocol?
    var interactor: OBStepOneInteractorInputProtocol?
    var wireFrame: OBStepOneWireFrameProtocol?
    
}

extension OBStepOnePresenter: OBStepOnePresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
        self.view?.setUpAnimation()
    }
}

extension OBStepOnePresenter: OBStepOneInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
