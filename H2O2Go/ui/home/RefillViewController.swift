//
//  RefillViewController.swift
//  H2O2Go
//
//  Created by LamAn Wyner on 8/17/19.
//  Copyright © 2019 LamAn Wyner. All rights reserved.
//

import UIKit

class RefillViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var fillFraction: UIPickerView!
    
    let fillFractions: [FillAmount] = [.quarter, .half, .threeQuarters, .full]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fillFraction.delegate = self
        fillFraction.dataSource = self
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 4
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return fillFractions[row].rawValue
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier != nil && segue.identifier == "idLogRefillSegue" {
            if let chosenAmount = pickerView(fillFraction, titleForRow: fillFraction.selectedRow(inComponent: 0), forComponent: 0) {
                CurrentUser.refill(FillAmount(rawValue: chosenAmount)!)
            }
        }
    }
}
