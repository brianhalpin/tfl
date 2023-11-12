//
//  ContentView.swift
//  tfl
//
//  Created by Brian Halpin on 07/11/2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var tubeViewModel = TubeViewModel()
    
    var body: some View {
        TubeList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
