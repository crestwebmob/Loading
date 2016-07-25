//
//  NSLabel.swift
//  Loading...
//
//  Created by Raxit on 18/07/16.
//  Copyright © 2016 Raxit. All rights reserved.
//

import UIKit

class NSLabel: UILabel {
    
    let myView = NSView()
    let KLabelFontSize:CGFloat = 22.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    internal func setLabel() -> Void
    {
                self.textAlignment = NSTextAlignment.Center
                self.textColor = UIColor.blackColor()
                self.font = self.font.fontWithSize(KLabelFontSize)
                self.numberOfLines = 0
    }
    
    internal func removeLabel() -> Void {
        self.removeFromSuperview()
    }
    
    required init()
    {
        super.init(frame: .zero)
    }
    
    required init(coder aDecoder: NSCoder)
    {
        fatalError("This class does not support NSCoding")
    }
    
}
