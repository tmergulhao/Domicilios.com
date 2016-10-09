//
//  MapView.swift
//  Domicilios.com
//
//  Created by Tiago Mergulhão on 09/10/16.
//  Copyright © 2016 Tiago Mergulhão. All rights reserved.
//

import MapKit

@IBDesignable class MapView: MKMapView {
    override func draw(_ rect: CGRect) {
        showsPointsOfInterest = false
        showsBuildings = false
        showsTraffic = false
        showsUserLocation = true
        
        let coordinate : CLLocationCoordinate2D = CLLocationCoordinate2D(
            latitude: 4.6838,
            longitude: -74.0668
        )
        
        let latDelta : CLLocationDegrees = 0.00001
        let longDelta : CLLocationDegrees = 0.00001
        
        let span : MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        let region : MKCoordinateRegion = MKCoordinateRegionMake(coordinate, span)
        
        setRegion(region, animated: true)
        setCenter(coordinate, animated: true)
    }
}
