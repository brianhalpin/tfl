//
//  APIClient.swift
//  tfl
//
//  Created by Brian Halpin on 08/11/2023.
//

import Foundation

struct APIError: Error {
    let statusCode: Int?
    let statusMessage: String?
}

protocol APIClient {
    func getJSON<T: Decodable>(urlString: String) async throws -> [T]
}

final class APIClientLive: APIClient {
    /**
     GET Request for data.
     */
    func getJSON<T: Decodable>(urlString: String) async throws -> [T] {
        
        guard let url = URL(string: urlString) else { throw APIError(statusCode: 404, statusMessage: "URL is nil") }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw APIError(statusCode: nil, statusMessage: "No valid response")
        }
        
        guard (200..<300).contains(httpResponse.statusCode) else {
            throw APIError(statusCode: httpResponse.statusCode, statusMessage: "HTTP status code indicates an error")
        }
        
        do {
            return try JSONDecoder().decode([T].self, from: data)
        } catch {
            throw APIError(statusCode: httpResponse.statusCode, statusMessage: "Failed to decode JSON: \(error)")
        }
    }
}

final class APIClientTest: APIClient {
    
    func getJSON<T: Decodable>(urlString: String) async throws -> [T] {
        let bundle = Bundle.main
        let url = bundle.url(forResource: (urlString == "Good" ? "GoodService" : "Disruption"), withExtension: "json")!
        
        let data = try! Data(contentsOf: url)
        
        do {
            return try JSONDecoder().decode([T].self, from: data)
        } catch {
            throw APIError(statusCode: 404, statusMessage: "Failed to decode JSON: \(error)")
        }
    }
}
