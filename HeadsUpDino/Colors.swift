//
//  Colors.swift
//  HeadsUpDino
//
//  Created by Samantha John on 11/21/15.
//  Copyright © 2015 Quadceratops. All rights reserved.
//
import UIKit

extension UIColor {
    class func QBlue() -> UIColor {
        return UIColor.color(red: 29, green: 93, blue: 222)
    }
    
    class func QGreen() -> UIColor {
        return UIColor.color(red: 65, green: 117, blue: 5)
    }
    
    class func QOrange() -> UIColor {
        return UIColor.color(red: 200, green: 90, blue: 0)
    }
    
    class func QRed() -> UIColor {
        return UIColor.color(red: 239, green: 52, blue: 27)
    }
    
    private class func color(red red: CGFloat, green: CGFloat, blue: CGFloat)-> UIColor {
        let divisor = CGFloat(255)
        
        return UIColor(red: red/divisor, green: green/divisor, blue: blue/divisor, alpha: 1)
    }
}
