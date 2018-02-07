//  Created by John D Hearn on 2/5/18.
//  Copyright © 2018 Bastardized Productions. All rights reserved.

import Foundation
import ReSwift

fileprivate func tapReducer(tap position: Position, state: PuzzleState) -> PuzzleState {
    var mutableState = state

    mutableState.puzzle.interact(at: position)

    return mutableState
}

func puzzleReducer(action: Action, state: PuzzleState?) -> PuzzleState {
    var state = state ?? PuzzleState.initialState

    switch action as? PuzzleAction {
    case .some(.tapped(let position)):
        state.puzzle = tapReducer(tap: position, state: state).puzzle
    case .some(.reset):
        state.puzzle = PuzzleState.initialState.puzzle
    case .none: break
    }

    return state
}
