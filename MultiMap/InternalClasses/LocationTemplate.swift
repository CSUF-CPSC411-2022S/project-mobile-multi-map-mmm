//
//  LocationTemplate.swift
//  MultiMap
//
//  Created by Armanul Ambia on 3/20/22.
//


import Foundation
import UIKit
import CoreLocation

class LocationTemplate: ObservableObject {
    // Properties of Locations
    @Published var name: String
    @Published var streetNum: String
    @Published var streetName: String
    @Published var city: String
    @Published var state: String
    @Published var zip: String
    var fullAddress: String {
        return "\(self.streetNum) \(self.streetName), \(self.city), \(self.state) \(self.zip)"
    }
    // Initializers
    
    init() {
        self.name = ""
        self.streetNum = ""
        self.streetName = ""
        self.city = ""
        self.state = ""
        self.zip = ""
    }
    
    init( _ name: String, _ streetNum: String, _ streetName: String, _ city: String, _ state: String, _ zip: String) {
        self.name = name
        self.streetNum = streetNum
        self.streetName = streetName
        self.city = city
        self.state = state
        self.zip = zip
    }
    
    // Deinitializer called when user wants to delete a specific location
    deinit {
        print("Deleting location...")
    }
    
    func get2DCoord()-> [Double]{
        let address = "1 Infinite Loop, Cupertino, CA 95014"
        print("{******* \(address)")
        var array: [Double] = []

        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(address) { (placemarks, error) in
            guard
                let placemarks = placemarks,
                let location = placemarks.first?.location
            else {
                // handle no location founddo
                return
            }
            print("*****\(placemarks)")
            print("*****\(location)")
            array.append(location.coordinate.latitude)
            array.append(location.coordinate.longitude)
        }
        return array
    }
    
    func checkProperties() -> Bool{
       return name != "" && 
           streetNum != "" && streetName != ""
            && city != "" && state != "" && zip != ""
    }
    
}
