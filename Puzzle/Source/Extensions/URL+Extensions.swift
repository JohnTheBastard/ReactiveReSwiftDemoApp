//  Created by John Hearn on 2/2/18.
//  Copyright © 2018 Bastardized Productions. All rights reserved.

import Foundation

extension URL {
    func queryParams() -> [String: String] {
        guard let queryItems = URLComponents(url: self, resolvingAgainstBaseURL: false)?.queryItems else {
            return [:]
        }

        var dict: [String:String] = [:]
        for parameter in queryItems {
            dict[parameter.name] = parameter.value
        }
        return dict
    }
}
