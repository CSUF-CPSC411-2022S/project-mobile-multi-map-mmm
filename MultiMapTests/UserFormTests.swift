//
//  UserFormTests.swift
//  Mobile Multi-MapTests
//
//  Created by Jason on 3/6/22.
//
 
import XCTest
@testable import MultiMap
 
class UserFormTests: XCTestCase {
    
    func testEmptyInitializer() {
        let user = UserForm()
        XCTAssertEqual(user.name, "")
        XCTAssertEqual(user.age, "")
        XCTAssertEqual(user.streetNum, "")
        XCTAssertEqual(user.streetName, "")
        XCTAssertEqual(user.city, "")
        XCTAssertEqual(user.state, "")
        XCTAssertEqual(user.zip, "")
        XCTAssertEqual(user.fullAddress, " , ,  ")
        
    }
    
    
    func testNonEmptyInitializer() {
        let user = UserForm("Bruce Wayne", "28", "123", "Bat Drive", "Gotham City", "NY", "21321")
        XCTAssertEqual(user.name, "Bruce Wayne")
        XCTAssertEqual(user.age, "28")
        XCTAssertEqual(user.streetNum, "123")
        XCTAssertEqual(user.streetName, "Bat Drive")
        XCTAssertEqual(user.city, "Gotham City")
        XCTAssertEqual(user.state, "NY")
        XCTAssertEqual(user.zip, "21321")
        XCTAssertEqual(user.fullAddress, "123 Bat Drive, Gotham City, NY 21321")
    }
    
    func testCheckPropertiesTrue() {
        let user = UserForm("Bruce Wayne", "28", "123", "Bat Drive", "Gotham City", "NY", "21321")
        XCTAssertEqual(user.checkProperties(), true)
    }
    
    func testCheckPropertiesFalse() {
        let user = UserForm("Bruce Wayne", "", "123", "Bat Drive", "Gotham City", "NY", "21321")
        let user2 = UserForm()
        XCTAssertEqual(user.checkProperties(), false)
        XCTAssertEqual(user2.checkProperties(), false)
    }
    
    func testAddStop(){
        let user = UserForm("Bruce Wayne", "28", "123", "Bat Drive", "Gotham City", "NY", "21321")
        let location = Location(1, "Irvine Spectrum", "670", "Spectrum Center Dr", "Irvine", "CA", "92618")
        user.addStop(at: location)
        
        XCTAssertEqual(user.locationStops[user.locationStops.count-1].locationNumber, location.locationNumber)
        XCTAssertEqual(user.locationStops[user.locationStops.count-1].name, location.name)
        XCTAssertEqual(user.locationStops[user.locationStops.count-1].streetNum, location.streetNum)
        XCTAssertEqual(user.locationStops[user.locationStops.count-1].streetName, location.streetName)
        XCTAssertEqual(user.locationStops[user.locationStops.count-1].city, location.city)
        XCTAssertEqual(user.locationStops[user.locationStops.count-1].state, location.state)
        XCTAssertEqual(user.locationStops[user.locationStops.count-1].zip, location.zip)
        
    }
    
    func testClearCurrentRoute(){
        let user = UserForm("Bruce Wayne", "28", "123", "Bat Drive", "Gotham City", "NY", "21321")
        let location = Location(1, "Irvine Spectrum", "670", "Spectrum Center Dr", "Irvine", "CA", "92618")
        user.addStop(at: location)
        user.addNewRoute()
        user.clearCurrentRoute()
        XCTAssertEqual(user.locationStops.isEmpty, true)
        XCTAssertEqual(user.coordinateArray.isEmpty, true)
    }
    
    func testAddNewRoute(){
        
        let user = UserForm("Bruce Wayne", "28", "123", "Bat Drive", "Gotham City", "NY", "21321")
        let location = Location(1, "Irvine Spectrum", "670", "Spectrum Center Dr", "Irvine", "CA", "92618")
        user.clearCurrentRoute()
        user.addStop(at: location)
        
        user.addNewRoute()
        
        XCTAssertEqual(user.routes.isEmpty, false)
    }
    
    func testSaveRoute(){
        
        let user = UserForm("Bruce Wayne", "28", "123", "Bat Drive", "Gotham City", "NY", "21321")
        let location = Location(1, "Irvine Spectrum", "670", "Spectrum Center Dr", "Irvine", "CA", "92618")
        user.clearCurrentRoute()
        user.addStop(at: location)
        
        user.saveRoute()
        
        XCTAssertEqual(user.routes.isEmpty, false)
    }
    
}

