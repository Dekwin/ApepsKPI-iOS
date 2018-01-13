//
//  LocalizationExtension.swift
//  ApepsKPI
//
//  Created by Игорь on 14.01.2018.
//  Copyright © 2018 igor. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    @IBInspectable public var lzText : String? {
        set {
            if newValue != nil {
                self.text = NSLocalizedString(newValue!, comment: "")
            }
        }
        get {
            return self.text
        }
    }
}

extension UIButton {
    @IBInspectable public var lzText : String? {
        set {
            if newValue != nil {
                self.setTitle(NSLocalizedString(newValue!, comment: ""), for: .normal)
            }
        }
        get {
            return self.currentTitle
        }
    }
}

