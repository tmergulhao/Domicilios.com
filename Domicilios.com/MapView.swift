//
//  MapView.swift
//  Domicilios.com
//
//  Created by Tiago Mergulhão on 11/10/16.
//  Copyright © 2016 Tiago Mergulhão. All rights reserved.
//

import MapKit

@IBDesignable class MapView: MKMapView {
    
    var dataSource : MKMapViewDataSource?
    
    func reloadData () {
        self.removeAnnotations(self.annotations)
        
        if let dataSource = self.dataSource {
            let numberOfSections = dataSource.numberOfSections(in: self)
            
            for i in 0..<numberOfSections {
                let numberOfAnnotationsInSection = dataSource.mapView(self, numberOfAnnotationsInSection: i)
                let region = dataSource.mapView(self, regionForSection: i)
                
                setRegion(region, animated: true)
                
                for j in 0..<numberOfAnnotationsInSection {
                    let indexPath = IndexPath(row: j, section: i)
                    let annotation = dataSource.mapView(self, annotationForRowAt: indexPath)
                    
                    self.addAnnotation(annotation)
                }
            }
        }
    }
}

