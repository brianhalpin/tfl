//
//  String.swift
//  tfl
//
//  Created by Brian Halpin on 09/11/2023.
//

import Foundation

extension String {
    
    func firstWordLowercased() -> String {
        let lowercasedLine = self.lowercased()
         let words = lowercasedLine.components(separatedBy: " ")

         if let firstWord = words.first {
             return firstWord
         } else {
             return ""
         }
    }
}
