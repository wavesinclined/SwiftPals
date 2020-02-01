//
//  InfoPlistHelpers.swift
//  SwiftPals
//
//  Created by Jyotsna on 01/02/20.
//  Copyright © 2020 Jyotsna. All rights reserved.
//

import Foundation
import UIKit

public enum SwiftPalsPListValueType {
    case string
    case boolean
}

open class SwiftPalsInfoPlist {
    static let infoDictionary: [String: Any] = {
           guard let dict = Bundle.main.infoDictionary else {
               fatalError("Plist file not found")
           }
           return dict
       }()
    
    open class func getValue(key: String, forType: SwiftPalsPListValueType) -> Any {
        switch forType {
        case .boolean:
            guard let boolValue = infoDictionary[key] as? Bool else {
                fatalError("SwiftPals Error: - key is not set in plist")
            }
            return boolValue
        case .string:
            guard let stringValue = infoDictionary[key] as? String else {
                fatalError("SwiftPals Error: - key is not set in plist")
            }
            return stringValue
        }
    }
}
