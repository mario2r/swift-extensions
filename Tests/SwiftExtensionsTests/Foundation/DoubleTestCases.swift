//
//  DoubleTestCases.swift
//  
//
//  Created by Mario Romero Rodriguez on 19/4/22.
//

import XCTest

class DoubleTestCases: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDouble() throws {
        XCTAssertEqual(Double(10.0).string, "10.00")
        XCTAssertEqual(Double(10.1234).string, "10.12")
        XCTAssertEqual(10.float, Float(10.0))
        XCTAssertEqual(10.int, Int(10.0))
        
        #if canImport(CoreGraphics)
        XCTAssertEqual(10.1.cgFloat, CGFloat(10.1))
        #endif
    }

}
