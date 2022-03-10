//
//  Locations.swift
//  Mobile Multi-Map
//
//  Created by Dinh Do on 3/6/22.
//

import Foundation
import UIKit

class Locations {
    // Properties of Locations
    var x_loc: Int
    var y_loc: Int
    
    // Initializers
    
    init() {
        self.x_loc = 0
        self.y_loc = 0
    }
    
    init(x: Int, y: Int) {
        self.x_loc = x
        self.y_loc = y
    }
    
    // Deinitializer called when user wants to delete a specific location
    deinit {
        print("Deleting user's specified location...")
    }
    
    func getCurrentLocation() {
        print("The user's current location is (X:\(x_loc), Y:\(y_loc))")
    }
    func getThirdLocation() -> Double {
        let third_loc = ((x_loc * x_loc) + (y_loc * y_loc))
        return sqrt(Double(third_loc))
    }
}
