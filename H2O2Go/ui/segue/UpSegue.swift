//
//  UpSegue.swift
//  H2O2Go
//
//  Created by Lâm An Wyner on 9/11/20.
//  Copyright © 2020 LamAn Wyner. All rights reserved.
//

import UIKit

class UpSegue: UIStoryboardSegue {
    
    override func perform() {
        let sourceView = source.view!
        let destinationView = destination.view!
        let screenHeight = UIScreen.main.bounds.height
        
        destinationView.frame = sourceView.frame.offsetBy(dx: 0, dy: screenHeight)
        let window = UIApplication.shared.keyWindow!
        window.insertSubview(destinationView, aboveSubview: sourceView)
        
        UIView.animate(withDuration: 0.4, animations: {
            sourceView.frame = sourceView.frame.offsetBy(dx: 0, dy: -screenHeight)
            destinationView.frame = destinationView.frame.offsetBy(dx: 0, dy: -screenHeight)
        }, completion: { finished in
            self.source.present(self.destination, animated: false, completion: nil)
        })
    }
    
}
