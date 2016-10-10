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
            arepas = "Arepas"
}

struct FoodPlace {
    var name : String
    var category : FoodPlaceCategories
    var price : Double
    var url : String
    var logoPath : String
    var rating : Int
    var time : Int
    var address : String
}
