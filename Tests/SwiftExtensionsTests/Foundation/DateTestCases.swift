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
        var components = DateComponents()
        components.year = 2022
        components.month = 1
        components.day = 1
        components.hour = 9
        components.minute = 0
        components.second = 0
        let date = Calendar.current.date(from: components)
        
        XCTAssertNotNil(date)
        XCTAssertEqual(date!.weekOfYear, 52)
        XCTAssertEqual(date!.weekOfMonth, 0)
        XCTAssertEqual(date!.year, 2022)
        XCTAssertEqual(date!.month, 1)
        XCTAssertEqual(date!.day, 1)
        XCTAssertEqual(date!.hour, 9)
        XCTAssertEqual(date!.minute, 0)
        XCTAssertEqual(date!.second, 0)
        XCTAssertEqual(date!.weekday, 7)
        
        
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
