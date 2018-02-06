//  Created by John D Hearn on 2/5/18.
//  Copyright © 2018 Bastardized Productions. All rights reserved.

/**
    All the logic for the puzzle lives here.
 */

import Foundation

typealias Puzzle = [Piece:Position]

//MARK: Public Puzzle Properties and Methods
extension Dictionary where Key==Piece, Value==Position {
    static var solution: Puzzle {
        let pieces = Piece.ordered
        let positions = Position.ordered
        var puzzle = Puzzle()

        pieces.enumerated().forEach { (index, piece) in
            puzzle[piece] = positions[index]
        }

        return puzzle
    }

    static var shuffled: Puzzle {
        let pieces = Piece.ordered.shuffled
        let positions = Position.ordered
        var puzzle = Puzzle()

        pieces.enumerated().forEach { (index, piece) in
            puzzle[piece] = positions[index]
        }

        return puzzle
    }

    func findPiece(at position: Position) -> Piece? {
        let pieces = self.findKeys(for: position)

        //We should have exactly one piece per position
        guard let piece = pieces.first, pieces.count == 1 else { return nil }

        return piece
    }

    //TODO: Call this something else
    mutating func handleTap(_ position: Position) {
        guard let gapPosition = self[.gap], position != gapPosition else { return }

        if position.column == gapPosition.column {
            self.mutateRow(at: position)
        } else if position.row == gapPosition.row {
            self.mutateColumn(at: position)
        }
    }
}

//MARK: Private Puzzle Helper Methods
private extension Dictionary where Key==Piece, Value==Position {
    private func piecesIn(row: Row) -> Triple? {
        let columns: [Column] = [.left, .center, .right]
        let pieces = columns.map { self.findPiece(at: Position(row, $0)) }

        guard let a = pieces[0], let b = pieces[1], let c = pieces[2] else {
            return nil
        }

        return Triple(a,b,c)
    }

    private func piecesIn(column: Column) -> Triple? {
        let rows: [Row] = [.upper, .middle, .lower]
        let pieces = rows.map { self.findPiece(at: Position($0, column)) }

        guard let a = pieces[0], let b = pieces[1], let c = pieces[2] else {
            return nil
        }

        return Triple(a,b,c)
    }

    private mutating func mutateRow(at position: Position) {
        guard let pieces = self.piecesIn(row: position.row) else { return }

        let index = position.column.rawValue
        let (left, center, right) = pieces.move(at: index).asTuple

        self[left]   = Position(position.row, .left)
        self[center] = Position(position.row, .center)
        self[right]  = Position(position.row, .right)
    }

    private mutating func mutateColumn(at position: Position) {
        guard let pieces = self.piecesIn(column: position.column) else { return }

        let index = position.row.rawValue
        let (upper, middle, lower) = pieces.move(at: index).asTuple

        self[upper] = Position(.upper, position.column)
        self[middle] = Position(.middle, position.column)
        self[lower] = Position(.lower, position.column)
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
