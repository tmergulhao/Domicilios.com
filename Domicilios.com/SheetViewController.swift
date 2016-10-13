//
//  SheetViewController.swift
//  Domicilios.com
//
//  Created by Tiago Mergulhão on 12/10/16.
//  Copyright © 2016 Tiago Mergulhão. All rights reserved.
//

import UIKit

//class SheetViewController : UIViewController {
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        
//        prepareBackgroundView()
//    }
//    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        
//        UIView.animate(withDuration: 0.3) {
//            let frame = self.view.frame
//            let y = UIScreen.main.bounds.height - 200
//            
//            self.view.frame = CGRect(x: 0, y: y, width: frame.width, height: frame.height)
//        }
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        let gesture = UIPanGestureRecognizer.init(target: self, action: #selector(SheetViewController.panGesture))
//        view.addGestureRecognizer(gesture)
//    }
//    
//    func prepareBackgroundView () {
//        let blurEffect = UIBlurEffect(style: .light)
//        let visualEffect = UIVisualEffectView(effect: blurEffect)
//        let bluredView = UIVisualEffectView(effect: blurEffect)
//        
//        bluredView.contentView.addSubview(visualEffect)
//        
//        visualEffect.frame = UIScreen.main.bounds
//        bluredView.frame = UIScreen.main.bounds
//        
//        view.insertSubview(bluredView, at: 0)
//    }
//    
//    func panGesture(recognizer: UIPanGestureRecognizer) {
//        let translation = recognizer.translation(in: self.view)
//        let y = self.view.frame.minY
//        self.view.frame = CGRect(x: 0, y: y + translation.y, width: view.frame.width, height: view.frame.height)
//        recognizer.setTranslation(CGPoint.zero, in: self.view)
//    }
//}

//class BottomSheetViewController: UIViewController {
class SheetViewController : UIViewController {
    // holdView can be UIImageView instead
    @IBOutlet weak var holdView: UIView!
    @IBOutlet weak var left: UIButton!
    @IBOutlet weak var right: UIButton!
    @IBOutlet weak var close: UIButton!
    
    let fullView: CGFloat = 100
    var partialView: CGFloat {
        return UIScreen.main.bounds.height - (left.frame.maxY + UIApplication.shared.statusBarFrame.height)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let gesture = UIPanGestureRecognizer.init(target: self, action: #selector(SheetViewController.panGesture))
        view.addGestureRecognizer(gesture)
        roundViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        close.setImage(StyleKit.imageOfCloseImageDialog(), for: UIControlState.normal)
        
        prepareBackgroundView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.6, animations: { [weak self] in
            let frame = self?.view.frame
            let yComponent = self?.partialView
            self?.view.frame = CGRect(x: 0, y: yComponent!, width: frame!.width, height: frame!.height)
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func rightButton(_ sender: AnyObject) {
        print("tabbed")
    }
    
    @IBAction func close(_ sender: AnyObject) {
        UIView.animate(withDuration: 0.3, animations: {
            let frame = self.view.frame
            self.view.frame = CGRect(x: 0, y: self.partialView, width: frame.width, height: frame.height)
        })
    }
    
    func panGesture(_ recognizer: UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: self.view)
        let velocity = recognizer.velocity(in: self.view)
        let y = self.view.frame.minY
        if ( y + translation.y >= fullView) && (y + translation.y <= partialView ) {
            self.view.frame = CGRect(x: 0, y: y + translation.y, width: view.frame.width, height: view.frame.height)
            recognizer.setTranslation(CGPoint.zero, in: self.view)
        }
        
        if recognizer.state == .ended {
            var duration =  velocity.y < 0 ? Double((y - fullView) / -velocity.y) : Double((partialView - y) / velocity.y )
            
            duration = duration > 1.3 ? 1 : duration
            UIView.animate(withDuration: duration, animations: {
                
                if  velocity.y >= 0 {
                    self.view.frame = CGRect(x: 0, y: self.partialView, width: self.view.frame.width, height: self.view.frame.height)
                } else {
                    self.view.frame = CGRect(x: 0, y: self.fullView, width: self.view.frame.width, height: self.view.frame.height)
                }
            })
        }
    }
    
    func roundViews() {
        view.layer.cornerRadius = 10
        holdView.layer.cornerRadius = 3
        left.layer.cornerRadius = 10
        right.layer.cornerRadius = 10
        left.layer.borderColor = UIColor(colorLiteralRed: 0, green: 148/255, blue: 247.0/255.0, alpha: 1).cgColor
        left.layer.borderWidth = 1
        view.clipsToBounds = true
    }
    
    func prepareBackgroundView(){
        let blurEffect = UIBlurEffect.init(style: .light)
        let visualEffect = UIVisualEffectView.init(effect: blurEffect)
        let bluredView = UIVisualEffectView.init(effect: blurEffect)
        bluredView.contentView.addSubview(visualEffect)
        
        visualEffect.frame = UIScreen.main.bounds
        bluredView.frame = UIScreen.main.bounds
        
        view.insertSubview(bluredView, at: 0)
    }
    
}

