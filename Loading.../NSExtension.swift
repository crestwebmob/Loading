//
//  NSExtension.swift
//  Loading...
//
//  Created by Raxit on 16/07/16.
//  Copyright © 2016 Raxit. All rights reserved.
//

import Foundation
import UIKit

public enum LoaderPosition {
    case Top
    case Center
    case Bottom
}

var myView : NSView = NSView()
var myLabel : NSLabel = NSLabel()

let KPaddingForLabelText:CGFloat = 20.0
let KLabelHeight:CGFloat = 80.0

public extension UIView {

    public func showNSLoader(position : LoaderPosition) {
        myView.setNSLoader(position)
        self.addSubview(myView)
        
        myLabel.setLabel()
        myLabel.frame = (frame: CGRectMake(KPaddingForLabelText, myView.frame.origin.y + myView.bounds.height - KPaddingForLabelText , UIScreen.mainScreen().bounds.width - (KPaddingForLabelText*2) , KLabelHeight))
        self.addSubview(myLabel)
    }
    
    public func hideNSLoader() {
        myView.removeLoader()
        myLabel.removeLabel()
    }
}

public extension UIViewController {
    
        public func rotateNSLoaderClockwise(direction : Bool){
            myView.SetRotationDirection(direction)
        }
        
        public func rotationOfNSLoaderPerSecond (rotation : Float){
            myView.setRotationPerSecond(rotation)
        }
    
        public func interactionDisabledWhileNSLoaderAppears(){
            UIApplication.sharedApplication().beginIgnoringInteractionEvents()
        }
    
        public func interactionEnabledWhileNSLoaderAppears(){
            UIApplication.sharedApplication().endIgnoringInteractionEvents()
        }
    
        public func setTextToLabelForNSLoader(text : String) {
            myLabel.text = text
        }
    
}


