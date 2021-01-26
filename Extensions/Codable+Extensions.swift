//
//  Encodable+Extensions.swift
//  Created by mario2r on 26/01/2021.
//

import Foundation

extension Encodable {
    
    /// Returns the related dictionary of a given codable
    public var jsonDictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
    }
    
    /// Returns the related data of a given codabel
    public var jsonData: Data? {
        return try? JSONEncoder().encode(self)
    }
    
}