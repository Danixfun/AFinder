//
//  AirportPin.swift
//  AFinder
//
//  Created by Daniel Tejeda on 07/02/21.
//

import Foundation
import MapKit

class AirportPin: NSObject, MKAnnotation {
    var title: String?
    var coordinate: CLLocationCoordinate2D

    init(title: String?, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.coordinate = coordinate
        super.init()
    }
}
