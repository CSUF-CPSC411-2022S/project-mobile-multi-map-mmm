//
//  LocationsTests.swift
//  Mobile Multi-MapTests
//
//  Created by David Do on 3/6/22.
//

import Foundation
import XCTest
@testable import MultiMap

class LocationsTests: XCTestCase {
    func testNoValue() {
        let test = Location()
        XCTAssertEqual(test.x_loc, 0)
        XCTAssertEqual(test.y_loc, 0)
    }
    
    func testNegativeValue() {
        let test = Location(x: -25, y: 50)
        XCTAssertEqual(test.x_loc, -25)
        XCTAssertEqual(test.y_loc, 50)
        test.y_loc = -100
        XCTAssertEqual(test.y_loc, -100)
    }
    
    func testThirdLocationValue() {
        let test = Location(x: 3, y: 4)
        XCTAssertEqual(test.getThirdLocation(), 5)
        let test2 = Location(x: 6, y: 8)
        XCTAssertEqual(test2.getThirdLocation(), 10)
    }
    
    func testThirdLocationNegativeValue() {
        let test = Location(x: -3, y: -4)
        XCTAssertEqual(test.getThirdLocation(), 5)
    }
}
