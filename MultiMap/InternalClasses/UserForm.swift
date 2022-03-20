//
//  UserForm.swift
//  Mobile Multi-Map
//
//  Created by Jason on 3/6/22.
//
 
import Foundation
 
 
class UserForm : LocationTemplate {
    @Published var age: String
    @Published var locationStops: [Location] = []
    
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
    
}
 
