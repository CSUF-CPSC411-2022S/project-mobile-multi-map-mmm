//
//  UserForm.swift
//  Mobile Multi-Map
//
//  Created by Jason on 3/6/22.
//
 
import Foundation
 
 
struct UserForm {
    var name: String
    var age: Int
    var street: String
    var city: String
    var state: String
    var zip: String
    var homeAddress: [String:String] = [:]
    
    init() {
        self.name = "Tuffy Titan"
        self.age = 0
        self.street = "800 N State College Blvd"
        self.city = "Fullerton"
        self.state = "CA"
        self.zip = "92831"
        self.homeAddress[name] = "\(self.street), \(self.city), \(self.state) \(self.zip)"
    }
    
    init(_ name: String, _ age: Int, _ street: String, _ city: String, _ state: String, _ zip: String) {
        self.name = name
        self.age = age
        self.street = street
        self.city = city
        self.state = state
        self.zip = zip
        self.homeAddress[name] = "\(self.street), \(self.city), \(self.state) \(self.zip)"
    }
    
    mutating func changeHomeAddress(_ name: String, _ address: String) {
        self.homeAddress[name] = address
    }
    
    func getName() -> String {
        return self.name
    }
    
    func getHomeAddress(of person: String) -> String {
        return self.homeAddress[person]!
    }
}
 
