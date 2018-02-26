//
//  EventTabViewControllerTests.swift
//  ThaiTechEventsCalendarUITests
//
//  Created by Woramet Muangsiri on 2/25/18.
//  Copyright © 2018 WM. All rights reserved.
//

import XCTest

class EventTabViewControllerTests: XCTestCase {

    override func setUp() {
        super.setUp()

        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    func testUpComingFeedIsDefaultTab() {
        let app = XCUIApplication()
        XCTAssertTrue(app.navigationBars["Upcoming events"].exists)
    }

    func testSwipeLeftFromUpcomingEvents() {
        let app = XCUIApplication()
        XCTAssertTrue(app.navigationBars["Upcoming events"].exists)
        let table = app.tables.firstMatch
        table.swipeLeft()
        sleep(1)
        XCTAssertTrue(app.navigationBars["Past events"].exists, "Past events tab should appear.")
    }

    func testSwipeRightFromUpComingEvents() {
        let app = XCUIApplication()
        XCTAssertTrue(app.navigationBars["Upcoming events"].exists)
        let table = app.tables.firstMatch
        table.swipeRight()
        sleep(1)
        XCTAssertTrue(app.navigationBars["Upcoming events"].exists, "Nothing should be changed.")
    }

    func testSwipeRightFromPastEvents() {
        let app = XCUIApplication()
        let table = app.tables.firstMatch
        table.swipeLeft()
        sleep(1)
        table.swipeRight()
        sleep(1)
        XCTAssertTrue(app.navigationBars["Upcoming events"].exists)
    }
}