//
//  Directions.swift
//  Directions
//
//  Created by Jonathon Day on 12/1/16.
//  Copyright © 2016 dayj. All rights reserved.
//

import Foundation

typealias Location = (x: Int, y: Int)


func moveDistance(from location: inout Location, orientation: Orientation, blocks: Int) -> Location {
    switch orientation {
    case .north:
        location.y += blocks
    case .south:
        location.y -= blocks
    case .east:
        location.x += blocks
    case .west:
        location.x -= blocks
    }
    
    return location
    
}

func simplifyMixedBasedDirections(directions: [(instruction: Any, blocks: Int)]) -> (location: Location, cardinalDirections: [(orientation: Orientation, blocks: Int)]) {
    var orientation = Orientation.north
    var location: Location = (0, 0)
    var cardinalDirections = [(orientation: Orientation, blocks: Int)]()

    for i in directions {
        if i.instruction is Turn {
            orientation = orientation.turn(i.instruction as! Turn)
            cardinalDirections.append((orientation, i.blocks))
            location = moveDistance(from: &location, orientation: orientation, blocks: i.blocks)
        } else if i.instruction is Orientation {
            orientation = i.instruction as! Orientation
            cardinalDirections.append((orientation, i.blocks))
            location = moveDistance(from: &location, orientation: i.instruction as! Orientation, blocks: i.blocks)
        } else {
            fatalError()
        }
    }
    return (location, cardinalDirections)
}





func simplifyTurnBasedDirections(directions: [(turn: Turn, blocks: Int)]) -> (location: Location, cardinalDirections: [(orientation: Orientation, blocks: Int)])  {
    var orientation = Orientation.north
    var location: Location = (0, 0)
    var cardinalDirections = [(orientation: Orientation, blocks: Int)]()
    for i in directions {
        orientation = orientation.turn(i.turn)
        cardinalDirections.append((orientation, i.blocks))
        location = moveDistance(from: &location, orientation: orientation, blocks: i.blocks)
    }
    return (location, cardinalDirections)
    
}

func simplifyCardinalBasedDirections(directions: [(orientation: Orientation, blocks: Int)]) -> Location {
    var location: Location = (0, 0)
    var turnDirections = [(turn: Turn, blocks: Int)]()
   // var previousOrientation = Orientation.north
    for i in directions {
        //turnDirections.append((previousOrientation.orientToNewDirection(i.orientation), i.blocks))
        //previousOrientation = i.orientation
        location = moveDistance(from: &location, orientation: i.orientation, blocks: i.blocks)
    }
    return location
}



func looksFamiliar(directions: [(turn: Turn, blocks: Int)]) -> Location? {
    var tempArray = [Location]()
    var orientation = Orientation.north
    var location: Location = (0, 0)
    for i in directions {
        orientation = orientation.turn(i.turn)
        location = moveDistance(from: &location, orientation: orientation, blocks: i.blocks)
        let containedLocation = tempArray.contains { element in
            if element.x == location.x && element.y == location.y {
                return true
            } else {
                return false
            }
        }
        if containedLocation {
            return location
        }
        tempArray.append(location)
    }
    return nil
}


func giveDirections(directions: [(turn: Turn, blocks: Int)]) -> String {
    let simpleDirections = simplifyTurnBasedDirections(directions: directions).location
    var firstDirection = ""
    var secondDirection = ""
    if simpleDirections.x > 0 {
        firstDirection = "East"
    } else {
        firstDirection = "West"
    }
    if simpleDirections.y > 0 {
        secondDirection = "North"
    } else {
        secondDirection = "South"
    }
    let response = ("Go \(firstDirection) for \(abs(simpleDirections.x)) blocks and then \(secondDirection) for \(abs(simpleDirections.y)) blocks")
    print(response)
    return response
}

func giveDirections(directions: [(orientation: Orientation, blocks: Int)]) -> String {
    let simpleDirections = simplifyCardinalBasedDirections(directions: directions)
    var firstDirection = ""
    var secondDirection = ""
    if simpleDirections.x > 0 {
        firstDirection = "East"
    } else {
        firstDirection = "West"
    }
    if simpleDirections.y > 0 {
        secondDirection = "North"
    } else {
        secondDirection = "South"
    }
    let response = ("Go \(firstDirection) for \(abs(simpleDirections.x)) blocks and then \(secondDirection) for \(abs(simpleDirections.y)) blocks")
    print(response)
    return response
}

