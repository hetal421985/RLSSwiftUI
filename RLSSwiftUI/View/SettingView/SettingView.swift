//
//  SettingView.swift
//  RLSSwiftUI
//
//  Created by Hetal Mehta on 27/12/23.
//

import SwiftUI

struct SettingView: View {
    
    let arrSettingOption = [SettingDataModel(id: 1, imageName: "font", optionName: "T 文字サイズ", subTitle: "不履行-中型"),SettingDataModel(id: 2, imageName: "plants", optionName: "発電所選択", subTitle: "futtu"),SettingDataModel(id: 3, imageName: "translate", optionName: "言語選択", subTitle: "日本語"),SettingDataModel(id: 4, imageName: "info", optionName: "バージョン", subTitle: "1.0.0")]
    var body: some View {
        
        VStack {
            Spacer()
                .frame(height: Constant.SpaceHeight.kMinimumSpaceHeight)
            Text("設定")
                .font(.custom(Constant.Font.kMedium, size: Constant.Font.kBoldSize))
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                .foregroundColor(.primary.opacity(0.5))
                .padding([.top,.trailing,.leading],20)
            List(arrSettingOption) { settingDetail in
                SettingDataCell(settingDetail: settingDetail)
                    .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
        }
        
    }
}

#Preview {
    SettingView()
}
