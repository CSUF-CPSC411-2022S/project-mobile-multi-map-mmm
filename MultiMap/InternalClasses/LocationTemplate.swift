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
        let geocoder = CLGeocoder()
        var array: [Double] = []
        geocoder.geocodeAddressString("your address") {
            placemarks, error in
            let placemark = placemarks?.first
            let lat = placemark?.location?.coordinate.latitude
            let lon = placemark?.location?.coordinate.longitude
            if let validLat = lat {
                array.append(validLat)
            }
            if let validLon = lon {
                array.append(validLon)
            }
        }
        return array
    }
    
    func checkProperties() -> Bool{
       return name != "" && 
           streetNum != "" && streetName != ""
            && city != "" && state != "" && zip != ""
    }
    
}
