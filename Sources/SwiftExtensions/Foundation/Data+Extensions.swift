//
//  Data+Extensions.swift
//  Created by mario2r on 27/04/2021.
//

import Foundation

public extension Data {
    
    // MARK: - Bytes
    var bytes: [UInt8] {
        return [UInt8](self)
    }

    // MARK: - Decode Base64
    var base64Decoded: String? {
        return self.string(encoding: .utf8)
    }
    
    // MARK: - Methods
    func string(encoding: String.Encoding) -> String? {
        return String(data: self, encoding: encoding)
    }
    
    func jsonObject(options: JSONSerialization.ReadingOptions = []) throws -> Any {
        return try JSONSerialization.jsonObject(with: self, options: options)
    }

}
