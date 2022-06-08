//
//  IntegerTestCases.swift
//  
//
//  Created by Mario Romero Rodriguez on 19/4/22.
//

import XCTest

@testable import SwiftExtensions
class IntegerTestCases: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testIntegers() throws {
        XCTAssertEqual(10.string, "10")
        XCTAssertEqual(10.double, Double(10))
        XCTAssertEqual(10.float, Float(10))
        XCTAssertEqual(10.uInt, UInt(10))
        XCTAssertEqual(180.degreesToRadians, Double.pi)
        XCTAssertEqual(Int(7.radiansToDegrees), 401)
        
        #if canImport(CoreGraphics)
        XCTAssertEqual(1.cgFloat, CGFloat(1))
        #endif
    }
    

}
