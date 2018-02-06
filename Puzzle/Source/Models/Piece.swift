//  Created by John Hearn on 2/2/18.
//  Copyright © 2018 Bastardized Productions. All rights reserved.

import Foundation

enum Piece {
    case gap
    case number(Int)
    case complete

    static var ordered: [Piece] {
        return [ .number(1), .number(2), .number(3),
                 .number(4), .number(5), .number(6),
                 .number(7), .number(8), .gap ]
    }
}

extension Piece: Hashable {
    static func ==(lhs: Piece, rhs: Piece) -> Bool {
        switch (lhs, rhs) {
        case (.gap, .gap), (.complete, .complete):
            return true
        case (.number(let a), .number(let b)):
            return a == b
        default:
            return false
        }
    }

    var hashValue: Int {
        switch self {
        case .gap:               return 0
        case .number(let value): return value
        case .complete:          return 9
        }
    }
}
