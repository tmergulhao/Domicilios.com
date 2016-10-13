//
//  MapViewController.swift
//  Domicilios.com
//
//  Created by Tiago Mergulhão on 12/10/16.
//  Copyright © 2016 Tiago Mergulhão. All rights reserved.
//

import UIKit
import MapKit

class MapViewController : UIViewController {
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        addSheetView()
    }
    
    func addSheetView () {
        let sheet = SheetViewController()
        
        addChildViewController(sheet)
        view.addSubview(sheet.view)
        
        sheet.didMove(toParentViewController: self)
        
        let height = view.frame.height
        let width = view.frame.width
        
        sheet.view.frame = CGRect(x: 0, y: self.view.frame.maxY, width: width, height: height)
    }
}

extension MapViewController : MKMapViewDelegate {}
