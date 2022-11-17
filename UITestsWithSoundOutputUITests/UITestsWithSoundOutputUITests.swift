//
//  UITestsWithSoundOutputUITests.swift
//  UITestsWithSoundOutputUITests
//
//  Created by Kubilay Erdogan on 17.11.22.
//

import XCTest

final class UITestsWithSoundOutputUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        app.terminate()
    }

    func testVideoPlays() {
        sleep(1)

        if app.staticTexts["initial"].exists {
            sleep(5)
        }

        XCTAssert(
            app.staticTexts["videoDidLoad"].exists,
            "Expected the video to start loading!"
        )
    }
}
