//
//  CGFloatTests.swift
//  
//
//  Created by Mario Romero Rodriguez on 8/6/22.
//

import XCTest

class CGFloatTestCases: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCGFloat() throws {
        XCTAssertEqual(CGFloat(-12.6).abs, CGFloat(12.6))
        XCTAssertEqual(CGFloat(12.6).ceil, CGFloat(13.0))
        
        XCTAssertEqual(CGFloat(180).degreesToRadians, CGFloat.pi)
        XCTAssertEqual(CGFloat.pi.radiansToDegrees, CGFloat(180))
        
        XCTAssertEqual(CGFloat(12.6).float, Float(12.6))
        XCTAssertEqual(CGFloat(12.6).double, Double(12.6))
        XCTAssertEqual(CGFloat(12.6).int, Int(12))
    }

}
