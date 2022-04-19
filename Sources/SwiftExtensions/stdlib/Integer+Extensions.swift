//
//  Integer+Extensions.swift
//  Created by mario2r on 29/01/2021.
//

public extension Int {

    /// MARK: - Transform
    func toDouble() -> Double {
        Double(self)
    }

    func toString() -> String {
        "\(self)"
    }

    // MARK: - Ratio
    var adjusted: CGFloat {
        return CGFloat(self) * Device.ratio
    }

}
