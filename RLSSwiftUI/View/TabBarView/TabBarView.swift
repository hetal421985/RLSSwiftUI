//
//  TabBarView.swift
//  RLSSwiftUI
//
//  Created by Hetal Mehta on 27/12/23.
//

import SwiftUI

struct TabBarView: View {
    
    /// Selected Index
    @State private var selectedIndex: Int = 0
    
    var body: some View {
    
        GeometryReader(content: { geometry in
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, content: {
                
                /// Content View
                ContentView(selectedIndex: $selectedIndex)
                    .frame(height: Constant.TabBar.kContentViewHeight)
                
                /// Bottom Tab Bar View
                HStack{
                    Button(action: {
                        selectedIndex = 0
                    }, label: {
                        Text("三企菜一览")
                        .font(.custom(Constant.Font.kMedium, size: Constant.Font.kRegularSize))
                        .foregroundColor((selectedIndex == 0 ? .indigo : .gray))
                    })
                    .frame(width: Constant.TabBar.kTabBarButtonHeightWidth,height: Constant.TabBar.kTabBarButtonHeightWidth)
                    .padding([.bottom], Constant.TabBar.kTabBarButtonBottomPaddding)
                    Button(action: {
                        selectedIndex = 1
                    }, label: {
                        selectedIndex == 1 ?  Image("setting") :  Image("setting_unselected")
                    })
                    .frame(width: Constant.TabBar.kTabBarButtonHeightWidth,height: Constant.TabBar.kTabBarButtonHeightWidth)
                    .padding([.bottom], Constant.TabBar.kTabBarButtonBottomPaddding)
                }
                .frame(height: Constant.TabBar.kTabBarHeight)
                .padding()
                .background(
                    Rectangle()
                    .fill(Color.white)
                    .cornerRadius(12)
                    .shadow(color:Color.gray.opacity(0.7),radius: 8,x: 0,
                        y: 0))
            })
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
        })
        .ignoresSafeArea(.keyboard)
    }
}

#Preview {
    TabBarView()
}
