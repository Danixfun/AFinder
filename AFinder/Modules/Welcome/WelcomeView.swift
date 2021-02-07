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
    @IBOutlet weak var skipButton: AFSecondaryButton!
    @IBOutlet weak var animationContainer: UIView!
    
    // MARK: Properties
    var presenter: WelcomePresenterProtocol?
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.viewDidLoad()
    }
}

extension WelcomeView: WelcomeViewProtocol {
    func setUpBackground() {
        
    }
    
    func setUpLabels() {
        self.titleLabel.text = "Airport Finder".localized()
        self.sloganLabel.text = "Just find it!".localized()
    }
    
    func setUpButtons() {
        self.startButton.setQuick(title: "How it works?")
        self.skipButton.setQuick(title: "Skip")
    }
    
    func setUpAnimation(){
        let animationJSONName = "welcome_airplane"
        let animation = Animation.named(animationJSONName)
        let animationView = AnimationView(animation: animation)
        let animationViewSide:CGFloat = animationContainer.bounds.size.width
        
        animationContainer.addSubview(animationView)
        animationView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            animationView.centerXAnchor.constraint(equalTo: animationContainer.centerXAnchor),
            animationView.centerYAnchor.constraint(equalTo: animationContainer.centerYAnchor),
            animationView.heightAnchor.constraint(equalToConstant: animationViewSide),
            animationView.widthAnchor.constraint(equalToConstant: animationViewSide)
        ])
        animationView.loopMode = .repeat(.infinity)
        animationView.play()
    }
}
