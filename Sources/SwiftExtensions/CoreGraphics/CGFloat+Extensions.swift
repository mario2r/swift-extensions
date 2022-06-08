//
//  CGFloat+Extensions.swift
//
//  Created by mario2r on 16/11/21.
//

#if canImport(CoreGraphics)
import CoreGraphics

#if canImport(Foundation)
import Foundation
#endif

public extension CGFloat {
    
    var abs: CGFloat {
        return Swift.abs(self)
    }

    #if canImport(Foundation)
    var ceil: CGFloat {
        return Foundation.ceil(self)
    }
    #endif

    var degreesToRadians: CGFloat {
        return .pi * self / 180.0
    }
    
    var radiansToDegrees: CGFloat {
        return self * 180 / CGFloat.pi
    }
    
    var int: Int {
        return Int(self)
    }
    
    var float: Float {
        return Float(self)
    }

    var double: Double {
        return Double(self)
    }
}

#endif
