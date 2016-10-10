//
//  ViewController.swift
//  Domicilios.com
//
//  Created by Tiago Mergulhão on 09/10/16.
//  Copyright © 2016 Tiago Mergulhão. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

@IBDesignable class MapView: MKMapView {
    
    override func draw(_ rect: CGRect) {
        showsPointsOfInterest = false
        showsBuildings = false
        showsTraffic = false
        showsUserLocation = true
        
        #if !TARGET_INTERFACE_BUILDER
        #else
        #endif
    }
}

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    // MARK: UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupMapView()
        
        enableCoreLocation()
        
        //let mapViewOptions = Bundle.main.loadNibNamed("MapViewOptions", owner: self, options: nil)![0] as! MapViewOptions
//        mapViewOptions.frame = CGRect(x: 0, y: 0, width: 45, height: 137)
//        mapViewOptions.tintedBlurView.layer.cornerRadius = 10
//        mapViewOptions.tintedBlurView.layer.masksToBounds = true
//        
//        self.view?.addSubview(mapViewOptions)
        
        // TODO: START LOADER
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: MKMapViewDelegate
    
    @IBOutlet weak var mapView: MKMapView!
    
    func setupMapView() {
        mapView.showsPointsOfInterest = false
        mapView.showsBuildings = false
        mapView.showsTraffic = false
        mapView.showsUserLocation = true
    }
    
    // MARK: CLLocationManagerDelegate
    
    let locationManager = CLLocationManager()
    
    func enableCoreLocation() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        
        if CLLocationManager.authorizationStatus() == .notDetermined {
            locationManager.requestWhenInUseAuthorization()
        }
        
        // if CLLocationManager.locationServicesEnabled() {}
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let coordinate = locations[0].coordinate
        
        let span : MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let region : MKCoordinateRegion = MKCoordinateRegion(center: coordinate, span: span)
        
        mapView.setRegion(region, animated: true)
        // mapView.setCenter(coordinate, animated: true)
        
        locationManager.stopUpdatingLocation()
        
        // TODO: STOP LOADER
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .denied, .restricted:
            let alertController = UIAlertController(
                title: "Background Location Access Disabled",
                message: "In order to be notified about adorable kittens near you, please open this app's settings and set location access to 'When Using the App'.",
                preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alertController.addAction(cancelAction)
            
            let openAction = UIAlertAction(title: "Open Settings", style: .default) { (action) in
                if let url = URL(string: UIApplicationOpenSettingsURLString) {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                }
            }
            alertController.addAction(openAction)
            
            self.present(alertController, animated: true, completion: nil)
            break
        case .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
            break
        default:
            print(status)
        }
    }
    
}

