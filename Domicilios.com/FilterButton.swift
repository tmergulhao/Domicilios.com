//
//  FilterButton.swift
//  Domicilios.com
//
//  Created by Tiago Mergulhão on 12/10/16.
//  Copyright © 2016 Tiago Mergulhão. All rights reserved.
//

import UIKit

@IBDesignable class FilterButton : UIButton {
    @IBInspectable var type : String!
    @IBInspectable var value : CGFloat!
    @IBInspectable var active : Bool!
    
    override func draw(_ rect: CGRect) {
        type = type == nil ? "Price" : type
        active = active == nil ? false : active
        
        switch type {
        case "Price":
            value = value == nil ? 1000 : value
            
            StyleKit.drawPriceFilter(withPriceSortActive: active, price: value)
            break
        case "Rating":
            value = value == nil ? 3 : value
            
            StyleKit.drawRatingFilter(withRatingSortActive: active, rating: value)
            break
        case "Time":
            value = value == nil ? 37 : value
            
            StyleKit.drawTimeFilter(withTimeSortActive: active, time: value)
            break
        default:
            break
        }
    }
}
