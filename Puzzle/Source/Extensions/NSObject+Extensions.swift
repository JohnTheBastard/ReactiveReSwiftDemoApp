//  Created by John Hearn on 2/2/18.
//  Copyright © 2018 Bastardized Productions. All rights reserved.

import Foundation

public extension NSObject {
    public static var objectIdentifier: String {
        return self.description()
    }

    public static var namespace: String {
        return NSStringFromClass(self).components(separatedBy: ".").first!
    }

    public var namespace: String {
        return NSStringFromClass(type(of: self)).components(separatedBy: ".").first!
    }

    public static var objectName: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }

    public var objectName: String {
        return type(of: self).description().components(separatedBy: ".").last!
    }
}
