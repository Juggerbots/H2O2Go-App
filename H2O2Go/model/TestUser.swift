//
//  TestUser.swift
//  H2O2Go
//
//  Created by LamAn Wyner on 8/28/19.
//  Copyright © 2019 LamAn Wyner. All rights reserved.
//

@available(swift, deprecated: 0.1, message: "Sign into registered account instead")
class TestUser {
    
    private(set) static var bottleSize: Double = 18
    private(set) static var nRefills: Double = 0
    static var refillOz: Double {
        return bottleSize * nRefills
    }
    static var gallons: Double {
        return refillOz / 128
    }
    static var bottles: Double {
        return refillOz / 16.9
    }
    static var barrels: Double {
        return (refillOz / (16.9/4)) / (128*42)
    }
    static var money: Double {
        return bottles * 1.45
    }
    
    static func refill(_ amount: String) {
        switch amount {
            case "1/4":
                nRefills += 0.25
            case "1/2":
                nRefills += 0.5
            case "3/4":
                nRefills += 0.75
            case "Full":
                nRefills += 1
            default:
                nRefills += 0
        }
    }
    
    static func changeBottleSize(to newSize: Double) {
        bottleSize = newSize
    }
    
}
