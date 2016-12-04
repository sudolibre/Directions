//
//  Orientation.swift
//  Directions
//
//  Created by Jonathon Day on 12/1/16.
//  Copyright © 2016 dayj. All rights reserved.
//

import Foundation


enum Orientation {
    case north, south, east, west
    
    func turn(_ turn: Turn) -> Orientation {
        switch (self, turn) {
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
        }
    }
    
    //    func orientToNewDirection(_ orientation: Orientation) -> Turn {
    //        switch (self, orientation) {
    //        case (.north, .west):
    //            return Turn.left
    //        case (.north, .east):
    //            return Turn.right
    //        case (.south, .east):
    //            return Turn.left
    //        case (.south, .west):
    //            return Turn.right
    //        case (.east, .north):
    //            return Turn.left
    //        case (.east, .south):
    //            return Turn.right
    //        case (.west, .south):
    //            return Turn.left
    //        case (.west, .north):
    //            return Turn.right
    //        }
    
    //considering north to north or north to south will require additional Turn cases such as continue or turn around. This will then make other switches non-exhaustive.
}

