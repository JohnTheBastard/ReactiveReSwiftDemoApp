//  Created by John D Hearn on 2/5/18.
//  Copyright © 2018 Bastardized Productions. All rights reserved.

import Foundation

enum Column: Int, EnumCollection {
    case left   = 0
    case center = 1
    case right  = 2
}

enum Row: Int, EnumCollection {
    case upper  = 0
    case middle = 1
    case lower  = 2
}

struct Position: Equatable {
    private(set) var row: Row
    private(set) var column: Column
    
    //var piece: Piece?

    init(_ row: Row, _ column: Column) {
        self.row = row
        self.column = column
    }

    static let ordered: [Position] =
        [ Position(.upper, .left),  Position(.upper, .center),  Position(.upper, .right),
          Position(.middle, .left), Position(.middle, .center), Position(.middle, .right),
          Position(.lower, .left),  Position(.lower, .center),  Position(.lower, .right) ]

    static func ==(lhs: Position, rhs: Position) -> Bool {
        return lhs.row == rhs.row && lhs.column == rhs.column
    }

//    static func ===(lhs: Position, rhs: Position) -> Bool {
//        return lhs == rhs && lhs.piece == rhs.piece
//    }
}

//enum PositionEnum: String, EnumCollection {
//    case upperLeft
//    case upperCenter
//    case upperRight
//    case middleLeft
//    case middleCenter
//    case middleRight
//    case lowerLeft
//    case lowerCenter
//    case lowerRight
//
//    var row: Row {
//        switch self {
//        case .upperLeft, .upperCenter, .upperRight:    return .upper
//        case .middleLeft, .middleCenter, .middleRight: return .middle
//        case .lowerLeft, .lowerCenter, .lowerRight:    return .lower
//        }
//    }
//
//    var column: Column {
//        switch self {
//        case .upperLeft, .middleLeft, .lowerLeft:       return .left
//        case .upperCenter, .middleCenter, .lowerCenter: return .center
//        case .upperRight, .middleRight, .lowerRight:    return .right
//        }
//    }
//
//    static var ordered: [PositionEnum] {
//        return
//            [ .upperLeft, .upperCenter, .upperRight,
//              .middleLeft, .middleCenter, .middleRight,
//              .lowerLeft, .lowerCenter, .lowerRight ]
//    }
//
//    init(_ row: Row, _ column: Column) {
//        switch (row, column) {
//        case (.upper, .left):    self = .upperLeft
//        case (.upper, .center):  self = .upperCenter
//        case (.upper, .right):   self = .upperRight
//        case (.middle, .left):   self = .middleLeft
//        case (.middle, .center): self = .middleRight
//        case (.middle, .right):  self = .middleLeft
//        case (.lower, .left):    self = .lowerLeft
//        case (.lower, .center):  self = .lowerCenter
//        case (.lower, .right):   self = .lowerRight
//        }
//    }
//}

