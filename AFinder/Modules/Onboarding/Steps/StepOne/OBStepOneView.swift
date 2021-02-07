//
//  OBStepOneView.swift
//  AFinder
//
//  Created by Daniel Tejeda on 07/02/21.
//  
//

import Foundation
import UIKit
import Lottie

class OBStepOneView: UIViewController, OnboardingStepProtocol {

    // MARK: IBOutlet
    @IBOutlet weak var animationContainer: UIView!
    
    // MARK: IBAction
    @IBAction func gpsPermissionAction(_ sender: Any) {
    }
    
    // MARK: Properties
    var presenter: OBStepOnePresenterProtocol?
    var index: Int = 0

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.viewDidLoad()
    }
}

extension OBStepOneView: OBStepOneViewProtocol {
    // TODO: implement view output methods
    func setUpAnimation() {
        AnimationWrapper.setUpAnimation(in: self.animationContainer, withFile: "gps_permission")
    }
}
