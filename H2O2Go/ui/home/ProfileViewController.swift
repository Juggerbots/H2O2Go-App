//
//  ProfileViewController.swift
//  H2O2Go
//
//  Created by LamAn Wyner on 9/1/19.
//  Copyright © 2019 LamAn Wyner. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bottelLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileImage.layer.cornerRadius = profileImage.layer.borderWidth/2
        profileImage.clipsToBounds = true
        
        if (CurrentUser.loggedIn) {
            usernameLabel.text = "@\(CurrentUser.username!)"
            nameLabel.text = "\(CurrentUser.firstname!) \(CurrentUser.lastname!)"
            bottelLabel.text = "\(CurrentUser.bottleSize)"
        }
    }
    
}
