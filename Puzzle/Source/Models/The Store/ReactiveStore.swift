//  Created by John D Hearn on 2/7/18.
//  Copyright © 2018 Bastardized Productions. All rights reserved.

import Foundation
import ReSwift
import ReactiveSwift
//import ReactiveReSwift

class ReactiveStore: StoreSubscriber {
    let upperLeft    = MutableProperty<Piece>(.number(1))
    let upperCenter  = MutableProperty<Piece>(.number(2))
    let upperRight   = MutableProperty<Piece>(.number(3))
    let middleLeft   = MutableProperty<Piece>(.number(4))
    let middleCenter = MutableProperty<Piece>(.number(5))
    let middleRight  = MutableProperty<Piece>(.number(6))
    let lowerLeft    = MutableProperty<Piece>(.number(7))
    let lowerCenter  = MutableProperty<Piece>(.number(8))
    let lowereRight  = MutableProperty<Piece>(.gap(true))

    private static var theStore: Store<PuzzleState> = {
        let loggingMiddleware: Middleware<PuzzleState> = { dispatch, getState in
            print("Received action: ")
            return { next in
                return { action in
                    print("\(action)")
                    return next(action)
                }
            }
        }

        return Store(reducer: puzzleReducer,
                     state: PuzzleState.initialState,
                     middleware: [loggingMiddleware])
    }()

    fileprivate init() {
        self.newState(state: ReactiveStore.theStore.state)
    }

    func newState(state: PuzzleState) {
        guard let ul = state.puzzle[Position.upperLeft],
              let uc = state.puzzle[Position.upperCenter],
              let ur = state.puzzle[Position.upperRight],
              let ml = state.puzzle[Position.middleLeft],
              let mc = state.puzzle[Position.middleCenter],
              let mr = state.puzzle[Position.middleRight],
              let ll = state.puzzle[Position.lowerLeft],
              let lc = state.puzzle[Position.lowerCenter],
              let lr = state.puzzle[Position.lowerRight] else { return }

        if upperLeft.value != ul { upperLeft.value = ul }
        if upperLeft.value != uc { upperLeft.value = uc }
        if upperLeft.value != ur { upperLeft.value = ur }
        if upperLeft.value != ml { upperLeft.value = ml }
        if upperLeft.value != mc { upperLeft.value = mc }
        if upperLeft.value != mr { upperLeft.value = mr }
        if upperLeft.value != ll { upperLeft.value = ll }
        if upperLeft.value != lc { upperLeft.value = lc }
        if upperLeft.value != lr { upperLeft.value = lr }
    }

    func dispatch(_ action: PuzzleAction) {
        ReactiveStore.theStore.dispatch(action)
    }
}
