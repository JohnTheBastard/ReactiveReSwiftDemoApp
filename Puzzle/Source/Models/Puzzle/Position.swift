//  Created by John D Hearn on 2/5/18.
//  Copyright © 2018 Bastardized Productions. All rights reserved.

import Foundation

struct Position: Hashable {
    private(set) var row: Row
    private(set) var column: Column

    init(_ row: Row, _ column: Column) {
        self.row = row
        self.column = column
    }

    static let upperLeft    = Position(.upper,  .left)
    static let upperCenter  = Position(.upper,  .center)
    static let upperRight   = Position(.upper,  .right)
    static let middleLeft   = Position(.middle, .left)
    static let middleCenter = Position(.middle, .center)
    static let middleRight  = Position(.middle, .right)
    static let lowerLeft    = Position(.lower,  .left)
    static let lowerCenter  = Position(.lower,  .center)
    static let lowerRight   = Position(.lower,  .right)

    static var all: [Position] = [ upperLeft,  upperCenter,  upperRight,
                                   middleLeft, middleCenter, middleRight,
                                   lowerLeft,  lowerCenter,  lowerRight ]

    //MARK: Hashable conformance
    static func ==(lhs: Position, rhs: Position) -> Bool {
        return lhs.row == rhs.row && lhs.column == rhs.column
    }

    var hashValue: Int {
        return (self.row.rawValue * 100) + self.column.rawValue
    }



}
