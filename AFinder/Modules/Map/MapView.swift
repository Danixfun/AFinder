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
    // Populate the map with airports
    func foundAirports(airports: AirportResponse?, error: AirportFetchError) {
        // Remove all current annotations
        mapContainer.removeAnnotations(mapContainer.annotations)
        // Add new annotations
        guard let foundAirports = airports else {
            return
        }
        
        for a in foundAirports.data {
            let newAirportPin = AirportPin(
                title: a.name,
                coordinate: CLLocationCoordinate2D(latitude: a.geoCode.latitude, longitude: a.geoCode.longitude))
            DispatchQueue.main.async {
                self.mapContainer.addAnnotation(newAirportPin)
            }
        }
    }
    
    // Center the user based on its location and fetch airports
    func centerMapWith(range: Int) {
        print("setup")
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        
        if !isLocationServiceEnabled() {
            // Show no services enabled animation and open settings button
            self.presenter?.deniedMap()
            return
        }
        mapContainer.delegate = self
        guard let currentLocation = locationManager.location else {
            return
        }
        mapContainer.centerToLocation(currentLocation, regionRadius: CLLocationDistance(range))
        self.presenter?.findAirports(location: currentLocation)
    }
    
    func deniedMap() {
        self.mapContainer.isHidden = true
    }
    
    func grantMap() {
        self.mapContainer.isHidden = false
    }
    
    
}


extension MapView: CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined, .restricted, .denied:
            self.presenter?.deniedMap()
        case .authorizedAlways, .authorizedWhenInUse:
            self.presenter?.grantMap()
        @unknown default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last{
            mapContainer.centerToLocation(location)
            
            // Set current position on map
            mapContainer.centerToLocation(location)
            
            // Everything is ready to start fetching results
            self.presenter?.findAirports(location: location)
        }
    }
}

extension MapView: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let annotation = annotation as? AirportPin else {
            return nil
        }
        let identifier = annotation.title ?? UUID().uuidString
        var view: MKMarkerAnnotationView
        if let dequeuedView = mapView.dequeueReusableAnnotationView(
            withIdentifier: identifier) as? MKMarkerAnnotationView {
            dequeuedView.annotation = annotation
            view = dequeuedView
        }
        else {
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
        guard let airportPin = view.annotation as? AirportPin else {
            return
        }

        print(airportPin.title!)
    }
    
}


/// regionRadius is on meters
private extension MKMapView {
    func centerToLocation(_ location: CLLocation, regionRadius: CLLocationDistance = 1) {
        let radius = regionRadius * 1000// 1000 meters in 1 kilometer
        let coordinateRegion = MKCoordinateRegion(
        center: location.coordinate,
        latitudinalMeters: radius,
        longitudinalMeters: radius)

        setRegion(coordinateRegion, animated: true)
    }
}



