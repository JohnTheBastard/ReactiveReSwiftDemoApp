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

    static var all: [Position] =
        [ Position(.upper,  .left), Position(.upper,  .center), Position(.upper,  .right),
          Position(.middle, .left), Position(.middle, .center), Position(.middle, .right),
          Position(.lower,  .left), Position(.lower,  .center), Position(.lower,  .right) ]

    //MARK: Hashable conformance
    static func ==(lhs: Position, rhs: Position) -> Bool {
        return lhs.row == rhs.row && lhs.column == rhs.column
    }

    var hashValue: Int {
        return (self.row.rawValue * 100) + self.column.rawValue
    }



}
