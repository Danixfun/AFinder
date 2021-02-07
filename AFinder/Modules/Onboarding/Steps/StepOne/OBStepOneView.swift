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
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var disclaimerLabel: UILabel!
    @IBOutlet weak var stepOneButton: AFPrimaryButton!
    
    // MARK: IBAction
    @IBAction func gpsPermissionAction(_ sender: Any) {
        self.presenter?.requestGPSPermission()
    }
    
    // MARK: Properties
    var presenter: OBStepOnePresenterProtocol?
    var index: Int = 0

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews(){
        super.viewDidLayoutSubviews()
        self.presenter?.viewDidLayoutSubviews()
    }
}

extension OBStepOneView: OBStepOneViewProtocol {
    // TODO: implement view output methods
    func setUpAnimation() {
        AnimationWrapper.setUpAnimation(in: self.animationContainer, withFile: "gps_permission")
    }
    
    func handleGPSPermissionReponse(success: Bool) {
        if success {
            self.presenter?.nextStep()
        }
        else {
            self.titleLabel.text = "Oh no!"
            self.messageLabel.text = "It happens, but don't worry. Go to your device's settings, then search for the AFinder app and grant it permission to use location."
            self.disclaimerLabel.isHidden = true
            self.stepOneButton.setQuick(title: "Go to settings")
            AnimationWrapper.setUpAnimation(in: self.animationContainer, withFile: "no_gps", repeatMode: 1)
        }
    }
}
