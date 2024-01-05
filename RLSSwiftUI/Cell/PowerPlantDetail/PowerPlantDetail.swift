//
//  PowerPlantDetail.swift
//  RLSSwiftUI
//
//  Created by Hetal Mehta on 01/01/24.
//

import SwiftUI

typealias PowerPlantName = SchemaV2.PowerPlantName

struct PowerPlantDetail: View {
    
    /// Power Plant Name 
    let powerPlantName: PowerPlantName
    
    var body: some View {
        
        HStack {
            Image("plant")
            Text(powerPlantName.name)
            .font(.custom(Constant.Font.kRegular, size: Constant.Font.kRegularSize))
            .foregroundColor(.secondary)
        }
    }
}
