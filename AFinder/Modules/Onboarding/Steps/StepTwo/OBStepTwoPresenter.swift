//
//  OBStepTwoPresenter.swift
//  AFinder
//
//  Created by Daniel Tejeda on 07/02/21.
//  
//

import Foundation
import UIKit

class OBStepTwoPresenter  {
    
    // MARK: Properties
    weak var view: OBStepTwoViewProtocol?
    var interactor: OBStepTwoInteractorInputProtocol?
    var wireFrame: OBStepTwoWireFrameProtocol?
    var once: Bool = false
}

extension OBStepTwoPresenter: OBStepTwoPresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
        self.view?.loadCurrentRange()
    }
    
    func viewDidLayoutSubviews() {
        if !once {
            once = true
            self.view?.setUpViews()
        }
    }
    
    func rangeDidChange(sender: UISlider) {
        self.interactor?.rangeDidChange(sender: sender)
    }
}

extension OBStepTwoPresenter: OBStepTwoInteractorOutputProtocol {
    func updateRangeView(km: Int, circleRadius: CGFloat) {
        self.view?.updateRangeView(km: km, circleRadius: circleRadius)
    }
}
