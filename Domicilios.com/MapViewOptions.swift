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
#if !TARGET_INTERFACE_BUILDER
    override func awakeFromNib () {
        super.awakeFromNib()
        
        layer.masksToBounds = true
        layer.cornerRadius = 10
    }
#else
    override func draw(_ rect: CGRect) {
        layer.masksToBounds = true
        layer.cornerRadius = 10
    }
#endif
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
