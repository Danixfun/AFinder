//
//  MapView.swift
//  AFinder
//
//  Created by Daniel Tejeda on 07/02/21.
//  
//

import Foundation
import UIKit

class MapView: UIViewController {

    // MARK: Properties
    var presenter: MapPresenterProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension MapView: MapViewProtocol {
    // TODO: implement view output methods
}
