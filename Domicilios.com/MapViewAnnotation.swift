//
//  MapViewAnnotation.swift
//  Domicilios.com
//
//  Created by Tiago Mergulhão on 11/10/16.
//  Copyright © 2016 Tiago Mergulhão. All rights reserved.
//

import MapKit

class MapViewAnnotation : NSObject, MKAnnotation {
    let name : String
    let category : FoodPlaceCategories
    let logo : UIImage
    
    // MARK : MKAnnotation
    
    let coordinate: CLLocationCoordinate2D
    
    var title : String? {
        return name
    }
    var subtitle : String? {
        return category.rawValue
    }
    
    init (name : String, category : FoodPlaceCategories, coordinate : CLLocationCoordinate2D, logo : UIImage?) {
        self.name = name
        self.category = category
        self.coordinate = coordinate
        
        if let image = logo {
            self.logo = image
        } else {
            self.logo = StyleKit.imageOfDeliveries()
        }
        
        super.init()
    }
}
