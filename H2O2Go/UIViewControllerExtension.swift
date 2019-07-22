//
//  UIViewControllerExtension.swift
//  H2O2Go
//
//  Created by LamAn Wyner on 7/19/19.
//  Copyright © 2019 LamAn Wyner. All rights reserved.
//

import UIKit

extension UIViewController {
    public func clearAllTextFields() {
        for subview in self.view.subviews {
            if let textfield = subview as? UITextField { textfield.text = nil }
        }
    }
    
    public func performOnAllTextFields(_func: (UITextField) -> Void) {
        for subview in self.view.subviews {
            if let textfield = subview as? UITextField { _func(textfield) }
        }
    }
}
