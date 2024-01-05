//
//  PowerPlantCell.swift
//  RLSSwiftUI
//
//  Created by Hetal Mehta on 25/12/23.
//

import SwiftUI

struct PowerPlantCell: View {
    
    /// Power Plant Model
    let powerPlantModel: PowerPlantModel

    /// Selected ID
    @Binding var selectedID: Int
    /// Callback
    let callback: (Int)->()
    
    var body: some View {
        
        HStack(spacing: 10, content: {
            Image(powerPlantModel.powerplantImage)
            Text(powerPlantModel.powerplantName)
                .font(.custom(Constant.Font.kRegular, size: Constant.Font.kRegularSize))
            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,alignment: .leading)
            Spacer()
                .frame(width: Constant.SpaceHeight.kPowerPlantListWidth)
            Button(action: {
                self.callback(powerPlantModel.id)
            }, label: {
                powerPlantModel.id == selectedID ? Image("done") : nil
            })
        })
        .frame(height: 50)
    }
}
