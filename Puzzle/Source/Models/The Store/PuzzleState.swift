//  Created by John D Hearn on 2/5/18.
//  Copyright © 2018 Bastardized Productions. All rights reserved.

import Foundation
import ReSwift

struct PuzzleState: StateType {
    var puzzle: Puzzle

    static var initialState: PuzzleState {
        return PuzzleState(Puzzle())
    }

    init(_ puzzle: Puzzle) {
        self.puzzle = puzzle
    }
}

let theStore = Store(
    reducer: puzzleReducer,
    state: PuzzleState.initialState,
    middleware: [])
