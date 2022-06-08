//
//  File.swift
//  
//
//  Created by Mario Romero Rodriguez on 8/6/22.
//

#if canImport(CoreGraphics)
import CoreGraphics

// MARK: - Methods
public extension CGPoint {
    /// Distance from another CGPoint.
    ///
    /// - Parameter point: CGPoint to get distance from.
    /// - Returns: Distance between self and given CGPoint.
    func distance(from point: CGPoint) -> CGFloat {
        return CGPoint.distance(from: self, to: point)
    }

    /// Distance between two CGPoints.
    ///
    /// - Parameters:
    ///   - point1: first CGPoint.
    ///   - point2: second CGPoint.
    /// - Returns: distance between the two given CGPoints.
    static func distance(from point1: CGPoint, to point2: CGPoint) -> CGFloat {
        return sqrt(pow(point2.x - point1.x, 2) + pow(point2.y - point1.y, 2))
    }
}

#endif
