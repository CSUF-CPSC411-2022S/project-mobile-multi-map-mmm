//
//  UserForm.swift
//  Mobile Multi-Map
//
//  Created by Jason on 3/6/22.
//
 
import Foundation
import MapKit
 
class UserForm : LocationTemplate {
    @Published var age: String
    @Published var locationStops: [Location] = []
    @Published var coordinateArray: [CLLocationCoordinate2D] = []
    @Published var routes: [[Location]] = []
    
    override init() {
        self.age = ""
        super.init()
    }
    
    init(_ name: String, _ age: String, _ streetNum: String, _ streetName: String, _ city: String, _ state: String, _ zip: String) {
        self.age = age
        super.init(name, streetNum, streetName, city, state, zip )
    }
    override func checkProperties() -> Bool{
        let answer = super.checkProperties() && age != ""
        return answer
    }
    func printLocations(){
        print("My name is \(name) and I am \(age) years old.")
        print("\(fullAddress)\n")
        locationStops.forEach{
            loc in
            print("Number: \(loc.locationNumber), Address: \(loc.fullAddress)")
        }
    }
    func addStop(at location:Location){
        locationStops.append(location);
        coordinateArray.append(location.get2DCoord())
    }
    func saveRoute(){
        routes.append(locationStops)
       
    }
    func clearRoute(){
        locationStops = []
        coordinateArray = []
    }
    func optimizeRoute(){
        var start: CLLocationCoordinate2D = get2DCoord()
        for i in 0...coordinateArray.count-1
        {
         
        }
        // create your route Polyline
        

        // first remove previously added overlays if any then add your newly created route polyline
        
    }
    
}
 
