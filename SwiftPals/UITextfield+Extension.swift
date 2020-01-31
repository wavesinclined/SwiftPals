//
//  UITextfield+Extension.swift
//  SwiftPals
//
//  Created by Jyotsna on 30/01/20.
//  Copyright © 2020 Jyotsna. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {

   public func swiftPalsCheckMaxLength(maxLength: Int, inputString: String) -> Bool {
        guard let prospectiveText = self.text else {
            return true
        }
        var newtext = prospectiveText + inputString
        if prospectiveText.count == maxLength && newtext.count > maxLength {
            return false
        }
        if newtext.count <= maxLength {
            return true
        }
        let indexEndOfText = newtext.index(newtext.startIndex, offsetBy: maxLength - 1)
        let substring = newtext[..<indexEndOfText]
        newtext = String(substring)
        self.text = newtext
        return false
    }

}
