//
//  TubeRow.swift
//  tfl
//
//  Created by Brian Halpin on 08/11/2023.
//

import SwiftUI

struct TubeRow: View {
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    var tubeLine: TubeLine
    
    var body: some View {
        HStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 0) {
                Text(NSLocalizedString(tubeLine.name, comment: "Tube line"))
                    .multilineTextAlignment(.leading)
                    .foregroundColor(Color.contrastTextColor(tubeLine.name))
                    .accessibilityLabel(tubeLine.name)
                    .accessibilityHint("The name of the tube line.")
                    .accessibility(identifier: "TUBE_LINE_NAME")
            }
            .frame(maxHeight: .infinity)
            .frame(minWidth: 0, maxWidth: 120, alignment: .leading)
            .padding(5)
            .background(Color.getLineColor(tubeLine.name))
            
            VStack(alignment: .leading, spacing: 0) {
                Text(NSLocalizedString(tubeLine.lineStatuses[0].statusSeverityDescription, comment: "Tube Status"))
                    .multilineTextAlignment(.leading)
                    .accessibilityLabel(tubeLine.lineStatuses[0].statusSeverityDescription)
                    .foregroundColor(colorScheme == .dark ? .white : .black)
                    .accessibilityHint("The status of the tube line.")
                    .accessibility(identifier: "TUBE_LINE_STATUS")
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 40, alignment: .leading)
            .padding(5)
            .background(Color.backgroundStatusColor(status: tubeLine.lineStatuses[0].statusSeverityDescription, mode: colorScheme))
        }
    }
}

struct TubeRow_Previews: PreviewProvider {
    static var lines = TubeViewModel().lines
    static var previews: some View {
        TubeRow(tubeLine: lines[0])
    }
}
