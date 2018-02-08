//  Created by John D Hearn on 2/5/18.
//  Copyright © 2018 Bastardized Productions. All rights reserved.

import Foundation
import ReSwift

let puzzleReducer: Reducer<PuzzleState> = { action, state in
    var newState = state ?? PuzzleState.initialState
    guard let action = action as? PuzzleAction else { return newState }

    switch action {
    case .tapped(let position): newState.puzzle.interact(at: position)
    case .reset:                newState.puzzle = PuzzleState.initialState.puzzle
    }

    return newState
}
