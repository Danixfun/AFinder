//
//  OBStepTwoView.swift
//  AFinder
//
//  Created by Daniel Tejeda on 07/02/21.
//  
//

import Foundation
import UIKit

class OBStepTwoView: UIViewController, OnboardingStepProtocol {

    // MARK: Properties
    var presenter: OBStepTwoPresenterProtocol?
    var index: Int = 0
    
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension OBStepTwoView: OBStepTwoViewProtocol {
    // TODO: implement view output methods
}
