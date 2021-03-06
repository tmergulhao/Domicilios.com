//
//  SheetViewController.swift
//  Domicilios.com
//
//  Created by Tiago Mergulhão on 12/10/16.
//  Copyright © 2016 Tiago Mergulhão. All rights reserved.
//

import UIKit

class SheetViewController : UIViewController {
    @IBOutlet weak var left: UIButton!
    @IBOutlet weak var right: UIButton!
    @IBOutlet weak var filterView : UIView!
    
    let paddingTop: CGFloat = UIApplication.shared.statusBarFrame.height
    var partialView: CGFloat {
        return UIScreen.main.bounds.height - (filterView.frame.maxY + UIApplication.shared.statusBarFrame.height)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        left.layer.cornerRadius = 10
        right.layer.cornerRadius = 10
        left.layer.borderColor = UIColor(colorLiteralRed: 0, green: 148/255, blue: 247.0/255.0, alpha: 1).cgColor
        left.layer.borderWidth = 1
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.6, animations: { [weak self] in
            let frame = self?.view.frame
            let yComponent = self?.partialView
            self?.view.frame = CGRect(x: 0, y: yComponent!, width: frame!.width, height: frame!.height)
        })
    }
    
    @IBAction func leftButton(_ sender: AnyObject) {
        print("Left Button")
    }
    
    @IBAction func rightButton(_ sender: AnyObject) {
        print("Right Button")
    }
    
    @IBAction func close(_ sender: AnyObject) {
        UIView.animate(withDuration: 0.3, animations: {
            let frame = self.view.frame
            self.view.frame = CGRect(x: 0, y: self.partialView, width: frame.width, height: frame.height)
        })
    }
    
    @IBAction func panGesture(_ recognizer: UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: self.view)
        let velocity = recognizer.velocity(in: self.view)
        let y = self.view.frame.minY
        
        if  ( y + translation.y >= paddingTop ) && ( y + translation.y <= partialView ) {
            self.view.frame = CGRect(x: 0, y: y + translation.y, width: view.frame.width, height: view.frame.height)
            recognizer.setTranslation(CGPoint.zero, in: self.view)
        }
        
        if recognizer.state == .ended {
            var duration =  velocity.y < 0 ? Double((y - paddingTop) / -velocity.y) : Double((partialView - y) / velocity.y )
            
            duration = duration > 1.3 ? 1 : duration
            
            UIView.animate(withDuration: duration, animations: {
                
                if  velocity.y >= 0 {
                    self.view.frame = CGRect(x: 0, y: self.partialView, width: self.view.frame.width, height: self.view.frame.height)
                } else {
                    self.view.frame = CGRect(x: 0, y: self.paddingTop, width: self.view.frame.width, height: self.view.frame.height)
                }
            })
        }
    }
}

