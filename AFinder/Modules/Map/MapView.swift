//
//  MapView.swift
//  AFinder
//
//  Created by Daniel Tejeda on 07/02/21.
//  
//

// Radius free icon by FreePik from flaticons.com
// Clipboard (AKA list) icon By dmitri13 from flaticons.com
// Airport pin by DinosoftLabs from flaticons.com


import Foundation
import UIKit
import MapKit

class MapView: UIViewController {

    // MARK: Properties
    var presenter: MapPresenterProtocol?
    var locationManager = CLLocationManager()
    var airports: AirportResponse?
    
    // MARK: IBOutlet
    @IBOutlet weak var mapContainer: MKMapView!
    @IBOutlet weak var noGPSContainer: UIView!
    @IBOutlet weak var noWiFiContainer: UIView!
    @IBOutlet weak var cantFindYouLabel: UILabel!
    @IBOutlet weak var cantFindYouInstructionsLabel: UILabel!
    @IBOutlet weak var openSettingsButton: AFPrimaryButton!
    @IBOutlet weak var connectionLostLabel: UILabel!
    @IBOutlet weak var connectionLostAnimationContainer: UIView!
    @IBOutlet weak var refreshButton: AFSecondaryButton!
    @IBOutlet weak var radiusButton: AFSecondaryCircularButton!
    @IBOutlet weak var listButton: AFPrimaryCircularButton!
    
    @IBOutlet weak var updateRangeButton: AFPrimaryButton!
    @IBOutlet weak var rangeSlider: UISlider!
    @IBOutlet weak var rangeLabel: UILabel!
    @IBOutlet var updateRangeContainer: UIView!
    
    
    // MARK: IBAction
    @IBAction func openSettingsAction(_ sender: Any) {
        self.presenter?.openSettingsAction()
    }
    
    @IBAction func refreshAction(_ sender: Any) {
        self.presenter?.refreshAction()
    }
    
    @IBAction func radiusButtonAction(_ sender: Any) {
        
    }
    
    @IBAction func listButtonAction(_ sender: Any) {
        self.presenter?.listButtonAction(airports: self.airports)
    }
    
    @IBAction func updateRangeButtonAction(_ sender: Any) {
    }
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.viewDidLoad()
    }
}

extension MapView: MapViewProtocol {
    
    func setUpButtons() {
        self.listButton.setQuick(icon: "clipboard")
        self.radiusButton.setQuick(icon: "radius")
    }
    
    func setUpNoGPSContainer() {
        cantFindYouLabel.text = "CantFindYouLabel".localized()
        cantFindYouInstructionsLabel.text = "CantFindYouInstructionsLabel".localized()
        openSettingsButton.setQuick(title: "Open settings")
        noGPSContainer.isHidden = true
        self.view.addSubview(noGPSContainer)
        self.noGPSContainer.center = self.view.center
        setUpButtons()
    }
    
    func setUpMap() {
        mapContainer.register(
          AirportAnnotationView.self,
          forAnnotationViewWithReuseIdentifier:
            MKMapViewDefaultAnnotationViewReuseIdentifier)
    }
    
    func setUpNoWiFiContainer() {
        connectionLostLabel.text = "ConnectionLostLabel".localized()
        refreshButton.setQuick(title: "Refresh")
        noWiFiContainer.isHidden = true
        AnimationWrapper.setUpAnimation(in: connectionLostAnimationContainer, withFile: "connection_lost")
        self.view.addSubview(noWiFiContainer)
        self.noWiFiContainer.center = self.view.center
    }
    
    // Center the user based on its location and fetch airports
    func centerMapWith(range: Int) {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        
        if !isLocationServiceEnabled() {
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
    
    // Populate the map with airports
    func foundAirports(airports: AirportResponse) {
        // Remove all current annotations
        DispatchQueue.main.async {
            self.mapContainer.removeAnnotations(self.mapContainer.annotations)
        }
        
        // Add new annotations
        self.airports = airports
        for a in airports.data {
            let newAirportPin = AirportPin(
                title: a.name,
                coordinate: CLLocationCoordinate2D(latitude: a.geoCode.latitude, longitude: a.geoCode.longitude))
            DispatchQueue.main.async {
                self.mapContainer.addAnnotation(newAirportPin)
            }
        }
    }
    
    // No airports near by: Tell the user to make the range wider
    func emptyAirports() {
        print("Empty airports")
    }
    
    // Show no connection message
    func errorLoadingAirports() {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
            self.mapContainer.isHidden = true
            self.noGPSContainer.isHidden = true
            self.listButton.isHidden = true
            self.radiusButton.isHidden = true
            self.noWiFiContainer.isHidden = false
        })
    }

    func deniedMap() {
        DispatchQueue.main.async {
            self.mapContainer.isHidden = true
            self.noWiFiContainer.isHidden = true
            self.listButton.isHidden = true
            self.radiusButton.isHidden = true
            self.noGPSContainer.isHidden = false

        }
    }
    
    func grantMap() {
        DispatchQueue.main.async {
            self.noGPSContainer.isHidden = true
            self.noWiFiContainer.isHidden = true
            self.listButton.isHidden = false
            self.radiusButton.isHidden = false
            self.mapContainer.isHidden = false
        }
    }
    
}

// MARK: - CLLocationManagerDelegate
extension MapView: CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined, .restricted, .denied:
            self.presenter?.deniedMap()
        case .authorizedAlways, .authorizedWhenInUse:
            self.presenter?.grantMap()
            if let location = manager.location {
                self.presenter?.findAirports(location: location)
            }
            
        @unknown default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last{
            // Set current position on map
            mapContainer.centerToLocation(location)
            // Everything is ready to start fetching results
            self.presenter?.findAirports(location: location)
        }
    }
}

// MARK: - MKMapViewDelegate
extension MapView: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let annotation = annotation as? AirportPin else {
            return nil
        }
        let identifier = "Something"
        var view: AirportAnnotationView
        if let dequeuedView = mapView.dequeueReusableAnnotationView (
            withIdentifier: identifier) as? AirportAnnotationView {
            dequeuedView.annotation = annotation
            view = dequeuedView
        }
        else {
            view = AirportAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            view.canShowCallout = true
            view.calloutOffset = CGPoint(x: -5, y: 5)
            view.image = annotation.customPinImage
            view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            
        }
        return view
    }

    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let airportPin = view.annotation as? AirportPin else {
            return
        }
    }
    
}

// MARK: - MapKitHelper
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



