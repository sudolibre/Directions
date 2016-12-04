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
    
    func testSimplifyTurnBasedDirections() {
        let directions: [(Turn, Int)] = [(.left, 4), (.left, 4), (.left, 5), (.right, 5), (.right, 4), (.left, 4), (.right, 5), (.right, 4), (.right, 2), (.left, 3), (.right, 1), (.right, 1), (.left, 4), (.left, 5), (.right, 3), (.left, 1), (.left, 1), (.right, 4), (.left, 2), (.right, 1), (.right, 4), (.right, 4), (.left, 2), (.left, 2), (.right, 4), (.left, 4), (.right, 1), (.right, 3), (.left, 3), (.left, 1), (.left, 2), (.right, 1), (.right, 5), (.left, 5), (.left, 1), (.left, 1), (.right, 3), (.right, 5), (.left, 1), (.right, 4), (.left, 5), (.right, 5), (.right, 1), (.left, 185), (.right, 4), (.left, 1), (.right, 51), (.left, 2), (.right, 78), (.right, 1), (.left, 4), (.right, 188), (.right, 1), (.left, 5), (.right, 5), (.right, 2), (.right, 3), (.left, 5), (.right, 3), (.right, 4), (.left, 1), (.right, 2), (.right, 2), (.right, 3), (.right, 2), (.left, 5), (.right, 2), (.left, 1), (.left, 4), (.right, 4), (.left, 4), (.right, 2), (.left, 3), (.left, 4), (.right, 2), (.left, 3), (.right, 3), (.right, 2), (.left, 2), (.left, 3), (.right, 4), (.right, 3), (.right, 1), (.left, 4), (.left, 2), (.left, 5), (.right, 4), (.right, 4), (.left, 1), (.right, 1), (.left, 5), (.left, 1), (.right, 3), (.right, 1), (.left, 2), (.right, 1), (.right, 1), (.right, 3), (.left, 4), (.left, 1), (.left, 3), (.right, 2), (.right, 4), (.right, 2), (.left, 2), (.right, 1), (.left, 5), (.right, 3), (.left, 3), (.right, 3), (.left, 1), (.right, 4), (.left, 3), (.left, 3), (.right, 4), (.left, 2), (.left, 1), (.left, 3), (.right, 2), (.right, 3), (.left, 2), (.left, 1), (.right, 4), (.left, 3), (.left, 5), (.left, 2), (.left, 4), (.right, 1), (.left, 4), (.left, 4), (.right, 3), (.right, 5), (.left, 4), (.left, 1), (.left, 1), (.right, 4), (.left, 2), (.right, 5), (.right, 1), (.right, 1), (.right, 2), (.right, 1), (.right, 5), (.left, 1), (.left, 3), (.left, 5), (.right, 2), (.left, 4), (.left, 4), (.left, 5), (.right, 5), (.right, 4), (.left, 4), (.right, 5), (.right, 4), (.right, 2), (.left, 3), (.right, 1), (.right, 1), (.left, 4), (.left, 5), (.right, 3), (.left, 1), (.left, 1), (.right, 4), (.left, 2), (.right, 1), (.right, 4), (.right, 4), (.left, 2), (.left, 2), (.right, 4), (.left, 4), (.right, 1), (.right, 3), (.left, 3), (.left, 1), (.left, 2), (.right, 1), (.right, 5), (.left, 5), (.left, 1), (.left, 1), (.right, 3), (.right, 5), (.left, 1), (.right, 4), (.left, 5), (.right, 5), (.right, 1), (.left, 185), (.right, 4), (.left, 1), (.right, 51)]
        let result = simplifyTurnBasedDirections(directions: directions).location
        let expected: Location = (327, -43)
        XCTAssertEqual(result.x, expected.x)
        XCTAssertEqual(result.y, result.y)
    }
    
    func testSimplifyCardinalBasedDirections() {
        let directions: [(Orientation, Int)] = [(.east, 5), (.east, 3), (.north, 8), (.north, 7), (.east, 2), (.south, 2), (.west, 5)]
        let result = simplifyCardinalBasedDirections(directions: directions)
        let expected: Location = (5, 13)
        XCTAssertEqual(result.x, expected.x)
        XCTAssertEqual(result.y, expected.y)
    }
    func testSimplifyCardinalBasedDirections2() {
        let directions: [(Orientation, Int)] = [(.east, 28), (.east, 8), (.north, 80), (.north, 7), (.east, 12), (.south, 21), (.west, 25), (.north, 29), (.east, 15), (.north, 58), (.east, 66), (.west, 16), (.south, 87), (.west, 1), (.east, 11), (.south, 99), (.west, 92), (.east, 55), (.north, 15), (.north, 23), (.north, 11), (.north, 28), (.south, 32), (.north, 9), (.south, 48), (.west, 9), (.east, 35), (.south, 68), (.north, 5), (.west, 81), (.north, 52), (.south, 9), (.east, 79), (.north, 22), (.west, 55), (.west, 29), (.south, 46), (.north, 76), (.north, 79), (.east, 4), (.east, 51), (.south, 18), (.north, 86), (.south, 39), (.north, 48), (.west, 35), (.west, 69), (.west, 76), (.north, 9), (.north, 58), (.east, 78), (.north, 84), (.east, 65), (.west, 65), (.west, 48), (.east, 97), (.north, 13), (.north, 40), (.north, 94), (.west, 22), (.west, 10), (.east, 67), (.south, 56), (.east, 92), (.east, 20), (.north, 31), (.north, 47), (.east, 16), (.west, 75), (.west, 28), (.north, 19), (.west, 6), (.east, 42), (.east, 83), (.north, 47), (.north, 17), (.north, 38), (.north, 28), (.north, 43), (.north, 95), (.west, 27), (.west, 30), (.south, 7), (.east, 17), (.north, 97), (.north, 12), (.north, 17), (.north, 8), (.south, 37), (.west, 41), (.east, 14), (.east, 68), (.north, 51), (.east, 57), (.west, 21), (.north, 55), (.west, 94), (.south, 61), (.south, 14), (.west, 9), (.south, 78), (.north, 94), (.north, 70), (.east, 36), (.east, 71), (.west, 75), (.north, 99), (.east, 22), (.north, 22), (.west, 42), (.north, 24), (.south, 17), (.east, 0), (.south, 20), (.east, 95), (.east, 94), (.south, 89), (.north, 74), (.south, 44), (.north, 82), (.south, 17), (.north, 28), (.south, 16), (.south, 51), (.south, 97), (.north, 2), (.north, 53), (.north, 33), (.south, 51), (.south, 7), (.south, 12), (.west, 69), (.west, 14), (.north, 17), (.south, 64), (.west, 10), (.east, 18), (.south, 36), (.north, 91), (.north, 2), (.north, 95), (.east, 64), (.west, 88), (.east, 13), (.east, 7), (.south, 85), (.north, 71), (.east, 38), (.south, 83), (.west, 87)]
        let result = simplifyCardinalBasedDirections(directions: directions)
        let expected: Location = (189, 979)
        XCTAssertEqual(result.x, expected.x)
        XCTAssertEqual(result.y, expected.y)
    }
    
    func testMoveDistanceNorth() {
        var location: Location = (0,0)
        let blocks = 5
        let result = moveDistance(from: &location, orientation: .north, blocks: blocks)
        let expected: Location = (0,5)
        XCTAssertEqual(result.x, expected.x)
        XCTAssertEqual(result.y, expected.y)
    }
    
    func testMoveDistanceSouth() {
        var location: Location = (0,0)
        let blocks = 5
        let result = moveDistance(from: &location, orientation: .south, blocks: blocks)
        let expected: Location = (0,-5)
        XCTAssertEqual(result.x, expected.x)
        XCTAssertEqual(result.y, expected.y)
    }
    func testMoveDistanceEast() {
        var location: Location = (0,0)
        let blocks = 5
        let result = moveDistance(from: &location, orientation: .east, blocks: blocks)
        let expected: Location = (5,0)
        XCTAssertEqual(result.x, expected.x)
        XCTAssertEqual(result.y, expected.y)
    }
    func testMoveDistanceWest() {
        var location: Location = (0,0)
        let blocks = 5
        let result = moveDistance(from: &location, orientation: .west, blocks: blocks)
        let expected: Location = (-5,0)
        XCTAssertEqual(result.x, expected.x)
        XCTAssertEqual(result.y, expected.y)
    }
    
    func testGiveDirectionsTurnBased() {
        let directions: [(Turn, Int)] = [(.left, 4), (.left, 4), (.left, 5), (.right, 5), (.right, 4), (.left, 4), (.right, 5), (.right, 4), (.right, 2), (.left, 3), (.right, 1), (.right, 1), (.left, 4), (.left, 5), (.right, 3), (.left, 1), (.left, 1), (.right, 4), (.left, 2), (.right, 1), (.right, 4), (.right, 4), (.left, 2), (.left, 2), (.right, 4), (.left, 4), (.right, 1), (.right, 3), (.left, 3), (.left, 1), (.left, 2), (.right, 1), (.right, 5), (.left, 5), (.left, 1), (.left, 1), (.right, 3), (.right, 5), (.left, 1), (.right, 4), (.left, 5), (.right, 5), (.right, 1), (.left, 185), (.right, 4), (.left, 1), (.right, 51), (.left, 2), (.right, 78), (.right, 1), (.left, 4), (.right, 188), (.right, 1), (.left, 5), (.right, 5), (.right, 2), (.right, 3), (.left, 5), (.right, 3), (.right, 4), (.left, 1), (.right, 2), (.right, 2), (.right, 3), (.right, 2), (.left, 5), (.right, 2), (.left, 1), (.left, 4), (.right, 4), (.left, 4), (.right, 2), (.left, 3), (.left, 4), (.right, 2), (.left, 3), (.right, 3), (.right, 2), (.left, 2), (.left, 3), (.right, 4), (.right, 3), (.right, 1), (.left, 4), (.left, 2), (.left, 5), (.right, 4), (.right, 4), (.left, 1), (.right, 1), (.left, 5), (.left, 1), (.right, 3), (.right, 1), (.left, 2), (.right, 1), (.right, 1), (.right, 3), (.left, 4), (.left, 1), (.left, 3), (.right, 2), (.right, 4), (.right, 2), (.left, 2), (.right, 1), (.left, 5), (.right, 3), (.left, 3), (.right, 3), (.left, 1), (.right, 4), (.left, 3), (.left, 3), (.right, 4), (.left, 2), (.left, 1), (.left, 3), (.right, 2), (.right, 3), (.left, 2), (.left, 1), (.right, 4), (.left, 3), (.left, 5), (.left, 2), (.left, 4), (.right, 1), (.left, 4), (.left, 4), (.right, 3), (.right, 5), (.left, 4), (.left, 1), (.left, 1), (.right, 4), (.left, 2), (.right, 5), (.right, 1), (.right, 1), (.right, 2), (.right, 1), (.right, 5), (.left, 1), (.left, 3), (.left, 5), (.right, 2), (.left, 4), (.left, 4), (.left, 5), (.right, 5), (.right, 4), (.left, 4), (.right, 5), (.right, 4), (.right, 2), (.left, 3), (.right, 1), (.right, 1), (.left, 4), (.left, 5), (.right, 3), (.left, 1), (.left, 1), (.right, 4), (.left, 2), (.right, 1), (.right, 4), (.right, 4), (.left, 2), (.left, 2), (.right, 4), (.left, 4), (.right, 1), (.right, 3), (.left, 3), (.left, 1), (.left, 2), (.right, 1), (.right, 5), (.left, 5), (.left, 1), (.left, 1), (.right, 3), (.right, 5), (.left, 1), (.right, 4), (.left, 5), (.right, 5), (.right, 1), (.left, 185), (.right, 4), (.left, 1), (.right, 51)]
        let result = giveDirections(directions: directions)
        let expected = "Go East for 327 blocks and then South for 43 blocks"
        XCTAssertEqual(result, expected)
    }
    
    func testGiveDirectionsCardinalBased() {
        let directions: [(Orientation, Int)] = [(.east, 28), (.east, 8), (.north, 80), (.north, 7), (.east, 12), (.south, 21), (.west, 25), (.north, 29), (.east, 15), (.north, 58), (.east, 66), (.west, 16), (.south, 87), (.west, 1), (.east, 11), (.south, 99), (.west, 92), (.east, 55), (.north, 15), (.north, 23), (.north, 11), (.north, 28), (.south, 32), (.north, 9), (.south, 48), (.west, 9), (.east, 35), (.south, 68), (.north, 5), (.west, 81), (.north, 52), (.south, 9), (.east, 79), (.north, 22), (.west, 55), (.west, 29), (.south, 46), (.north, 76), (.north, 79), (.east, 4), (.east, 51), (.south, 18), (.north, 86), (.south, 39), (.north, 48), (.west, 35), (.west, 69), (.west, 76), (.north, 9), (.north, 58), (.east, 78), (.north, 84), (.east, 65), (.west, 65), (.west, 48), (.east, 97), (.north, 13), (.north, 40), (.north, 94), (.west, 22), (.west, 10), (.east, 67), (.south, 56), (.east, 92), (.east, 20), (.north, 31), (.north, 47), (.east, 16), (.west, 75), (.west, 28), (.north, 19), (.west, 6), (.east, 42), (.east, 83), (.north, 47), (.north, 17), (.north, 38), (.north, 28), (.north, 43), (.north, 95), (.west, 27), (.west, 30), (.south, 7), (.east, 17), (.north, 97), (.north, 12), (.north, 17), (.north, 8), (.south, 37), (.west, 41), (.east, 14), (.east, 68), (.north, 51), (.east, 57), (.west, 21), (.north, 55), (.west, 94), (.south, 61), (.south, 14), (.west, 9), (.south, 78), (.north, 94), (.north, 70), (.east, 36), (.east, 71), (.west, 75), (.north, 99), (.east, 22), (.north, 22), (.west, 42), (.north, 24), (.south, 17), (.east, 0), (.south, 20), (.east, 95), (.east, 94), (.south, 89), (.north, 74), (.south, 44), (.north, 82), (.south, 17), (.north, 28), (.south, 16), (.south, 51), (.south, 97), (.north, 2), (.north, 53), (.north, 33), (.south, 51), (.south, 7), (.south, 12), (.west, 69), (.west, 14), (.north, 17), (.south, 64), (.west, 10), (.east, 18), (.south, 36), (.north, 91), (.north, 2), (.north, 95), (.east, 64), (.west, 88), (.east, 13), (.east, 7), (.south, 85), (.north, 71), (.east, 38), (.south, 83), (.west, 87)]
        let result = giveDirections(directions: directions)
        let expected = "Go East for 189 blocks and then North for 979 blocks"
        XCTAssertEqual(result, expected)
    }
    
    func testTurnLeftFromOrientationNorth() {
        let orientation: Orientation = .north
        let result = orientation.turn(.left)
        let expected = Orientation.west
        XCTAssertEqual(result, expected)
        
    }
    func testTurnRightFromOrientationNorth() {
        let orientation: Orientation = .north
        let result = orientation.turn(.right)
        let expected = Orientation.east
        XCTAssertEqual(result, expected)
        
    }
    func testTurnLeftFromOrientationSouth() {
        let orientation: Orientation = .south
        let result = orientation.turn(.left)
        let expected = Orientation.east
        XCTAssertEqual(result, expected)
        
    }
    func testTurnRightFromOrientationSouth() {
        let orientation: Orientation = .south
        let result = orientation.turn(.right)
        let expected = Orientation.west
        XCTAssertEqual(result, expected)
        
    }
    func testTurnLeftFromOrientationEast() {
        let orientation: Orientation = .east
        let result = orientation.turn(.left)
        let expected = Orientation.north
        XCTAssertEqual(result, expected)
        
    }
    func testTurnRightFromOrientationEast() {
        let orientation: Orientation = .east
        let result = orientation.turn(.right)
        let expected = Orientation.south
        XCTAssertEqual(result, expected)
        
    }
    func testTurnLeftFromOrientationWest() {
        let orientation: Orientation = .west
        let result = orientation.turn(.left)
        let expected = Orientation.south
        XCTAssertEqual(result, expected)
        
    }
    func testTurnRightFromOrientationWest() {
        let orientation: Orientation = .west
        let result = orientation.turn(.right)
        let expected = Orientation.north
        XCTAssertEqual(result, expected)
        
    }
    
    func testSimplifyMixedBasedDirections() {
        let directions: [(Any, Int)] = [(Orientation.east, 5), (Turn.right, 3), (Orientation.west, 2), (Turn.left, 5), (Orientation.east, 2), (Orientation.south, 3)]
        let result = simplifyMixedBasedDirections(directions: directions).location
        let expected: Location = (5, -11)
        XCTAssertEqual(result.x, expected.x)
        XCTAssertEqual(result.y, expected.y)
    }
    
    func testSimplifyMixedBasedDirections2() {
        let directions: [(Any, Int)] = [(Turn.right, 87),
                                        (Turn.right, 12),
                                        (Orientation.south, 39),
                                        (Turn.left, 52),
                                        (Turn.right, 45),
                                        (Orientation.east, 34),
                                        (Orientation.east, 62),
                                        (Turn.right, 33),
                                        (Turn.right, 20),
                                        (Turn.left, 42),
                                        (Orientation.south, 6),
                                        (Orientation.west, 26),
                                        (Orientation.west, 55),
                                        (Orientation.south, 91),
                                        (Turn.left, 18),
                                        (Orientation.south, 10),
                                        (Orientation.east, 61),
                                        (Orientation.west, 82),
                                        (Turn.right, 54),
                                        (Orientation.east, 46),
                                        (Turn.left, 49),
                                        (Orientation.south, 71),
                                        (Turn.left, 38),
                                        (Orientation.south, 35),
                                        (Orientation.east, 87),
                                        (Orientation.south, 35),
                                        (Turn.left, 12),
                                        (Orientation.north, 97),
                                        (Orientation.south, 46),
                                        (Turn.right, 61),
                                        (Turn.right, 59),
                                        (Turn.right, 13),
                                        (Orientation.north, 58),
                                        (Orientation.west, 2),
                                        (Orientation.east, 10),
                                        (Turn.left, 56),
                                        (Turn.right, 53),
                                        (Orientation.east, 42),
                                        (Orientation.north, 88),
                                        (Orientation.north, 60),
                                        (Orientation.east, 87),
                                        (Orientation.north, 15),
                                        (Orientation.north, 20),
                                        (Orientation.west, 92),
                                        (Orientation.north, 62),
                                        (Orientation.north, 39),
                                        (Turn.left, 95),
                                        (Turn.right, 4),
                                        (Orientation.west, 62),
                                        (Turn.right, 29),
                                        (Orientation.north, 72),
                                        (Turn.right, 31),
                                        (Turn.left, 72),
                                        (Orientation.north, 29),
                                        (Turn.right, 30),
                                        (Turn.left, 41),
                                        (Orientation.north, 80),
                                        (Turn.right, 22),
                                        (Orientation.west, 65),
                                        (Orientation.south, 99),
                                        (Orientation.east, 31),
                                        (Turn.right, 19),
                                        (Orientation.north, 80),
                                        (Orientation.west, 43),
                                        (Orientation.east, 96),
                                        (Turn.left, 88),
                                        (Orientation.north, 77),
                                        (Orientation.east, 41),
                                        (Orientation.south, 76),
                                        (Turn.right, 65),
                                        (Orientation.south, 48),
                                        (Turn.left, 71),
                                        (Turn.right, 96),
                                        (Orientation.east, 85),
                                        (Orientation.east, 29),
                                        (Orientation.south, 45),
                                        (Turn.left, 70),
                                        (Orientation.south, 23),
                                        (Turn.left, 3),
                                        (Orientation.west, 26),
                                        (Orientation.east, 83),
                                        (Orientation.west, 65),
                                        (Orientation.north, 20),
                                        (Orientation.north, 76),
                                        (Turn.left, 9),
                                        (Turn.left, 6),
                                        (Turn.left, 16),
                                        (Orientation.south, 75),
                                        (Turn.left, 73),
                                        (Turn.left, 16),
                                        (Turn.right, 15),
                                        (Orientation.east, 73),
                                        (Orientation.south, 46),
                                        (Turn.right, 22),
                                        (Orientation.east, 78),
                                        (Turn.left, 70),
                                        (Turn.right, 10),
                                        (Orientation.north, 97),
                                        (Orientation.west, 18),
                                        (Orientation.south, 23),
                                        (Orientation.north, 9),
                                        (Orientation.west, 21),
                                        (Turn.right, 58),
                                        (Orientation.east, 21),
                                        (Orientation.south, 22),
                                        (Orientation.south, 35),
                                        (Orientation.west, 37),
                                        (Orientation.north, 33),
                                        (Orientation.south, 51),
                                        (Turn.left, 48),
                                        (Orientation.south, 18),
                                        (Orientation.south, 97),
                                        (Orientation.east, 41),
                                        (Orientation.east, 98),
                                        (Orientation.south, 14),
                                        (Orientation.north, 32),
                                        (Orientation.west, 10),
                                        (Orientation.east, 70),
                                        (Turn.left, 38),
                                        (Orientation.east, 2),
                                        (Orientation.west, 6),
                                        (Orientation.south, 25),
                                        (Orientation.east, 16),
                                        (Orientation.west, 39),
                                        (Orientation.south, 70),
                                        (Turn.left, 38),
                                        (Turn.left, 21),
                                        (Turn.left, 91),
                                        (Orientation.east, 33),
                                        (Turn.right, 90),
                                        (Turn.right, 31),
                                        (Turn.left, 57),
                                        (Turn.left, 68),
                                        (Orientation.north, 31),
                                        (Orientation.west, 52),
                                        (Orientation.north, 79),
                                        (Orientation.south, 6),
                                        (Orientation.south, 5),
                                        (Orientation.north, 41),
                                        (Turn.right, 67),
                                        (Orientation.west, 8),
                                        (Orientation.north, 55),
                                        (Turn.left, 21),
                                        (Turn.right, 38),
                                        (Orientation.north, 85),
                                        (Orientation.north, 7),
                                        (Turn.left, 6),
                                        (Orientation.north, 21),
                                        (Turn.left, 55),
                                        (Orientation.north, 85),
                                        (Turn.left, 66),
                                        (Orientation.east, 6),
                                        (Orientation.north, 38),
                                        (Orientation.east, 7),
                                        (Turn.left, 50),
                                        (Turn.right, 63),
                                        (Turn.right, 94),
                                        (Orientation.east, 70),
                                        (Orientation.east, 43),
                                        (Orientation.north, 99),
                                        (Turn.right, 29),
                                        (Orientation.south, 45),
                                        (Orientation.south, 97),
                                        (Turn.right, 24),
                                        (Orientation.south, 60),
                                        (Turn.right, 34),
                                        (Turn.right, 23),
                                        (Turn.right, 60),
                                        (Turn.left, 0),
                                        (Orientation.south, 52),
                                        (Orientation.east, 48),
                                        (Orientation.north, 8),
                                        (Orientation.north, 47),
                                        (Orientation.north, 24),
                                        (Orientation.east, 73),
                                        (Turn.right, 80),
                                        (Orientation.east, 1),
                                        (Orientation.east, 41),
                                        (Orientation.east, 98),
                                        (Orientation.east, 46),
                                        (Orientation.north, 44),
                                        (Orientation.west, 75),
                                        (Orientation.north, 35),
                                        (Orientation.west, 28),
                                        (Orientation.west, 62),
                                        (Turn.left, 85),
                                        (Orientation.south, 8),
                                        (Orientation.north, 49),
                                        (Orientation.east, 84),
                                        (Turn.right, 22),
                                        (Orientation.east, 96),
                                        (Turn.right, 38),
                                        (Turn.right, 70),
                                        (Orientation.north, 66),
                                        (Orientation.south, 75),
                                        (Orientation.east, 27),
                                        (Orientation.north, 76),
                                        (Orientation.east, 30),
                                        (Orientation.east, 85),
                                        (Orientation.north, 49)]

        let result = simplifyMixedBasedDirections(directions: directions).location
        let expected: Location = (1424, 582)
        XCTAssertEqual(result.x, expected.x)
        XCTAssertEqual(result.y, expected.y)
    }
    
    
    
//    func testLooksFamiliar() {
//        let directions: [(Turn, Int)] = [(.right, 6), (.right, 2), (.right, 2), (.right, 2)]
//        let result = looksFamiliar(directions: directions)
//        let expected: Location = (4,0)
//        XCTAssertEqual(result!.x, expected.x)
//        XCTAssertEqual(result!.y, expected.y)
//        //For example, if your instructions are Right 6, Right 2, Right 2, Right 8, the first location you visit twice is 4 blocks away, due East.
//    }
    
    
    


    
}
