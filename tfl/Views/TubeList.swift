//
//  TubeList.swift
//  tfl
//
//  Created by Brian Halpin on 08/11/2023.
//

import SwiftUI

struct TubeList: View {
    @ObservedObject var tubeViewModel = TubeViewModel()
    @State private var statusChanged: String = ""
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text(statusChanged)) {
                    ForEach(tubeViewModel.lines) { line in
                        TubeRow(tubeLine: line)
                    }
                }
                .listStyle(PlainListStyle())
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 2, trailing: 0))
            }
            .accessibility(identifier: "TUBE_LINES")
            .navigationTitle("Tube Status")
            .onAppear(perform: {
                updateStatus()
                Task.init {
                    await fetchData()
                }
                startDataUpdateTimer()
            })
        }
    }
    
    private func fetchData() async {
        await tubeViewModel.fetchData()
    }

    private func startDataUpdateTimer() {
        Timer.scheduledTimer(withTimeInterval: 60, repeats: true) { _ in
            updateStatus()
            Task {
                await fetchData()
            }
        }
    }
    
    private func updateStatus() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        statusChanged = "Now \(dateFormatter.string(from: Date()))"
    }
}

struct TubeList_Previews: PreviewProvider {
    static var previews: some View {
        TubeList()
    }
}
