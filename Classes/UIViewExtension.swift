//
//  UIViewExtension.swift
//
//  Created by Zaber on 4/4/22.
//

import UIKit

extension UIView {
    
    static func identifier()->String {
        return String(describing: self)
    }
    
    static func nib()->UINib {
        return UINib.init(nibName: identifier(), bundle: nil)
    }
    
}
