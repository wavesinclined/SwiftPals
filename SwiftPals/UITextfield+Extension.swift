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

   open func checkMaxLength(maxLength: Int, inputString: String) -> Bool {
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

class UnderlinedTextField: UITextField {
    
    private let defaultUnderlineColor = UIColor.black
    private let bottomLine = UIView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        borderStyle = .none
        bottomLine.translatesAutoresizingMaskIntoConstraints = false
        bottomLine.backgroundColor = defaultUnderlineColor

        self.addSubview(bottomLine)
        bottomLine.topAnchor.constraint(equalTo: self.bottomAnchor, constant: 1).isActive = true
        bottomLine.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        bottomLine.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        bottomLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setUnderlineColor(color: UIColor) {
        bottomLine.backgroundColor = color
    }

    public func setDefaultUnderlineColor() {
        bottomLine.backgroundColor = defaultUnderlineColor
    }
}
