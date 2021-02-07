//
//  OBStepThreeView.swift
//  AFinder
//
//  Created by Daniel Tejeda on 07/02/21.
//  
//

import Foundation
import UIKit

class OBStepThreeView: UIViewController, OnboardingStepProtocol {

    // MARK: Properties
    var presenter: OBStepThreePresenterProtocol?
    var index: Int = 0
    
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension OBStepThreeView: OBStepThreeViewProtocol {
    // TODO: implement view output methods
}
