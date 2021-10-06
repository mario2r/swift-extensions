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

    public var object: [String: Any] {
        guard let data = jsonData else { return [:] }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)) as? Object ?? [:]
    }
    
}

public extension Decodable {

    static func removeRootKeyFrom(json: String, using encoding: String.Encoding = .utf8) -> Self? {
        guard let data = json.data(using: encoding) else {
            return nil
        }

        do {
            let rawData = try JSONDecoder().decode([String: Self].self, from: data)
            return rawData.first?.value
        } catch {
            print(error)
            return nil
        }
    }

    static func from(json: String, using encoding: String.Encoding = .utf8) -> Self? {
        guard let data = json.data(using: encoding) else {
            return nil
        }
        return from(data: data)
    }

    static func from(url urlString: String) -> Self? {
        guard let url = URL(string: urlString) else {
            return nil
        }
        guard let data = try? Data(contentsOf: url) else {
            return nil
        }
        return from(data: data)
    }

    static func from(data: Data) -> Self? {
        do {
            return try JSONDecoder().decode(Self.self, from: data)
        } catch {
            print(error)
            return nil
        }
    }
}