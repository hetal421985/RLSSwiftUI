//
//  IntroView.swift
//  RLSSwiftUI
//
//  Created by Hetal Mehta on 22/12/23.
//

import SwiftUI
import SwiftData

struct IntroView: View {
    
    @Environment(\.modelContext) private var modelContext
    
 @State var pushToPowerPlantSelectionView: Bool = false
       
    var body: some View {
        
        NavigationView {
            VStack(alignment: .leading, content: {
                /// Top Space
                Spacer()
                    .frame(height: Constant.SpaceHeight.kTopViewIntroHeight)
                /// Top View
                Image("intro")
                Spacer()
                    .frame(height: Constant.SpaceHeight.kMinimumSpaceHeight)
                /// Middle View
                Text("はじめに")
                .foregroundStyle(.indigo)
                .font(.custom(Constant.Font.kBold, size: 35))
                Spacer()
                    .frame(height: Constant.SpaceHeight.kMinimumSpaceHeight)
                
                Text("顔認証入退管理システム 登録者検索アプリは、システム障害、およびネットワーク障害が発生したときに、入構許可者の情報を検索し、非常時の構内セキュリティをサポートするシステムです。対象となる発電所名を選択した後に、入構許可者の情報を会社名→氏名によって検索します。")
                    .foregroundStyle(.gray)
                    .font(.custom(Constant.Font.kRegular, size: 15))
                Text("\n具体的には以下の機能を具備しています。\n  • 入構許可者検索（会社名検索→氏名検索）\n  • 入構時刻、退構時刻の記録 \n  • 蓄積モードアプリとの連携\n  • ユーザ設定")
                    .foregroundStyle(.gray)
                    .font(.custom(Constant.Font.kRegular, size: 15))
                /// Bottom View
                Spacer()
                    .frame(height: Constant.SpaceHeight.kBottomViewIntroHeight)
                
                ZStack {
                    /// Dashborad Line
                    RoundedRectangle(cornerRadius: 30)
                    .strokeBorder(style: StrokeStyle(lineWidth: 2, dash: [4]))
                    .frame(width: 320, height: 70)
                    .foregroundColor(.indigo)
                    Button(action: { 
            
                       pushToPowerPlantSelectionView = true
                    }, label: {
                            Text("始めましょう")
                            .frame(width: 300 , height: 50, alignment: .center)
                        })
                        .foregroundColor(.white)
                        .font(.custom(Constant.Font.kBold, size: Constant.Font.kSize))
                        .background(.indigo)
                        .cornerRadius(25)
                        .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30))
                    NavigationLink("",destination: PowerPlantSelectionView(),isActive: $pushToPowerPlantSelectionView)
                }
            })
            .padding(Constant.SpaceHeight.kMinimumSpaceHeight)
        }
    }
}

#Preview {
    IntroView()
}
