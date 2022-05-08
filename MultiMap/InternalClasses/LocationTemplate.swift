//
//  LocationTemplate.swift
//  MultiMap
//
//  Created by Armanul Ambia on 3/20/22.
//


import Foundation
import UIKit
import CoreLocation
import Dispatch

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
    
    // This method uses swift closure and the @escaping keyword to return the 2Dcoord of a location
    func get2DCoord(completion: @escaping (_ loc: CLLocationCoordinate2D?) -> Void) {
        
        let address = fullAddress;

        let geoCoder = CLGeocoder()
        // this method takes in a closure as teh last parameter and calls the completion
        geoCoder.geocodeAddressString(address) { (placemarks, error) in
            guard let placemarks = placemarks,
            let loc = placemarks.first?.location?.coordinate else {
                completion(nil)
                return
            }
            print("inside location", loc)
            completion(loc)
        }
        
        
    }
    
    func checkProperties() -> Bool{
       return name != "" && 
           streetNum != "" && streetName != ""
            && city != "" && state != "" && zip != ""
    }
    
}
