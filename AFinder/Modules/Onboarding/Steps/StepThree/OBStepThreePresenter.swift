//
//  OBStepThreePresenter.swift
//  AFinder
//
//  Created by Daniel Tejeda on 07/02/21.
//  
//

import Foundation

class OBStepThreePresenter  {
    
    // MARK: Properties
    weak var view: OBStepThreeViewProtocol?
    var interactor: OBStepThreeInteractorInputProtocol?
    var wireFrame: OBStepThreeWireFrameProtocol?
    
}

extension OBStepThreePresenter: OBStepThreePresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
    }
}

extension OBStepThreePresenter: OBStepThreeInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
