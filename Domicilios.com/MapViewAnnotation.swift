//
//  MapViewAnnotation.swift
//  Domicilios.com
//
//  Created by Tiago Mergulhão on 11/10/16.
//  Copyright © 2016 Tiago Mergulhão. All rights reserved.
//

import MapKit

class MapViewAnnotation : NSObject, MKAnnotation {
    let record : FoodPlace
    
    // MARK : MKAnnotation

    var coordinate : CLLocationCoordinate2D
    var title : String? {
        return record.name
    }
    var subtitle : String? {
        return record.category.rawValue
    }
    var image : UIImage? {
        return record.image
    }
    
    init (record : FoodPlace) {
        self.record = record
        self.coordinate = CLLocationCoordinate2D(latitude: record.latitude, longitude: record.longitude)
        
        super.init()
    }
}
