//
//  CGFloat+Extensions.swift
//
//  Created by mario2r on 16/11/21.
//

public extension CGFloat {
    var adjusted: CGFloat {
        return self * Device.ratio
    }
}
