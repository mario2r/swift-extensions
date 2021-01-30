//
//  Bundle+Extensions.swift
//  Created by mario2r on 29/01/2021.
//

extension Bundle {

    var appVersion: String? {
        self.infoDictionary?["CFBundleShortVersionString"] as? String
    }
    
    static var mainAppVersion: String? {
        Bundle.main.appVersion
    }
    
}