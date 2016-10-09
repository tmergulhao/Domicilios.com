//
//  MapViewOptions.swift
//  Domicilios.com
//
//  Created by Tiago Mergulhão on 09/10/16.
//  Copyright © 2016 Tiago Mergulhão. All rights reserved.
//

import UIKit
import QuartzCore

@IBDesignable class RedGlassView: UIVisualEffectView {
    override func draw(_ rect: CGRect) {
        layer.backgroundColor = StyleKit.red().cgColor
        layer.masksToBounds = true
        layer.cornerRadius = 10
    }
}

@IBDesignable class DeliveriesButton : UIButton {
    override func draw(_ rect: CGRect) {
        self.setImage(StyleKit.imageOfDeliveries(), for: .normal)
    }
}

@IBDesignable class LocationButton : UIButton {
    override func draw(_ rect: CGRect) {
        self.setImage(StyleKit.imageOfLocation(), for: .normal)
    }
}

@IBDesignable class ListViewButton : UIButton {
    override func draw(_ rect: CGRect) {
        self.setImage(StyleKit.imageOfListView(), for: .normal)
    }
}

//@IBDesignable class TintedBlurView: UIVisualEffectView {
//    
//    @IBInspectable var cornerRadius: CGFloat = 0
//    
//    override func draw(_ rect: CGRect) {
//        
//        layer.cornerRadius = CGFloat(10)
//        //layer.cornerRadius = 10//cornerRadius
//        
//        //self.layer.cornerRadius = cornerRadius
//    }
//    
//}
