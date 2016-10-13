//
//  ScrollView.swift
//  Domicilios.com
//
//  Created by Tiago Mergulhão on 12/10/16.
//  Copyright © 2016 Tiago Mergulhão. All rights reserved.
//

import UIKit

@IBDesignable class ScrollView : UIScrollView {
    override func draw(_ rect: CGRect) {
//        let offset = CGPoint(x: 0, y: -200)
        contentInset.top = 1000
        
        print("LETSTRY!!!")
        
        backgroundColor = nil
    }
}
