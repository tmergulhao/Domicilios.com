//
//  SheetView.swift
//  Domicilios.com
//
//  Created by Tiago Mergulhão on 13/10/16.
//  Copyright © 2016 Tiago Mergulhão. All rights reserved.
//

import UIKit

@IBDesignable class SheetView : UIVisualEffectView {
    @IBOutlet weak var handle: UIView!
    @IBOutlet weak var close: UIButton!
    
    #if !TARGET_INTERFACE_BUILDER
    override func awakeFromNib () {
        super.awakeFromNib()
        
        layer.cornerRadius = 10
        clipsToBounds = true
        
        handle.layer.cornerRadius = 3
        
        close.setImage(StyleKit.imageOfCloseImageDialog(), for: UIControlState.normal)
    }
    #else
    override func draw(_ rect: CGRect) {
        layer.cornerRadius = 10
        clipsToBounds = true
    
        handle.layer.cornerRadius = 3
    
        close.setImage(StyleKit.imageOfCloseImageDialog(), for: UIControlState.normal)
    }
    #endif
}
