//
//  DataTestCases.swift
//  
//
//  Created by Mario Romero Rodriguez on 19/4/22.
//

import XCTest

class DataTestCases: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testData() throws {
        let dataFromString = "This is data testing".data(using: .utf8)
        XCTAssertNotNil(dataFromString)
        XCTAssertNotNil(dataFromString?.string(encoding: .utf8))
        XCTAssertEqual(dataFromString?.string(encoding: .utf8), "This is data testing")
        
        let bytes = dataFromString?.bytes
        XCTAssertNotNil(bytes)
        XCTAssertEqual(bytes?.count, 20)
        
        XCTAssertThrowsError(try dataFromString?.jsonObject())
        XCTAssertThrowsError(try dataFromString?.jsonObject(options: [.allowFragments]))
        
        let stringData = "\"key\"".data(using: .utf8)
        XCTAssertThrowsError(try stringData?.jsonObject())
        XCTAssertEqual((try? stringData?.jsonObject(options: [.allowFragments])) as? String, "key")
        
        let objectData = "{\"key\": \"value\"}".data(using: .utf8)
        let object = (try? objectData?.jsonObject()) as? [String: String]
        XCTAssertNotNil(object)
        XCTAssertEqual(object?["key"], "value")
        
        let arrayData = "[\"key\"]".data(using: .utf8)
        let array = (try? arrayData?.jsonObject()) as? [String]
        XCTAssertNotNil(array)
        XCTAssertEqual(array?.first, "key")
    }

}
