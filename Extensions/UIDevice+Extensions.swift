//
//  UIDevice+Extensions.swift
//
//  Created by Mario2R on 16/11/21.
//

class Device {
    // Base width in point, use iPhone 6
    static let base: CGFloat = 375
    static var ratio: CGFloat {
        return UIScreen.main.bounds.width / base
    }
}