//
//  Integer+Extensions.swift
//  Created by mario2r on 29/01/2021.
//

public extension Date {

    /// MARK: - Transform
    func toString(format: String) -> String {
        let df = DateFormatter()
        df.dateFormat = format
        return df.string(from: self)
    }
}
