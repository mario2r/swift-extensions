//
//  Double+Extensions.swift
//  Created by mario2r on 29/01/2021.
//

#if canImport(CoreGraphics)
import CoreGraphics
#endif


public extension Double {

    /// String.
    var string: String {
        String(format: "%.02f", self)
    }

    /// Int.
    var int: Int {
        return Int(self)
    }
    
    /// Float
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
