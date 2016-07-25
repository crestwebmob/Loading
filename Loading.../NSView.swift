//
//  NSView.swift
//  Loading...
//
//  Created by Raxit on 15/07/16.
//  Copyright © 2016 Raxit. All rights reserved.
//

import UIKit

let KViewWidth:CGFloat = UIScreen.mainScreen().bounds.size.width/2
let KViewHeightC:CGFloat = UIScreen.mainScreen().bounds.size.height/2
let KViewHeightT:CGFloat = UIScreen.mainScreen().bounds.size.height/4
let KViewHeightB:CGFloat = UIScreen.mainScreen().bounds.size.height/1.5

let KOuterImage:String = "ring"
let KInnerImage:String = "logo"
let KRotationPerSecond:Float = 1.0

class NSView: UIView
{
    var clockwise:Float = 1.0
    var rotationPerSec:Float = KRotationPerSecond
    var clockDirection = true
    
    lazy private var animationLayer : CALayer =
    {
        return CALayer()
    }()
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
    }
    
    required init()
    {
        super.init(frame: .zero)
    }
    
    required init(coder aDecoder: NSCoder)
    {
        fatalError("This class does not support NSCoding")
    }
    
    internal func setNSLoader(position : LoaderPosition) -> Void
    {
        let image : UIImage = UIImage(named: KOuterImage)!
        let frame : CGRect = CGRectMake(0.0, 0.0, image.size.width, image.size.height)
        self.frame = frame
        
        let imageB : UIImage = UIImage(named: KInnerImage)!
        let backgroundImage = UIImageView(frame: CGRectMake(0.0, 0.0, imageB.size.width, imageB.size.height))
        backgroundImage.image = imageB
        backgroundImage.center = CGPointMake((image.size.width/2), (image.size.height/2))
        
        self.insertSubview(backgroundImage, atIndex: 0)
        
        animationLayer.frame = frame
        animationLayer.contents = image.CGImage
        animationLayer.masksToBounds = true
        
        self.layer.addSublayer(animationLayer)
        
        switch position {
        case .Top:
            self.center = CGPointMake(KViewWidth, KViewHeightT)
        case .Center:
            self.center = CGPointMake(KViewWidth, KViewHeightC)
        case .Bottom:
            self.center = CGPointMake(KViewWidth, KViewHeightB)
        }
        
        addRotation(forLayer: animationLayer)
    }
    
    internal func removeLoader() -> Void {
        self.removeFromSuperview()
    }
    
    func setRotationPerSecond(rotate : Float) -> Void {
        rotationPerSec = rotate
    }
    
    func SetRotationDirection(direction : Bool) -> Void {
        clockDirection = direction
    }
    
    func setClock() -> Void {
        clockwise = 1.0
    }
    
    func setAntiClock() -> Void {
        clockwise = -1.0
    }
    
    func addRotation(forLayer layer : CALayer) {
        let rotation : CABasicAnimation = CABasicAnimation(keyPath:"transform.rotation.z")
        
        rotation.duration = 1.0
        rotation.removedOnCompletion = false
        rotation.repeatCount = HUGE
        rotation.fillMode = kCAFillModeForwards
        rotation.cumulative = true;
        rotation.fromValue = NSNumber(float: 0.0)
        
        clockDirection ? self.setClock() : self.setAntiClock()
        
        rotation.toValue = NSNumber(float: 3.14 * clockwise * rotationPerSec)
        layer.addAnimation(rotation, forKey: "rotate")
    }
}
