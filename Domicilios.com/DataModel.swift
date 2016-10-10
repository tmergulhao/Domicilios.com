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

enum FoodPlaceParsingError : Error {
    case name
    case rating
    case time
    case location
    case category
    case url
    case price
    case logoPath
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
    
    init (dictionary : Dictionary<String, Any>) throws {
        let separator : Character = ","
        
        if let name = dictionary["nombre"] as? String {
            self.name = name
        } else {
            throw FoodPlaceParsingError.name
        }
        
        if let timeString = dictionary["tiempo_domicilio"] as? String,
           let time = Int(timeString) {
            self.time = time
        } else {
            throw FoodPlaceParsingError.time
        }
        
        if let ratingString = dictionary["rating"] as? String,
           let rating = Int(ratingString) {
            self.rating = rating
        } else {
            throw FoodPlaceParsingError.rating
        }
        
        if let logoPath = dictionary["logo_path"] as? String {
            self.logoPath = logoPath
        } else {
            throw FoodPlaceParsingError.logoPath
        }
        
        if let detailPath = dictionary["url_detalle"] as? String {
            self.url = detailPath
        } else {
            throw FoodPlaceParsingError.url
        }
        
        if let priceString = dictionary["domicilio"] as? String,
           let price : Double = Double(priceString) {
            self.price = price
        } else {
            throw FoodPlaceParsingError.price
        }
        
        if let rawCategory = dictionary["categorias"] as? String,
           let category = FoodPlaceCategories(rawValue: rawCategory) {
            self.category = category
        } else {
            throw FoodPlaceParsingError.category
        }
        
        if  let ubicacion = dictionary["ubicacion_txt"] as? String,
            
            ubicacion != "",
            
            let coordinates = (ubicacion.characters.split(separator: (separator)).map(String.init) as Array<String>?),
            
            coordinates.count == 2,
            
            let latitude : Double = Double(coordinates[0]),
            let longitude : Double = Double(coordinates[1])
        {
            self.latitude = latitude
            self.longitude = longitude
        } else {
            throw FoodPlaceParsingError.location
        }
    }
}
