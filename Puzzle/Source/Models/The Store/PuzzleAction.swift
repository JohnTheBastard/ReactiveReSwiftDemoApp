//  Created by John D Hearn on 2/5/18.
//  Copyright © 2018 Bastardized Productions. All rights reserved.

import Foundation
import ReSwift

enum PuzzleAction: Action {
    case tapped(Position)
    case reset
}
