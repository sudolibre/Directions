//
//  Directions.swift
//  Directions
//
//  Created by Jonathon Day on 12/1/16.
//  Copyright © 2016 dayj. All rights reserved.
//

import Foundation
var travelX = 0
var travelY = 0

//enum Turn {
//    case left
//    case right
//    //case none
//}
//
//enum Orientation {
//    case north, south, east, west
//}

func convertToCardinalDirection(orientation: Orientation, turn: Turn) -> Orientation {
    switch (orientation, turn) {
    case (.north, .left):
        return Orientation.west
    case (.north, .right):
        return Orientation.east
    case (.south, .left):
        return Orientation.east
    case (.south, .right):
        return Orientation.west
    case (.east, .left):
        return Orientation.north
    case (.east, .right):
        return Orientation.south
    case (.west, .left):
        return Orientation.south
    case (.west, .right):
        return Orientation.north
    default:
        fatalError()
    }
}

func computeDistance(orientation: Orientation, blocks: Int) {
    switch orientation {
    case .north:
        travelY += blocks
    case .south:
        travelY -= blocks
    case .east:
        travelX += blocks
    case .west:
        travelX -= blocks
    }
    
}


let directions: [(Turn, Int)] = [(.left, 4), (.left, 4), (.left, 5), (.right, 5), (.right, 4), (.left, 4), (.right, 5), (.right, 4), (.right, 2), (.left, 3), (.right, 1), (.right, 1), (.left, 4), (.left, 5), (.right, 3), (.left, 1), (.left, 1), (.right, 4), (.left, 2), (.right, 1), (.right, 4), (.right, 4), (.left, 2), (.left, 2), (.right, 4), (.left, 4), (.right, 1), (.right, 3), (.left, 3), (.left, 1), (.left, 2), (.right, 1), (.right, 5), (.left, 5), (.left, 1), (.left, 1), (.right, 3), (.right, 5), (.left, 1), (.right, 4), (.left, 5), (.right, 5), (.right, 1), (.left, 185), (.right, 4), (.left, 1), (.right, 51), (.left, 2), (.right, 78), (.right, 1), (.left, 4), (.right, 188), (.right, 1), (.left, 5), (.right, 5), (.right, 2), (.right, 3), (.left, 5), (.right, 3), (.right, 4), (.left, 1), (.right, 2), (.right, 2), (.right, 3), (.right, 2), (.left, 5), (.right, 2), (.left, 1), (.left, 4), (.right, 4), (.left, 4), (.right, 2), (.left, 3), (.left, 4), (.right, 2), (.left, 3), (.right, 3), (.right, 2), (.left, 2), (.left, 3), (.right, 4), (.right, 3), (.right, 1), (.left, 4), (.left, 2), (.left, 5), (.right, 4), (.right, 4), (.left, 1), (.right, 1), (.left, 5), (.left, 1), (.right, 3), (.right, 1), (.left, 2), (.right, 1), (.right, 1), (.right, 3), (.left, 4), (.left, 1), (.left, 3), (.right, 2), (.right, 4), (.right, 2), (.left, 2), (.right, 1), (.left, 5), (.right, 3), (.left, 3), (.right, 3), (.left, 1), (.right, 4), (.left, 3), (.left, 3), (.right, 4), (.left, 2), (.left, 1), (.left, 3), (.right, 2), (.right, 3), (.left, 2), (.left, 1), (.right, 4), (.left, 3), (.left, 5), (.left, 2), (.left, 4), (.right, 1), (.left, 4), (.left, 4), (.right, 3), (.right, 5), (.left, 4), (.left, 1), (.left, 1), (.right, 4), (.left, 2), (.right, 5), (.right, 1), (.right, 1), (.right, 2), (.right, 1), (.right, 5), (.left, 1), (.left, 3), (.left, 5), (.right, 2), (.left, 4), (.left, 4), (.left, 5), (.right, 5), (.right, 4), (.left, 4), (.right, 5), (.right, 4), (.right, 2), (.left, 3), (.right, 1), (.right, 1), (.left, 4), (.left, 5), (.right, 3), (.left, 1), (.left, 1), (.right, 4), (.left, 2), (.right, 1), (.right, 4), (.right, 4), (.left, 2), (.left, 2), (.right, 4), (.left, 4), (.right, 1), (.right, 3), (.left, 3), (.left, 1), (.left, 2), (.right, 1), (.right, 5), (.left, 5), (.left, 1), (.left, 1), (.right, 3), (.right, 5), (.left, 1), (.right, 4), (.left, 5), (.right, 5), (.right, 1), (.left, 185), (.right, 4), (.left, 1), (.right, 51)]

func simplifyDirections(directions: [(turn: Turn, blocks: Int)]) -> [Int] {
    var previousOrientation = Orientation.north
    for i in directions {
        switch i {
        case let x where x.turn == .left:
            let travelDirection = convertToCardinalDirection(orientation: previousOrientation, turn: .left)
            let blocks = x.blocks
            previousOrientation = travelDirection
            computeDistance(orientation: travelDirection, blocks: blocks)
        case let x where x.turn == .right:
            let travelDirection = convertToCardinalDirection(orientation: previousOrientation, turn: .right)
            let blocks = x.blocks
            previousOrientation = travelDirection
            computeDistance(orientation: travelDirection, blocks: blocks)
        default:
            print("defualt case")
        }
    }
    return [travelX, travelY]
    
}


func giveDirections() {
    let simpleDirections = simplifyDirections(directions: directions)
    var firstDirection = ""
    var secondDirection = ""
    if simpleDirections[0] > 0 {
        firstDirection = "East"
    } else {
        firstDirection = "West"
    }
    if simpleDirections[1] > 0 {
        secondDirection = "North"
    } else {
        secondDirection = "South"
    }
    print("Go \(firstDirection) for \(abs(simpleDirections[0])) blocks and then \(secondDirection) for \(abs(simpleDirections[1])) blocks")
}
