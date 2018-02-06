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

    init(_ row: Row, _ column: Column) {
        self.row = row
        self.column = column
    }

    static func ==(lhs: Position, rhs: Position) -> Bool {
        return lhs.row == rhs.row && lhs.column == rhs.column
    }

    static var all: [Position] =
        [ Position(.upper, .left),  Position(.upper, .center),  Position(.upper, .right),
          Position(.middle, .left), Position(.middle, .center), Position(.middle, .right),
          Position(.lower, .left),  Position(.lower, .center),  Position(.lower, .right) ]

}
