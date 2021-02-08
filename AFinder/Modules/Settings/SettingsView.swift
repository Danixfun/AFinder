//
//  SettingsView.swift
//  AFinder
//
//  Created by Daniel Tejeda on 08/02/21.
//  
//

import Foundation
import UIKit

class SettingsView: UIViewController {

    // MARK: Properties
    var presenter: SettingsPresenterProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension SettingsView: SettingsViewProtocol {
    // TODO: implement view output methods
}
