//
//  UIViewController+Extensions.swift
//  ApplePaySwag
//
//  Created by Mario2R on 1/3/21.
//  Copyright © 2021 Razeware LLC. All rights reserved.
//

import UIKit

extension UIAlertController {

    class func show(_ message: String, from controller: UIViewController) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Accept", style: .default))
        controller.show(alert, sender: nil)
    }
    
}
