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
    @Published var coordinate: CLLocationCoordinate2D? = nil;
    
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
            print("#: \(loc.locationNumber)\nName: \(loc.name)\nAddress: \(loc.fullAddress)")
        }
    }
    func addStop(at location:Location){
        locationStops.append(location);
        location.get2DCoord(){
            loc in
            if let validLocation = loc {
                self.coordinateArray.append(validLocation)
            }
            else {
                print("Location not returned")
            }
        }
    }
    func exportRoute(){
        var str = ""
        for i in 0...locationStops.count-1{
            str += locationStops[i].fullAddress
            str += "\n"
        }
        let file = "savedRoutes.txt"
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = dir.appendingPathComponent(file)
            do {
                try str.write(to: fileURL, atomically: false, encoding: .utf8)
            }
            catch {
                print("Could Not Export Route")
            }
        }
    }
    func addNewRoute(){
        routes.append(locationStops)
        clearCurrentRoute()
    }
    func saveRoute(){
        if(routes.isEmpty){
            routes.append(locationStops)
            clearCurrentRoute()
        }
        else {
            routes[routes.count-1] = locationStops
        }
    }
    func printCoordinates(){
        if (!coordinateArray.isEmpty){
            for i in 0...coordinateArray.count-1
            {
                print(coordinateArray[i])
            }
        }
        
    }
    func updateCoordinate(){
        print("Update Coordinate Called")
        get2DCoord(){
            loc in
            if let validLocation = loc {
                self.coordinate = validLocation
                print("Updated the coordinate")
            }

        }
    }
    func clearCurrentRoute(){
        locationStops = []
        coordinateArray = []
    }
    func optimizeRoute(){
        
    }
    
}
 
