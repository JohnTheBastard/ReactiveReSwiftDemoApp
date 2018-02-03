//  Created by John Hearn on 2/2/18.
//  Copyright © 2018 Bastardized Productions. All rights reserved.

import UIKit

enum Colors: EnumCollection {
    case blue
    case red
    case yellow
    case green
    case orange
    case white
    case clear

    var color: UIColor {
        switch self {
        case .blue:
            return #colorLiteral(red: 0, green: 0.4509803922, blue: 0.7294117647, alpha: 1)
        case .red:
            return #colorLiteral(red: 1, green: 0.1882352941, blue: 0.1137254902, alpha: 1)
        case .yellow:
            return #colorLiteral(red: 1, green: 0.8588235294, blue: 0.1137254902, alpha: 1)
        case .green:
            return #colorLiteral(red: 0.1490196078, green: 0.8941176471, blue: 0.4039215686, alpha: 1)
        case .orange:
            return #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        case .white:
            return #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        case .clear:
            return #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        }
    }

    var cgColor: CGColor {
        return self.color.cgColor
    }
}
