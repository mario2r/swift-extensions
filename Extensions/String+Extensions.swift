//
//  String+Extensions.swift
//  Created by mario2r on 26/01/2021.
//

import UIKit

extension String {
    
    // MARK: - Tools

    /// Returns bool value of a string
    var boolValue: Bool {
        return (self as NSString).boolValue
    }
    
    /// Returns total characters
    var length: Int {
        return count
    }

    /// MARK: - Subscripts
    subscript (i: Int) -> String {
        return self[i ..< i + 1]
    }

    func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, length) ..< length]
    }

    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }

    subscript (rng: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, rng.lowerBound)),
                                            upper: min(length, max(0, rng.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
}