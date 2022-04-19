//
//  Data+Extensions.swift
//  Created by mario2r on 27/04/2021.
//

import Foundation

public extension Data {

    // MARK: - Decode Base64
    var base64Decoded: String? {
        let utf8 = String(data: self, encoding: .utf8)
        return utf8
    }

    struct HexEncodingOptions: OptionSet {
        let rawValue: Int
        static let upperCase = HexEncodingOptions(rawValue: 1 << 0)
    }

    func hexEncodedString(options: HexEncodingOptions = []) -> String {
        let format = options.contains(.upperCase) ? "%02hhX" : "%02hhx"
        return self.map { String(format: format, $0) }.joined()
    }

}
