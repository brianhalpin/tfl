//
//  tflUITestsLaunchTests.swift
//  tflUITests
//
//  Created by Brian Halpin on 07/11/2023.
//

import XCTest

final class UITests: XCTestCase {
    
    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }
    
    override func setUpWithError() throws {
        continueAfterFailure = false
    }
    
    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()
        
        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
    
    func testTubeLineWithDisruptionFeed() {
        givenAppOpens()
        shouldDisplay(label: "TUBE_LINE_NAME", value: "Circle")
        shouldDisplay(label: "TUBE_LINE_STATUS", value: "Planned Closure")
    }
    
}


    extension UITests {
        
        func givenAppOpens() {
            continueAfterFailure = false
            let app = XCUIApplication()
            app.launchArguments.append("APITestClient")
            app.launch()
            XCUIDevice.shared.orientation = .portrait
        }
        
        func shouldDisplay(label: String, value: String) {
            let app = XCUIApplication()
            let label = app.staticTexts[label]
            let updated = NSPredicate(format: "label == %@", value)
            expectation(for: updated, evaluatedWith: label, handler: nil)
            waitForExpectations(timeout: 10, handler: nil)
        }
        
    }
