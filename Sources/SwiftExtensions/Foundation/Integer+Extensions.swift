//
//  Integer+Extensions.swift
//  Created by mario2r on 29/01/2021.
//

#if canImport(CoreGraphics)
import CoreGraphics
#endif

public extension Int {

    /// Radian value of degree input.
    var degreesToRadians: Double {
        return Double.pi * Double(self) / 180.0
    }

    /// Degree value of radian input.
    var radiansToDegrees: Double {
        return Double(self) * 180 / Double.pi
    }
    
    /// String.
    var string: String {
        return "\(self)"
    }

    /// UInt.
    var uInt: UInt {
        return UInt(self)
    }

    /// Double.
    var double: Double {
        return Double(self)
    }

    /// Float.
    var float: Float {
        return Float(self)
    }

    #if canImport(CoreGraphics)
    /// CGFloat.
    var cgFloat: CGFloat {
        return CGFloat(self)
    }
    #endif

}
