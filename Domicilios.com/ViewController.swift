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

class ViewController: UIViewController {
    
    // MARK: UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let customMapView = self.mapView as? MapView {
            customMapView.dataSource = DataSource()
        }
        
        enableCoreLocation()
        
        // TODO: START LOADER
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    
    func enableCoreLocation() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        
        if CLLocationManager.authorizationStatus() == .notDetermined {
            locationManager.requestWhenInUseAuthorization()
        }
        
        // if CLLocationManager.locationServicesEnabled() {}
    }
    
}

extension ViewController : UIScrollViewDelegate {}

// MARK: CLLocationManagerDelegate

extension ViewController : CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // let coordinate = locations[0].coordinate
        
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

// MARK: MKMapViewDelegate

extension ViewController : MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if (annotation is MKUserLocation) { return nil }
        
        if  let reuseID = annotation.title,
            let view = mapView.dequeueReusableAnnotationView(withIdentifier: reuseID!) {
            view.annotation = annotation
            
            return view
        }
        
        if  let customAnnotation = annotation as? MapViewAnnotation,
            let logo = customAnnotation.image,
            let imageComposition = generateImageFromLogo(logo),
            let reuseID = annotation.title {
            
            let view = MKAnnotationView(annotation: annotation, reuseIdentifier: reuseID)
            
            view.image = imageComposition
            
            return view
        }
        
        if let view = mapView.dequeueReusableAnnotationView(withIdentifier: "default") {
            view.annotation = annotation
            
            return view
        }
        
        let view = MKAnnotationView(annotation: annotation, reuseIdentifier: "default")
        view.image = StyleKit.imageOfMapPlaceholder()
        
        return view
    }
    
    func generateImageFromLogo(_ logo : UIImage) -> UIImage? {
        let bottomImageView: UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        let topImageView: UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        
        bottomImageView.image = StyleKit.imageOfMapPlaceholder()
        topImageView.image = logo
        
        bottomImageView.contentMode = .scaleAspectFit
        topImageView.contentMode = .scaleAspectFill
        
        // TODO : Clip to circle mask of 16 radius
        
        UIGraphicsBeginImageContext(bottomImageView.frame.size)
        
        bottomImageView.image?.draw(in: CGRect(x: 0, y: 0, width: bottomImageView.frame.size.width, height: bottomImageView.frame.size.height), blendMode: .normal, alpha: 1.0)
        topImageView.image?.draw(in: CGRect(x:0, y: 0, width: topImageView.frame.size.width, height: topImageView.frame.size.height), blendMode: .normal, alpha: 1.0)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        
        return newImage
    }
}
