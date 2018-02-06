//  Created by John D Hearn on 2/5/18.
//  Copyright © 2018 Bastardized Productions. All rights reserved.

import Foundation
import ReSwift

struct PuzzleState: StateType {
    var puzzle: Puzzle

    static var initialState: PuzzleState {
        return self.init()
    }

    private init() {
        let pieces: [Piece] = Piece.solution.shuffled
        let positions: [Position] = Position.ordered
        var puzzle = Puzzle()

        assert(pieces.count == positions.count)

        pieces.enumerated().forEach { (index, piece) in
            puzzle[piece] = positions[index]
        }

        self.init(puzzle)
    }

    init(_ puzzle: Puzzle) {
        self.puzzle = puzzle
    }
}
