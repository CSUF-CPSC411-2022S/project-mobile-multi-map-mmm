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
    
}
