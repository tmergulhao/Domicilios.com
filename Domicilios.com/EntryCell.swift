//
//  EntryCell.swift
//  Domicilios.com
//
//  Created by Tiago Mergulhão on 09/10/16.
//  Copyright © 2016 Tiago Mergulhão. All rights reserved.
//

import UIKit

// MARK : UITableViewCell

@IBDesignable class EntryCell : UITableViewCell {
    @IBOutlet weak var logo : UIImageView!
    
    override func draw(_ rect: CGRect) {
        logo.image = StyleKit.imageOfDeliveries()
    }
}
