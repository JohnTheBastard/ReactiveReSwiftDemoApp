//  Created by John D Hearn on 2/5/18.
//  Copyright © 2018 Bastardized Productions. All rights reserved.

/**
 All logic for the puzzle lives here.
 */

import Foundation

typealias Puzzle = Dictionary<Position,Piece>

//MARK: Public Puzzle Properties and Methods

extension Dictionary where Key==Position, Value==Piece {
    static var solution = Puzzle(Position.all, Piece.all)

    init(_ positions: [Position] = Position.all, _ pieces: [Piece] = Piece.all.shuffled) {
        precondition(positions.count == pieces.count)

        self.init()

        positions.enumerated().forEach { (index, position) in
            self[position] = pieces[index]
        }
    }

    func findPosition(of piece: Piece) -> Position {
        let positions = self.findKeys(for: piece)

        precondition(positions.count == 1)
        return positions.first!
    }

    mutating func interact(at position: Position) {
        let gapPosition = self.findPosition(of: .gap)
        guard position != gapPosition else { return }

        if position.column == gapPosition.column {
            self.mutateRow(at: position)
        } else if position.row == gapPosition.row {
            self.mutateColumn(at: position)
        }
    }

    static func ==(lhs: [Piece: Position], rhs: [Piece: Position] ) -> Bool {
        guard lhs.count == rhs.count else { return false }

        let unmatched = lhs.keys.filter { lhs[$0] != rhs[$0] }

        return unmatched.isEmpty
    }
}

//MARK: Private Puzzle Helper Methods
private extension Dictionary where Key==Position, Value==Piece {
    private var asArrayOfInts: [Int] {
        return
            Position.all.flatMap {
                switch self[$0] {
                case .some(.number(let value)): return value
                default:                        return nil
                }
            }
    }

    private func piecesIn(row: Row) -> Triple? {
        let columns: [Column] = [.left, .center, .right]
        let pieces = columns.flatMap { self[Position(row, $0)] }

        precondition(pieces.count == 3)

        return Triple(pieces[0], pieces[1], pieces[2])
    }

    private func piecesIn(column: Column) -> Triple? {
        let rows: [Row] = [.upper, .middle, .lower]
        let pieces = rows.flatMap { self[Position($0, column)] }

        precondition(pieces.count == 3)

        return Triple(pieces[0], pieces[1], pieces[2])
    }

    private mutating func mutateRow(at position: Position) {
        guard let pieces = self.piecesIn(row: position.row) else { return }

        let index = position.column.rawValue
        let (left, center, right) = pieces.move(at: index).asTuple

        self[Position(position.row, .left)]   = left
        self[Position(position.row, .center)] = center
        self[Position(position.row, .right)]  = right
    }

    private mutating func mutateColumn(at position: Position) {
        guard let pieces = self.piecesIn(column: position.column) else { return }

        let index = position.row.rawValue
        let (upper, middle, lower) = pieces.move(at: index).asTuple

        self[Position(.upper, position.column)] = upper
        self[Position(.middle, position.column)] = middle
        self[Position(.lower, position.column)] =  lower
    }

    private struct Triple {
        private(set) var a: Piece
        private(set) var b: Piece
        private(set) var c: Piece

        private var rollRight: Triple { return Triple(c,a,b) }
        private var rollLeft:  Triple { return Triple(b,c,a) }
        private var swapLeft:  Triple { return Triple(b,a,c) }
        private var swapRight: Triple { return Triple(a,c,b) }

        var asTuple: (Piece, Piece, Piece) { return (self.a, self.b, self.c) }

        init(_ a: Piece, _ b: Piece, _ c: Piece) {
            (self.a, self.b, self.c) = (a, b, c)
        }

        func move(at index: Int) -> Triple {
            switch (a, b, c, index) {
            case (.number(_), .number(_), .gap, 0): return self.rollRight
            case (.number(_), .number(_), .gap, 1): return self.swapRight

            case (.number(_), .gap, .number(_), 0): return self.swapLeft
            case (.number(_), .gap, .number(_), 2): return self.swapRight

            case (.gap, .number(_), .number(_), 1): return self.swapLeft
            case (.gap, .number(_), .number(_), 2): return self.rollLeft

            default:                                return self
            }
        }
    }
}

