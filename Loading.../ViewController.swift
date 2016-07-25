//
//  ViewController.swift
//  Loading...
//
//  Created by Raxit on 15/07/16.
//  Copyright © 2016 Raxit. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnShow(sender: AnyObject) {
        self.rotateNSLoaderClockwise(true)
        self.setTextToLabelForNSLoader("Loading...")
        self.rotationOfNSLoaderPerSecond(1.0)
        self.view.showNSLoader(.Center)
    }
    
    @IBAction func btnHide(sender: AnyObject) {
        self.view.hideNSLoader()
    }
}
