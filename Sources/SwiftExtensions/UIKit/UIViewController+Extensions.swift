//
//  UIViewController+Extensions.swift
//  Created by mario2r on 29/01/2021.
//

#if canImport(UIKit) && !os(watchOS)
import UIKit

public extension UIViewController {

    var isVisible: Bool { return isViewLoaded && view.window != nil }
    
}

#endif
