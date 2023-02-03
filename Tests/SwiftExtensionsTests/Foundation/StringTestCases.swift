//
//  StringTestCases.swift
//  
//
//  Created by Mario Romero Rodriguez on 19/4/22.
//

import XCTest
#if canImport(CoreLocation)
import CoreLocation
#endif

class StringTestCases: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testString() throws {
        XCTAssertTrue("true".boolValue)
        XCTAssertFalse("false".boolValue)
        XCTAssertEqual("123456789".length, 9)
        
        XCTAssertEqual("123456789"[4], "5")
        XCTAssertEqual("123456789".substring(fromIndex: 4), "56789")
        XCTAssertEqual("123456789".substring(toIndex: 4), "1234")
        XCTAssertEqual("123456789"[2..<5], "345")
        XCTAssertEqual(" 123456789   ".trimmed, "123456789")
        
        XCTAssertTrue("www.apple.com".isValidUrl)
        XCTAssertNotNil("www.apple.com".asURL)
        XCTAssertEqual("www.apple.com".asURL, URL(string: "www.apple.com"))
        
        XCTAssertTrue("123456789".containsOnlyDigits)
        XCTAssertFalse("123456789".containsOnlyLetters)
        XCTAssertFalse("abcdefghi".containsOnlyDigits)
        XCTAssertTrue("abcdefghi".containsOnlyLetters)
        XCTAssertTrue("123456789".isAlphanumeric)
        XCTAssertFalse("123456789.".isAlphanumeric)
        XCTAssertTrue("ABBA".isPalindrome)
        XCTAssertFalse("BABA".isPalindrome)
        
        XCTAssertTrue("ABBA".contains("BA"))
        XCTAssertFalse("ABba".contains("BA", caseSensitive: true))
        
        var reverse = "123456789"
        XCTAssertEqual(reverse.reverse(), "987654321")
    }
    
    func testisValidEmail() {
        // https://blogs.msdn.microsoft.com/testing123/2009/02/06/email-address-test-cases/
        XCTAssert("email@domain.com".isValidEmail)
        XCTAssert("firstname.lastname@domain.com".isValidEmail)
        XCTAssert("email@subdomain.domain.com".isValidEmail)
        XCTAssert("firstname+lastname@domain.com".isValidEmail)
        XCTAssert("email@123.123.123.123".isValidEmail)
        XCTAssert("1234567890@domain.com".isValidEmail)
        XCTAssert("email@domain-one.com".isValidEmail)
        XCTAssert("_______@domain.com".isValidEmail)
        XCTAssert("email@domain.name".isValidEmail)
        XCTAssert("email@domain.co.jp".isValidEmail)
        XCTAssert("firstname-lastname@domain.com".isValidEmail)

        XCTAssertFalse("".isValidEmail)
        XCTAssertFalse("plainaddress".isValidEmail)
        XCTAssertFalse("#@%^%#$@#$@#.com".isValidEmail)
        XCTAssertFalse("@domain.com".isValidEmail)
        XCTAssertFalse("Joe Smith <email@domain.com>".isValidEmail)
        XCTAssertFalse("email.domain.com".isValidEmail)
        XCTAssertFalse("email@domain@domain.com".isValidEmail)
        XCTAssertFalse(".email@domain.com".isValidEmail)
        XCTAssertFalse(" email@domain.com".isValidEmail)
        XCTAssertFalse("email@domain.com ".isValidEmail)
        XCTAssertFalse("\nemail@domain.com".isValidEmail)
        XCTAssertFalse("nemail@domain.com   \n\n".isValidEmail)
    }
    
    func testDate() throws {
        var components = DateComponents()
        components.year = 1900
        components.month = 12
        components.day = 1
        XCTAssertEqual("01/12/1900".toDate(format: "dd/MM/yyyy"), Calendar.current.date(from: components))
    }
    
    #if canImport(CoreLocation)
    func testCoordinates() throws {
        let coordinates: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 40.416729, longitude: -3.703339)
        XCTAssertNotNil("40.416729,-3.703339".asCoordinates)
        XCTAssertEqual("40.416729,-3.703339".asCoordinates!.latitude, coordinates.latitude)
        XCTAssertEqual("40.416729,-3.703339".asCoordinates!.longitude, coordinates.longitude)
    }
    #endif
    
}
