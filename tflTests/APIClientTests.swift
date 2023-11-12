//
//  APIClientTests.swift
//  tflTests
//
//  Created by Brian Halpin on 08/11/2023.
//

import XCTest
@testable import tfl

class APIClientTests: XCTestCase {
    
    func testGoodTubeServiceFromTestAPI() async {
        
        do {
            let tubeLines: [TubeLine] = try await APIClientTest().getJSON(urlString: "Good")
            
            XCTAssertFalse(tubeLines.isEmpty, "JSON result should not be empty")
            
            let line = tubeLines.first!
            
            XCTAssert(line.id == "bakerloo")
            XCTAssert(line.name == "Bakerloo")
            XCTAssert(line.lineStatuses[0].statusSeverityDescription == "Good Service")
            XCTAssert(line.lineStatuses[0].reason == nil)
        } catch {
            XCTFail("Failed to fetch JSON: \(error)")
        }
        
    }
    
    func testBadTubeServiceFromTestAPI() async {
        
        do {
            let tubeLines: [TubeLine] = try await APIClientTest().getJSON(urlString: "Delay")
            
            XCTAssertFalse(tubeLines.isEmpty, "JSON result should not be empty")
            
            let line = tubeLines.first!
            
            XCTAssert(line.id == "circle")
            XCTAssert(line.name == "Circle")
            XCTAssert(line.lineStatuses[0].statusSeverityDescription == "Planned Closure")
            XCTAssert(line.lineStatuses[0].reason != nil)
        } catch {
            XCTFail("Failed to fetch JSON: \(error)")
        }
        
    }
    
    
    func testFetchJSON() async {
        
        do {
            let apiClient = APIClientLive()
            let tubeLines: [TubeLine] = try await apiClient.getJSON(urlString: APICredentials.statusURL)

            XCTAssertFalse(tubeLines.isEmpty, "JSON result should not be empty")
            
            let line = tubeLines.first!
            
            XCTAssert(line.id == "bakerloo")
            XCTAssert(line.name == "Bakerloo")
        } catch {
            XCTFail("Failed to fetch JSON: \(error)")
        }
    }
}
