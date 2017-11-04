//
//  ViewController.swift
//  payEphone
//
//  Created by 윤영채 on 2017. 11. 4..
//  Copyright © 2017년 윤영채. All rights reserved.
//

import UIKit

@IBDesignable
class MyUIButton: UIButton{
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
}

@IBDesignable
class LoginTextField: UITextField{
    var _borderWidth: CGFloat = 0.0
    @IBInspectable var borderWidth: CGFloat {
        get {
            return self._borderWidth
        }
        set {
            _borderWidth = newValue
            let border = CALayer()
            border.borderColor = UIColor.lightGray.cgColor
            border.frame = CGRect(x: 0, y: self.frame.size.height - _borderWidth, width:  self.bounds.size.width, height: self.bounds.size.height)
            
            border.borderWidth = _borderWidth
            self.layer.addSublayer(border)
            self.layer.masksToBounds = true
        }
    }
    
    @IBInspectable var paddingLeft: CGFloat = 0
    @IBInspectable var paddingRight: CGFloat = 0
    @IBInspectable var paddingTop: CGFloat = 0
    @IBInspectable var paddingBottom: CGFloat = 0
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + paddingLeft,
                      y: bounds.origin.y + paddingTop,
                      width: bounds.size.width - paddingLeft - paddingRight,
                      height: bounds.size.height - paddingBottom - paddingTop)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return textRect(forBounds: bounds)
    }
}
//
//extension UITabBarController{
//    public override convenience init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
//        for item in self.tabBar.items{
//            item as! UITabBarItem
//        }
//    }
//}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.barTintColor = UIColor.white
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

