//
//  LocationTemplateTests.swift
//  MultiMapTests
//
//  Created by Jason on 3/20/22.
//

import XCTest
@testable import MultiMap
 
class LocationTemplateTests: XCTestCase {
    
    func testEmptyInitializer() {
        let location = LocationTemplate()
        XCTAssertEqual(location.name, "")
        XCTAssertEqual(location.streetNum, "")
        XCTAssertEqual(location.streetName, "")
        XCTAssertEqual(location.city, "")
        XCTAssertEqual(location.state, "")
        XCTAssertEqual(location.zip, "")
    }
    
    func testNonEmptyInitializer() {
        let location = LocationTemplate("Bruce Wayne", "123", "Bat Drive", "Gotham City", "NY", "21321")
        XCTAssertEqual(location.name, "Bruce Wayne")
        XCTAssertEqual(location.streetNum, "123")
        XCTAssertEqual(location.streetName, "Bat Drive")
        XCTAssertEqual(location.city, "Gotham City")
        XCTAssertEqual(location.state, "NY")
        XCTAssertEqual(location.zip, "21321")
    }
    
    func testGet2DCoord() {
        let location = LocationTemplate("Bruce Wayne", "800", "N State College Blvd", "Fullerton", "CA", "92831")
        print("Long Lat: \(location.get2DCoord())")
        XCTAssertEqual(location.get2DCoord(), [33.879799, -117.885231])
    }
    
    func testCheckPropertiesTrue() {
        let location = LocationTemplate("Bruce Wayne", "123", "Bat Drive", "Gotham City", "NY", "21321")
        XCTAssertEqual(location.checkProperties(), true)
    }
    
    func testCheckPropertiesFalse() {
        let location = LocationTemplate("Bruce Wayne", "", "Bat Drive", "Gotham City", "NY", "21321")
        let location2 = LocationTemplate()
        XCTAssertEqual(location.checkProperties(), false)
        XCTAssertEqual(location2.checkProperties(), false)
    }
    
    
    
    
}

