//
//  CGPointTestCases.swift
//  
//
//  Created by Mario Romero Rodriguez on 8/6/22.
//

import XCTest

class CGPointTestCases: XCTestCase {
    
    let point1 = CGPoint(x: 0, y: 10)
    let point2 = CGPoint(x: 30, y: 30)
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func testPointDistance() throws {
        let distance = CGPoint.distance(from: point2, to: point1)
        XCTAssertEqual(distance, 36.05551275463989, accuracy: 0.01)
        XCTAssertEqual(point1.distance(from: point2), 36.05551275463989, accuracy: 0.01)
    }

}
