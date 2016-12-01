//
//  DirectionsTests.swift
//  DirectionsTests
//
//  Created by Jonathon Day on 12/1/16.
//  Copyright © 2016 dayj. All rights reserved.
//

import XCTest
@testable import Directions

class DirectionsTests: XCTestCase {
    func testNorthTurnLeft() {
        let result = turn(.left, currentOrientation: .north)
        let expected: Direction = .west
        XCTAssertEqual(result, expected)
    }
    
}
