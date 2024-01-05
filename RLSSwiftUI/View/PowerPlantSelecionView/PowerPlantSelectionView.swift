//
//  PowerPlantSelectionView.swift
//  RLSSwiftUI
//
//  Created by Hetal Mehta on 25/12/23.
//

import SwiftUI

struct PowerPlantSelectionView: View {
    
    @ObservedObject var powerPlantList = DataManager()
    /// Should Show Button Next
    @State private var shouldShowNextButton = false
    /// Should Navigate To Tab Bar
    @State private var shouldNavigateToTabBar = false
    ///  Selected ID
    @State private var selectedID: Int = -1
    
    var body: some View {
        
        VStack(alignment: .leading, content: {
           
            Text("発電所選択")
            .font(.custom(Constant.Font.kBold, size: Constant.Font.kBoldSize))
            .foregroundColor(.black.opacity(0.7))
            Spacer()
                .frame(height:Constant.SpaceHeight.kMinimumSpaceHeight)
            Text("初期設定を行ってください。")
            .font(.custom(Constant.Font.kRegular, size:14))
            .foregroundColor(.secondary)
            
            List(powerPlantList.powerplant) { powerPlantDetail in
                PowerPlantCell(powerPlantModel: powerPlantDetail, selectedID: $selectedID, callback: self.radioGroupCallback)
                    .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .padding(EdgeInsets(top: 0, leading: -20, bottom: 0, trailing: 0))
                    
            Spacer()
                .frame(height:Constant.SpaceHeight.kMinimumSpaceHeight)
            
            if shouldShowNextButton {
                
                /// Bottom Button
                Button(action: {
                   shouldNavigateToTabBar = true
                }, label: {
                        Text("次へ")
                        .frame(width: 300 , height: 50, alignment: .center)
                    })
                    .foregroundColor(.white)
                    .font(.custom(Constant.Font.kBold, size: Constant.Font.kSize))
                    .background(.indigo)
                    .cornerRadius(25)
                    .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30))
            }
            NavigationLink("",destination: TabBarView(),isActive: $shouldNavigateToTabBar)
        })
        .padding(20)
        .navigationBarBackButtonHidden(true)
    }

    /*
     This Function is used to check any power point option
     */
   fileprivate func radioGroupCallback(id: Int) {
       selectedID = id
       shouldShowNextButton = true
    }
}

#Preview {
    PowerPlantSelectionView()
}
