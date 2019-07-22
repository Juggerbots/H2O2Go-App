//
//  UIViewExtension.swift
//  H2O2Go
//
//  Created by LamAn Wyner on 7/22/19.
//  Copyright © 2019 LamAn Wyner. All rights reserved.
//

import UIKit

extension UIView {
    public func setBottomBorder(withColor bgColor: CGColor) {
        let border = CALayer()
        border.frame = CGRect(x: 0, y: frame.height-1, width: frame.width, height: 1)
        border.backgroundColor = bgColor
        layer.addSublayer(border)
        layer.masksToBounds = true
    }
}
