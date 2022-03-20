//
//  Locations.swift
//  Mobile Multi-Map
//
//  Created by Dinh Do on 3/6/22.
//

import Foundation
import UIKit

class Location: LocationTemplate, Identifiable {
    // Properties of Locations
    @Published var locationNumber: Int
    // Initializers
    init(_ locationNumber: Int, _ name: String, _ streetNum: String, _ streetName: String, _ city: String, _ state: String, _ zip: String) {
        self.locationNumber = locationNumber;
        super.init(name, streetNum, streetName, city, state, zip )
    }

}
