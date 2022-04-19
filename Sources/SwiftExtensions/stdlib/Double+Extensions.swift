//
//  Double+Extensions.swift
//  Created by mario2r on 29/01/2021.
//

public extension Double {

    /// MARK: - Transform
    func toInt() -> Int {
        Int(self)
    }

    func toString() -> String {
        String(format: "%.02f", self)
    }

    // MARK: - Ratio
    var adjusted: CGFloat {
        return CGFloat(self) * Device.ratio
    }

}
