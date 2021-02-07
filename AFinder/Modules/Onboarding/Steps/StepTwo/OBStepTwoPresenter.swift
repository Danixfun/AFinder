//
//  OBStepTwoPresenter.swift
//  AFinder
//
//  Created by Daniel Tejeda on 07/02/21.
//  
//

import Foundation

class OBStepTwoPresenter  {
    
    // MARK: Properties
    weak var view: OBStepTwoViewProtocol?
    var interactor: OBStepTwoInteractorInputProtocol?
    var wireFrame: OBStepTwoWireFrameProtocol?
    
}

extension OBStepTwoPresenter: OBStepTwoPresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
    }
}

extension OBStepTwoPresenter: OBStepTwoInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
