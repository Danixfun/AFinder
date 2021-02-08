//
//  ListView.swift
//  AFinder
//
//  Created by Daniel Tejeda on 08/02/21.
//  
//

import Foundation
import UIKit

class ListView: UIViewController {

    // MARK: Properties
    var presenter: ListPresenterProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ListView: ListViewProtocol {
    // TODO: implement view output methods
}
