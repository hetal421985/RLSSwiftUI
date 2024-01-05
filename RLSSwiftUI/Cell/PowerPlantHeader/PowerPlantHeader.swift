//
//  PowerPlantHeader.swift
//  RLSSwiftUI
//
//  Created by Hetal Mehta on 01/01/24.
//

import SwiftUI


struct PowerPlantHeader: View {
    
    /// Power Plant  Header
    let powerPlantName: PowerPlantListModel
    
    /// Will Show Image As View Will Be Exapanded
    @Binding var shouldExpand: Bool
    
    var body: some View {
        
        HStack {
            Text(powerPlantName.title)
            .font(.custom(Constant.Font.kBold, size: Constant.Font.kRegularSize))
            .foregroundColor(.secondary)
            .frame(maxWidth: .infinity,alignment: .leading)
            Spacer()
                .frame(width: 100)
            shouldExpand ? Image("down"):Image("side")
        }
    }
}
