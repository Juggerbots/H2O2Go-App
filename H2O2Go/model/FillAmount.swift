//
//  FillAmount.swift
//  H2O2Go
//
//  Created by LamAn Wyner on 9/6/19.
//  Copyright © 2019 LamAn Wyner. All rights reserved.
//

import Foundation

enum FillAmount: String {
    case quarter = "1/4"
    case half = "1/2"
    case threeQuarters = "3/4"
    case full = "Full"
    
    var doubleValue: Double {
        switch self {
        case .quarter:
            return 0.25
        case .half:
            return 0.5
        case .threeQuarters:
            return 0.75
        case .full:
            return 1
        }
    }
    
}
