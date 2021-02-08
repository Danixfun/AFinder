//
//  WelcomeView.swift
//  AFinder
//
//  Created by Daniel Tejeda on 05/02/21.
//  
//

import Foundation
import UIKit
import Lottie

class WelcomeView: UIViewController {
    // MARK: IBOutlet
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var sloganLabel: UILabel!
    @IBOutlet weak var startButton: AFPrimaryButton!
    @IBOutlet weak var animationContainer: UIView!
    
    // MARK: IBAction
    @IBAction func openOnboardingAction(_ sender: Any) {
        self.presenter?.openOnboardingAction()
    }
    
    // MARK: Properties
    var presenter: WelcomePresenterProtocol?
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.viewDidLoad()
<<<<<<< HEAD
=======
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.presenter?.viewDidLayoutSubviews()
>>>>>>> develop
    }
}

extension WelcomeView: WelcomeViewProtocol {
<<<<<<< HEAD
    // TODO: implement view output methods
    func setUpBackground(){
        self.view.backgroundColor = UIColor(named: "WelcomeBackgroundColor")
=======
    func setUpLabels() {
        self.titleLabel.text = "Airport Finder".localized()
        self.sloganLabel.text = "Just find it!".localized()
    }
    
    func setUpButtons() {
        self.startButton.setQuick(title: "Let's go!")
    }
    
    func setUpAnimation(){
        AnimationWrapper.setUpAnimation(in: self.animationContainer, withFile: "welcome_airplane")
>>>>>>> develop
    }
}
