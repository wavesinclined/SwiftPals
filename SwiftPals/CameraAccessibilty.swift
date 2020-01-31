//
//  CameraAccessibilty.swift
//  SwiftPals
//
//  Created by Jyotsna on 31/01/20.
//  Copyright © 2020 Jyotsna. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

open class SwiftPalsCheckCamera{
    open func isEnabled() -> Bool {
        var isEnabled: Bool = false
        if AVCaptureDevice.authorizationStatus(for: .video) == .denied { }
        
        if AVCaptureDevice.authorizationStatus(for: .video) ==  .authorized {
            isEnabled = true
        } else {
            AVCaptureDevice.requestAccess(for: .video, completionHandler: { (granted: Bool) in
                if granted {
                    isEnabled = true
                }
            })
        }
        return isEnabled
    }
}
