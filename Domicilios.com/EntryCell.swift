//
//  EntryCell.swift
//  Domicilios.com
//
//  Created by Tiago Mergulhão on 09/10/16.
//  Copyright © 2016 Tiago Mergulhão. All rights reserved.
//

import UIKit

// MARK : UITableViewCell

//@IBDesignable 
class EntryCell : UITableViewCell {
    #if !TARGET_INTERFACE_BUILDER
    let interfaceBuilder : Bool = false
    #else
    let interfaceBuilder : Bool = true
    #endif
    
    @IBOutlet weak var logo : UIImageView!
    @IBOutlet var title : UILabel!
    @IBOutlet var category : UILabel!
    
//    @IBOutlet weak var rating : UIImageView!
//    @IBOutlet weak var time : UIImageView!
//    @IBOutlet weak var price : UIImageView!
    
    override func draw(_ rect: CGRect) {
        logo.image = StyleKit.imageOfDeliveries()
        
//        rating.backgroundColor = UIColor.red
//        time.backgroundColor = UIColor.red
//        price.backgroundColor = UIColor.red
        
        backgroundColor = UIColor.clear
    }
}
