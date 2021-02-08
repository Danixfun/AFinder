//
//  MapView.swift
//  AFinder
//
//  Created by Daniel Tejeda on 07/02/21.
//  
//

import Foundation
import UIKit
import MapKit

class MapView: UIViewController {

    // MARK: Properties
    var presenter: MapPresenterProtocol?
    let initialLocation = CLLocation(latitude: 21.282778, longitude: -157.829444)
    var locationManager = CLLocationManager()
    
    // MARK: IBOutlet
    @IBOutlet weak var mapContainer: MKMapView!
    
    
    // MARK: IBAction
    
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.viewDidLoad()
    }
}

extension MapView: MapViewProtocol {
    // TODO: implement view output methods
    func setUpMap() {
        locationManager.delegate = self
        mapContainer.centerToLocation(locationManager.location!)
        mapContainer.delegate = self
        // Show artwork on map
        let artwork = Artwork(
          title: "King David Kalakaua",
          locationName: "Waikiki Gateway Park",
          discipline: "Sculpture",
          coordinate: CLLocationCoordinate2D(latitude: 21.283921, longitude: -157.831661))
        mapContainer.addAnnotation(artwork)
    }
}





extension MapView: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last{
            mapContainer.centerToLocation(location)
        }
    }
}

extension MapView: MKMapViewDelegate {
    
    // 1
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        // 2
        guard let annotation = annotation as? Artwork else {
            return nil
        }
        // 3
        let identifier = "artwork"
        var view: MKMarkerAnnotationView
        // 4
        if let dequeuedView = mapView.dequeueReusableAnnotationView(
            withIdentifier: identifier) as? MKMarkerAnnotationView {
            dequeuedView.annotation = annotation
            view = dequeuedView
        }
        else {
            // 5
            view = MKMarkerAnnotationView(
            annotation: annotation,
            reuseIdentifier: identifier)
            view.canShowCallout = true
            view.calloutOffset = CGPoint(x: -5, y: 5)
            view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        return view
    }

    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let artwork = view.annotation as? Artwork else {
            return
        }

        print(artwork.title!)
    }
    
}


/// regionRadius is on meters
private extension MKMapView {
  func centerToLocation(_ location: CLLocation, regionRadius: CLLocationDistance = 1000) {
    let coordinateRegion = MKCoordinateRegion(
      center: location.coordinate,
      latitudinalMeters: regionRadius,
      longitudinalMeters: regionRadius)
    
    setRegion(coordinateRegion, animated: true)
  }
}


class Artwork: NSObject, MKAnnotation {
  let title: String?
  let locationName: String?
  let discipline: String?
  let coordinate: CLLocationCoordinate2D

  init(
    title: String?,
    locationName: String?,
    discipline: String?,
    coordinate: CLLocationCoordinate2D
  ) {
    self.title = title
    self.locationName = locationName
    self.discipline = discipline
    self.coordinate = coordinate

    super.init()
  }

  var subtitle: String? {
    return locationName
  }
}
