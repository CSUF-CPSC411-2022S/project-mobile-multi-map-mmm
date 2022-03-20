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
    
    func testNonEmptyInitializer() {
        let location = Location(1, "Irvine Spectrum", "670", "Spectrum Center Dr.", "Irvine", "CA", "92618")
        XCTAssertEqual(location.locationNumber, 1)
        XCTAssertEqual(location.name, "Irvine Spectrum")
        XCTAssertEqual(location.streetNum, "670")
        XCTAssertEqual(location.streetName, "Spectrum Center Dr.")
        XCTAssertEqual(location.city, "Irvine")
        XCTAssertEqual(location.state, "CA")
        XCTAssertEqual(location.zip, "92618")
    }

}
