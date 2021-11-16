//
//  CGFloat+Extensions.swift
//
//  Created by Mario2R on 16/11/21.
//

extension CGFloat {
    var adjusted: CGFloat {
        return self * Device.ratio
    }
}