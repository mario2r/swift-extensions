//
//  UIViewTestCases.swift
//  
//
//  Created by Mario Romero Rodriguez on 8/6/22.
//

import XCTest
#if canImport(UIKit) && !os(watchOS)
import UIKit

class UIViewTestCases: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testView() throws {
        let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        let view = UIView(frame: frame)
        XCTAssertEqual(view.layer.cornerRadius, 0)
        
        view.roundCorners(.all, radius: 20.0)
        XCTAssertEqual(view.layer.cornerRadius, 20)
        
        let viewController = UIViewController()
        XCTAssertNotNil(viewController.view.parentViewController)
        XCTAssertEqual(viewController.view.parentViewController, viewController)
        XCTAssertNil(view.parentViewController)
    }
    
}
#endif
