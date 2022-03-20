//
//  UserForm.swift
//  Mobile Multi-Map
//
//  Created by Jason on 3/6/22.
//
 
import Foundation
 
 
class UserForm : ObservableObject {
    @Published var name: String
    @Published var age: String
    @Published var streetNum: String
    @Published var streetName: String
    @Published var city: String
    @Published var state: String
    @Published var zip: String
    var fullAddress: String {
        return "\(self.streetNum) \(self.streetName), \(self.city), \(self.state) \(self.zip)"
    }
    
    init() {
        self.name = ""
        self.age = ""
        
        self.streetNum = ""
        self.streetName = ""
        self.city = ""
        self.state = ""
        self.zip = ""
    }
    
    init(_ name: String, _ age: String, _ streetNum: String, _ streetName: String, _ city: String, _ state: String, _ zip: String) {
        self.name = name
        self.age = age
        self.streetNum = streetNum
        self.streetName = streetName
        self.city = city
        self.state = state
        self.zip = zip
    }
    
    
    
    func checkProperties() -> Bool{
       return name != "" && age != "" &&
           streetNum != "" && streetName != ""
            && city != "" && state != "" && zip != ""
    }
    
    
}
 
