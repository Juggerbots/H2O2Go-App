//
//  HomeViewController.swift
//  H2O2Go
//
//  Created by LamAn Wyner on 7/25/19.
//  Copyright © 2019 LamAn Wyner. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var gallonsLabel: UILabel!
    @IBOutlet weak var bottlesLabel: UILabel!
    @IBOutlet weak var oilLabel: UILabel!
    @IBOutlet weak var moneyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CurrentUser.loadRefills()
        updateStats()
    }
    
    func updateStats() {
        if CurrentUser.nRefills == 0 {
            gallonsLabel.text = "No Gallons"
            bottlesLabel.text = "No Bottles"
            oilLabel.text = "No Barrels"
            moneyLabel.text = "$0"
        } else {
            gallonsLabel.text = "\(String(format: "%.2f", CurrentUser.gallons)) Gallons"
            bottlesLabel.text = "\(String(format: "%.2f", CurrentUser.bottles)) Bottles"
            oilLabel.text = "\(String(format: "%.2f", CurrentUser.barrels)) Barrels"
            moneyLabel.text = "$\(String(format: "%.2f", CurrentUser.money))"
        }
    }
    
    @IBAction func logRefill(_ unwindSegue: UIStoryboardSegue) {
    }
    
    @IBAction func cancelRefill(_ unwindSegue: UIStoryboardSegue) {
    }
    
    @IBAction func unwindFromProfile(_ unwindSegue: UIStoryboardSegue) {
    }
    
    @IBAction func unwindFromMap(_ unwindSegue: UIStoryboardSegue) {
    }
    
}
