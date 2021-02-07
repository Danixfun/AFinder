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

    // MARK: Properties
    var presenter: WelcomePresenterProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.viewDidLoad()
    }
}

extension WelcomeView: WelcomeViewProtocol {
    // TODO: implement view output methods
    func setUpBackground(){
        self.view.backgroundColor = UIColor(named: "WelcomeBackgroundColor")
    }
}
