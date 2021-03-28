//
//  UIButton+Extension.swift
//  Simon Says Challenge
//
//  Created by macbook on 3/28/21.
//

import UIKit

extension UIButton {
    
    // Animating the button to flash once
    func flash(isUser: Bool = false) {
        let flash = CABasicAnimation(keyPath: "opacity")
        
        flash.duration = isUser ? 0.15 : 0.2
        flash.fromValue = 1
        flash.toValue = 0.1
        flash.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        flash.autoreverses = true
        flash.repeatCount = 1
        layer.add(flash, forKey: nil)
    }
}
