//
//  WelcomeView.swift
//  AFinder
//
//  Created by Daniel Tejeda on 05/02/21.
//  
//

import Foundation
import UIKit

class WelcomeView: UIViewController {
    // MARK: IBOutlet
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var sloganLabel: UILabel!
    @IBOutlet weak var startButton: AFPrimaryButton!
    
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
        self.startButton.setQuick(title: "Let's go")
    }
}
