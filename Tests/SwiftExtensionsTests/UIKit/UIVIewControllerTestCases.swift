//
//  UIVIewControllerTestCases.swift
//  
//
//  Created by Mario Romero Rodriguez on 8/6/22.
//

import XCTest
#if canImport(UIKit) && !os(watchOS)
import UIKit

class UIVIewControllerTestCases: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testViewController() throws {
        let viewController = UIViewController()
        XCTAssertFalse(viewController.isVisible)
    }

}
#endif
