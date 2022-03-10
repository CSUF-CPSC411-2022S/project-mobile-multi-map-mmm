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
        XCTAssertEqual(user.name, "Tuffy Titan")
        XCTAssertEqual(user.age, 0)
        XCTAssertEqual(user.street, "800 N State College Blvd")
        XCTAssertEqual(user.city, "Fullerton")
        XCTAssertEqual(user.state, "CA")
        XCTAssertEqual(user.zip, "92831")
        XCTAssertEqual(user.homeAddress[user.name], "800 N State College Blvd, Fullerton, CA 92831")
    }
    
    func testNonEmptyInitializer() {
        let user = UserForm("Bruce Wayne", 28, "123 Bat Drive", "Gotham City", "NY", "21321")
        XCTAssertEqual(user.name, "Bruce Wayne")
        XCTAssertEqual(user.age, 28)
        XCTAssertEqual(user.street, "123 Bat Drive")
        XCTAssertEqual(user.city, "Gotham City")
        XCTAssertEqual(user.state, "NY")
        XCTAssertEqual(user.zip, "21321")
        XCTAssertEqual(user.homeAddress[user.name], "123 Bat Drive, Gotham City, NY 21321")
    }
    
    func testChangeHomeAddress() {
        var user = UserForm("Bruce Wayne", 28, "123 Bat Drive", "Gotham City", "NY", "21321")
        user.changeHomeAddress(user.getName(), "1007 Mountain Drive, Gotham City, CA 12312")
        XCTAssertEqual(user.getHomeAddress(of: "Bruce Wayne"), "1007 Mountain Drive, Gotham City, CA 12312")
    }
}
