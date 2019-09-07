//
//  AnnotationViewController.swift
//  H2O2Go
//
//  Created by LamAn Wyner on 9/2/19.
//  Copyright © 2019 LamAn Wyner. All rights reserved.
//

import UIKit
import MapKit

class AnnotationViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        performOnAllTextFields(_func: { textfield in textfield.setBottomBorder(withColor: UIColor.darkGray.cgColor) })
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        
        super.touchesBegan(touches, with: event)
    }
    
}
