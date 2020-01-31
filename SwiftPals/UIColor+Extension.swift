//
//  UIColor+Extension.swift
//  SwiftPals
//
//  Created by Jyotsna on 31/01/20.
//  Copyright © 2020 Jyotsna. All rights reserved.
//

import Foundation
import UIKit

open class SwiftPalsColor {
    
   open class func yourColor(fromHexString hexString: String, alpha: CGFloat = 1.0) -> UIColor {
        if hexString.hasPrefix("#") {
            var rgbValue: UInt32 = 0
            let scanner = Scanner(string: hexString)
            scanner.scanLocation = 1
            scanner.scanHexInt32(&rgbValue)
            return UIColor(red: CGFloat(Double(((Int(rgbValue) & 0xff0000) >> 16)) / 255.0), green: CGFloat(Double(((Int(rgbValue) & 0xff00) >> 8)) / 255.0), blue: CGFloat(Double((Int(rgbValue) & 0xff)) / 255.0), alpha: alpha)
        }
        return UIColor.black
    }
    
}
