//
//  DateTestCases.swift
//  
//
//  Created by Mario Romero Rodriguez on 19/4/22.
//

import XCTest

class DateTestCases: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDates() throws {
        let date = Date()
        
        XCTAssertNotNil(date)
        XCTAssertEqual(date.weekOfYear, Calendar.current.component(.weekOfYear, from: date))
        XCTAssertEqual(date.weekOfMonth, Calendar.current.component(.weekOfMonth, from: date))
        XCTAssertEqual(date.year, Calendar.current.component(.year, from: date))
        XCTAssertEqual(date.month, Calendar.current.component(.month, from: date))
        XCTAssertEqual(date.day, Calendar.current.component(.day, from: date))
        XCTAssertEqual(date.hour, Calendar.current.component(.hour, from: date))
        XCTAssertEqual(date.minute, Calendar.current.component(.minute, from: date))
        XCTAssertEqual(date.second, Calendar.current.component(.second, from: date))
        XCTAssertEqual(date.weekday, Calendar.current.component(.weekday, from: date))
        
        
    }

       func testIsInFuture() {
           let oldDate = Date(timeIntervalSince1970: 512) // 1970-01-01T00:08:32.000Z
           let futureDate = Date(timeIntervalSinceNow: 512)

           XCTAssert(futureDate.isInFuture)
           XCTAssertFalse(oldDate.isInFuture)
       }

       func testIsInPast() {
           let oldDate = Date(timeIntervalSince1970: 512) // 1970-01-01T00:08:32.000Z
           let futureDate = Date(timeIntervalSinceNow: 512)

           XCTAssert(oldDate.isInPast)
           XCTAssertFalse(futureDate.isInPast)
       }

       func testIsInToday() {
           XCTAssert(Date().isInToday)
           let tomorrow = Date().tomorrow
           XCTAssertFalse(tomorrow.isInToday)
           let yesterday = Date().yesterday
           XCTAssertFalse(yesterday.isInToday)
       }

       func testIsInYesterday() {
           XCTAssertFalse(Date().isInYesterday)
           let tomorrow = Date().tomorrow
           XCTAssertFalse(tomorrow.isInYesterday)
           let yesterday = Date().yesterday
           XCTAssert(yesterday.isInYesterday)
       }

       func testIsInTomorrow() {
           XCTAssertFalse(Date().isInTomorrow)
           let tomorrow = Date().tomorrow
           XCTAssert(tomorrow.isInTomorrow)
           let yesterday = Date().yesterday
           XCTAssertFalse(yesterday.isInTomorrow)
       }

       func testIsInWeekend() {
           let date = Date()
           XCTAssertEqual(date.isInWeekend, Calendar.current.isDateInWeekend(date))
       }

       func testIsWorkday() {
           let date = Date()
           XCTAssertEqual(date.isWorkday, !Calendar.current.isDateInWeekend(date))
       }

       func testIsInCurrentWeek() {
           let date = Date()
           XCTAssert(date.isInCurrentWeek)
           let dateOneYearFromNow = Calendar.current.date(byAdding: .year, value: 1, to: date) ?? Date()
           XCTAssertFalse(dateOneYearFromNow.isInCurrentWeek)
       }

       func testIsInCurrentMonth() {
           let date = Date()
           XCTAssert(date.isInCurrentMonth)
           let dateOneYearFromNow = Calendar.current.date(byAdding: .year, value: 1, to: date) ?? Date()
           XCTAssertFalse(dateOneYearFromNow.isInCurrentMonth)
       }

       func testIsInCurrentYear() {
           let date = Date()
           XCTAssert(date.isInCurrentYear)
           let dateOneYearFromNow = Calendar.current.date(byAdding: .year, value: 1, to: date) ?? Date()
           XCTAssertFalse(dateOneYearFromNow.isInCurrentYear)
       }

}
