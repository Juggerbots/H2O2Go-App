//
//  UIViewExtension.swift
//  H2O2Go
//
//  Created by LamAn Wyner on 7/22/19.
//  Copyright © 2019 LamAn Wyner. All rights reserved.
//

import UIKit

extension UIView {
    
    var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        
        while parentResponder != nil {
            parentResponder = parentResponder!.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        
        return nil
    }
    
    public func setBottomBorder(withColor bgColor: CGColor) {
        let border = CALayer()
        border.frame = CGRect(x: 0, y: frame.height-1, width: frame.width, height: 1)
        border.backgroundColor = bgColor
        layer.addSublayer(border)
        layer.masksToBounds = true
    }
    
}
