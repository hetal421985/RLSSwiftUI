//
//  SettingDataCell.swift
//  RLSSwiftUI
//
//  Created by Hetal Mehta on 04/01/24.
//

import SwiftUI

struct SettingDataCell: View {
    
    var settingDetail: SettingDataModel
    
    var body: some View {
        HStack {
            Image(settingDetail.imageName)
            Spacer()
            VStack{
                Text(settingDetail.optionName)
                .frame(maxWidth: .infinity,alignment: .leading)
                .font(.custom(Constant.Font.kMedium, size: Constant.Font.kRegularSize))
                .foregroundColor(.primary.opacity(0.6))
                Text(settingDetail.subTitle)
                .frame(maxWidth: .infinity,alignment: .leading)
                .font(.custom(Constant.Font.kRegular, size: Constant.Font.kRegularSize))
                .foregroundColor(.primary.opacity(0.4))
            }
            
        }
    }
}

#Preview {
    SettingDataCell(settingDetail: SettingDataModel(id: 1, imageName: "font", optionName: "", subTitle: ""))
}
