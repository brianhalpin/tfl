//
//  LineViewModel.swift
//  tfl
//
//  Created by Brian Halpin on 07/11/2023.
//

import SwiftUI

@MainActor
class TubeViewModel: ObservableObject {
    
    @Published var isFetching = false
    @Published var lines = [TubeLine]()
    @Published var errorMessage = ""

    private var apiURL = APICredentials.statusURL
    
    /**
        In a larger application, this check to return the test API would be in a different class and the apiURL would be configurable to choose which test JSON to use.
     */
    lazy var apiClient: APIClient = {
        if ProcessInfo.processInfo.arguments.contains("APITestClient") {
            apiURL = "Disruption"
            return APIClientTest()
        } else {
            return APIClientLive()
        }
    }()
    
    init() {
        
    }

    func fetchData() async {
        do {
            isFetching = true
            let tubeLines: [TubeLine] = try await apiClient.getJSON(urlString: self.apiURL)
            self.lines = tubeLines
            isFetching = false
        } catch {
            isFetching = false
        }
    }
}
