//
//  TubeLine.swift
//  tfl
//
//  Created by Brian Halpin on 07/11/2023.
//

import Foundation

// MARK: - Tube line
struct TubeLine: Decodable, Identifiable {
    let id: String
    let name, modeName: String
    let lineStatuses: [Status]
}

struct Status: Decodable, Identifiable {
    let id: Int
    let statusSeverity: Int
    let statusSeverityDescription: String
    let reason: String?
}
