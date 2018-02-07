//  Created by John Hearn on 2/2/18.
//  Copyright © 2018 Bastardized Productions. All rights reserved.

import Foundation

enum Piece: Hashable {
    case gap
    case number(Int)
    case complete

    static var all: [Piece] {
        return [ .number(1), .number(2), .number(3),
                 .number(4), .number(5), .number(6),
                 .number(7), .number(8), .gap ]
    }

    static var randomized: [Piece] {
        var shuffled: [Piece]

        repeat {
            shuffled = Piece.all.shuffled
            precondition(shuffled.isSolvable)
        } while !shuffled.isSolvable


        return shuffled
    }

    //MARK: Hashable conformance
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

fileprivate extension Array where Element==Piece {
    var asIntegers: [Int] {
        return self.flatMap { piece in
            switch piece {
            case .number(let value): return value
            default:                 return nil
            }
        }
    }

    var isSolvable: Bool {
        //TODO: This is puzzle logic, so it really sould live with the puzzle...
        var inversions: Int = 0
        let sequence = self.asIntegers

        precondition(sequence.count == 8)

        for ii in 0..<sequence.count {
            for jj in (ii+1)..<sequence.count {
                if sequence[jj] > sequence[ii] {
                    inversions += 1
                }
            }
        }
        return (inversions % 2) == 1
    }
}
