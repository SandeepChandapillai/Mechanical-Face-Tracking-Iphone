//
//  DrawView.swift
//  Drawing
//
//  Created by Sandeep on 9/21/14.
//  Copyright (c) 2014 Sandeep. All rights reserved.
//

import UIKit

class DrawView: UIView
{
    
   // override init(frame: CGRect) { super.init(frame: frame)
  //   println("override init(frame: CGRect)")
  //  }
    var lines:[Line] = []
    var lastPoint: CGPoint!
    var newPoint: CGPoint!
    var color: UIColor!

    required init(coder aDecoder: NSCoder)
    {
         super.init(coder: aDecoder)
        println("required init(coder aDecoder: NSCoder)")                   //DEBUG
        self.backgroundColor = UIColor.yellowColor()
        color = UIColor.blueColor()
       
    }

    
    
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent)
    {
        lastPoint = touches.anyObject()?.locationInView(self)
        
    }
    
    override func touchesMoved(touches: NSSet, withEvent event: UIEvent)
    {
        newPoint = touches.anyObject()?.locationInView(self)
        lines.append(Line(start: lastPoint, end: newPoint , color :self.color))
        lastPoint = newPoint
        
        self.setNeedsDisplay()
    }
    
    override func drawRect(rect: CGRect)
    {
        var context = UIGraphicsGetCurrentContext()
        CGContextBeginPath(context)
        CGContextSetLineCap(context, kCGLineCapRound)
        
        CGContextSetLineWidth(context, 5)
        for line in lines
        {
            CGContextMoveToPoint(context, line.start.x, line.start.y)
            CGContextAddLineToPoint(context, line.end.x, line.end.y)
            CGContextSetStrokeColorWithColor(context, line.color.CGColor)
            CGContextStrokePath(context)
 
        }
        
            }
    
  
}
