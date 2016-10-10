//
//  Data.swift
//  Domicilios.com
//
//  Created by Tiago Mergulhão on 09/10/16.
//  Copyright © 2016 Tiago Mergulhão. All rights reserved.
//

import Foundation

enum FoodPlaceCategories : String {
    case    fastFood = "Hamburguesas y Perros Calientes",
            chiken = "Pollo",
            pizza = "Pizza",
            breakfast = "Desayunos",
            sandwiches = "Sanduches",
            arepas = "Arepas",
            mexican = "Comida Mexicana"
}

struct FoodPlace {
    var name : String
    var category : FoodPlaceCategories
    var price : Double
    var url : String
    var logoPath : String
    var rating : Int
    var time : Int
    var latitude : Double
    var longitude : Double
    
    init? (dictionary : NSDictionary) {
        if  let name = dictionary.object(forKey: "nombre") as? String,
            
            let ratingString = dictionary.object(forKey: "rating") as? String,
            let rating = Int(ratingString),
            
            let timeString = dictionary.object(forKey: "tiempo_domicilio") as? String,
            let time = Int(timeString),
            
            let ubicacion = dictionary.object(forKey: "ubicacion_txt") as? String,
            
            let rawCategory = dictionary.object(forKey: "categorias") as? String,
            let category = FoodPlaceCategories(rawValue: rawCategory),
            
            let priceString = dictionary.object(forKey: "domicilio") as? String,
            let price : Double = Double(priceString),
            
            let logoPath = dictionary.object(forKey: "logo_path") as? String,
            
            let detailPath = dictionary.object(forKey: "url_detalle") as? String,
            
            ubicacion != ""
        {
            
            let separator : Character = ","
            let coordinates = ubicacion.characters.split(separator: (separator)).map(String.init)
            
            if  coordinates.count == 2,
                let latitude : Double = Double(coordinates[0]),
                let longitude : Double = Double(coordinates[1]) {
                
                self.name = name
                self.category = category
                self.price = price
                self.url = detailPath
                self.logoPath = logoPath
                self.rating = rating
                self.time = time
                self.latitude = latitude
                self.longitude = longitude
            } else {
                print("Almost")
                return nil
            }
        } else {
            print("Not even")
            return nil
        }
    }
}
