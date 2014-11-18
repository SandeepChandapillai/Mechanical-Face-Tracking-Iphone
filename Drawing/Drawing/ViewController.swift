//
//  ViewController.swift
//  Drawing
//
//  Created by Sandeep on 9/21/14.
//  Copyright (c) 2014 Sandeep. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
     var color:UIColor!
    
    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        color = UIColor.blackColor()
       
    }

    
    
    
    @IBOutlet var drawView:DrawView?
    
    @IBAction func clearTapped(sender: AnyObject)
    {
        
        drawView?.lines = []
        println("clearTapped")                          //DEBUG
        drawView?.setNeedsDisplay()
    }
    
    
    //Select color
    @IBAction func buttonTapped(sender: AnyObject)
    {
        var button:UIButton = sender as UIButton
        println("buttonTapped")                         //DEBUG
        
        if button.titleLabel?.text == "Red"
        {
            color = UIColor.redColor()
        }
        else if button.titleLabel?.text == "Black"
        {
            color = UIColor.blackColor()
        }
        else
        {
            color = UIColor.blueColor()
        }
        
        drawView?.color = color
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

