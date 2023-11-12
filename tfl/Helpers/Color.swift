//
//  Colour.swift
//  tfl
//
//  Created by Brian Halpin on 08/11/2023.
//

import SwiftUI
import Foundation

// Colours defined at https://content.tfl.gov.uk/tfl-colour-standard-issue-08.pdf

extension Color {
    
    public static func getLineColor(_ line: String) -> Color {
        if let color = getLineColor[line.firstWordLowercased()] {
             return color
         }
         
        return Color.gray
    }
    
    public static func backgroundStatusColor(_ status: String) -> Color {
        if status.lowercased() == "good service" {
            return Color.white
        } else {
            return Color.disruptionBackground
        }
    }
    
    // Determine if the text contrast needs to be light or dark from the background color
    public static func contrastTextColor(_ line: String) -> Color {
        let lightColorLines = ["circle", "hammersmith", "victoria", "waterloo"]
        
        if lightColorLines.contains(line.firstWordLowercased()) {
            return Color.black
        } else {
            return Color.white
        }
    }
    
    private static let getLineColor: [String: Color] = [
        "bakerloo": bakerloo,
        "central": central,
        "circle": circle,
        "district": district,
        "hammersmith": hammersmith,
        "jubilee": jubilee,
        "metropolitan": metropolitan,
        "northern": northern,
        "piccadilly": piccadilly,
        "victoria": victoria,
        "waterloo": waterloo
    ]
    
    // London Underground line colours
    
    public static var disruptionBackground: Color {
        return Color(UIColor(red: 246/255, green: 238/255, blue: 203/255, alpha: 1.0))
    }
    
    public static var bakerloo: Color {
        return Color(UIColor(red: 166/255, green: 90/255, blue: 42/255, alpha: 1.0))
    }
    
    public static var central: Color {
        return Color(UIColor(red: 225/255, green: 37/255, blue: 27/255, alpha: 1.0))
    }
    
    public static var circle: Color {
        return Color(UIColor(red: 225/255, green: 205/255, blue: 0/255, alpha: 1.0))
    }
    
    public static var district: Color {
        return Color(UIColor(red: 0/255, green: 121/255, blue: 52/255, alpha: 1.0))
    }

    public static var hammersmith: Color {
        return Color(UIColor(red: 236/255, green: 155/255, blue: 173/255, alpha: 1.0))
    }
    
    public static var jubilee: Color {
        return Color(UIColor(red: 123/255, green: 134/255, blue: 140/255, alpha: 1.0))
    }

    public static var metropolitan: Color {
        return Color(UIColor(red: 135/255, green: 15/255, blue: 84/255, alpha: 1.0))
    }

    public static var northern: Color {
        return Color(UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0))
    }
    public static var piccadilly: Color {
        return Color(UIColor(red: 0/255, green: 15/255, blue: 159/255, alpha: 1.0))
    }
    
    public static var victoria: Color {
        return Color(UIColor(red: 0/255, green: 160/255, blue: 223/255, alpha: 1.0))
    }
    
    public static var waterloo: Color {
        return Color(UIColor(red: 107/255, green: 205/255, blue: 178/255, alpha: 1.0))
    }

}
