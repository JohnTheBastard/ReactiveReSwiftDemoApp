////  Created by John D Hearn on 2/5/18.
////  Copyright © 2018 Bastardized Productions. All rights reserved.
//
//import Foundation
//
//struct AltPuzzle {
//    private(set) var positions: [Position]
//
//    static var solution = AltPuzzle(Piece.ordered)
//    static var shuffled: AltPuzzle { return AltPuzzle(Piece.ordered.shuffled) }
//
//    private init(_ pieces: [Piece]) {
//        assert(pieces.count == 9)
//
//        self.positions = Position.ordered.enumerated().map { (index, position) in
//            var mutablePosition = position
//            mutablePosition.piece = pieces[index]
//            return mutablePosition
//        }
//
//        assert(self.positions.count == 9)
//    }
//
//    func piece(at position: Position) -> Piece? {
////        let index: Int
////        switch (position.row, position.column) {
////        case (.upper, .left):    index = 0
////        case (.upper, .center):  index = 1
////        case (.upper, .right):   index = 2
////        case (.middle, .left):   index = 3
////        case (.middle, .center): index = 4
////        case (.middle, .right):  index = 5
////        case (.lower, .left):    index = 6
////        case (.lower, .center):  index = 7
////        case (.lower, .right):   index = 8
////        }
//
//        guard let index = self.positions.index(of: position) else { return nil }
//
//        return self.positions[index].piece
//    }
//
//    func position(of piece: Piece) -> Position? {
//        return self.positions.filter({ piece == $0.piece }).first
//    }
//
//    mutating func handleTap(at position: Position) {
//        guard let gapPosition = self.position(of: .gap),
//            position != gapPosition else { return }
//
//        if position.column == gapPosition.column {
//            //self.mutateRow(at: position)
//        } else if position.row == gapPosition.row {
//            //self.mutateColumn(at: position)
//        }
//    }
//
//}
//
