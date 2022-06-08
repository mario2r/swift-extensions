//
//  UIViewController+Extensions.swift
//
//  Created by mario2r on 1/3/21.
//

#if canImport(UIKit) && !os(watchOS)
import UIKit


// MARK: - Methods
public extension UIAlertController {
    
    /// Display a simple alert
    /// - Parameters:
    ///   - title: alert's title
    ///   - message: alert's message
    ///   - controller: where to display alert
    func show(_ title: String, message: String, from controller: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Accept", style: .default))
        controller.show(alert, sender: nil)
    }
    
    /// Display a simple alert with actions
    /// - Parameters:
    ///   - title: alert's title
    ///   - message: alert's message
    ///   - actions: alert's actions
    ///   - controller: where to display alert
    func show(_ title: String, message: String, actions: [UIAlertAction], from controller: UIViewController) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        actions.forEach { alert.addAction($0) }
        controller.show(alert, sender: nil)
    }
    
    /// Display an error alert
    /// - Parameters:
    ///   - error: error to be display
    ///   - controller: where to display alert
    func show(_ error: Error, from controller: UIViewController) {
        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Close", style: .cancel, handler: nil))
        controller.show(alert, sender: nil)
    }
    
}

#endif


