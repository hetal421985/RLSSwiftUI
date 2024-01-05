//
//  SplashView.swift
//  RLSSwiftUI
//
//  Created by Hetal Mehta on 22/12/23.
//

import SwiftUI

struct SplashView: View {
    
    /// Flag To Show Intro Screen
    @State var shouldLoadIntro = false
    
    var body: some View {
        ZStack {
            /// Load Intro View 
            if shouldLoadIntro {
                IntroView()
            } else {
                
                /// Background Gradient
                LinearGradient(colors: [Color(Constant.Color.kSplash),Color(Constant.Color.kSplashStrongDark)], startPoint: .top, endPoint: .bottom)
                /// Show Logo and Title
                VStack {
                    
                    /// Top View Space
                    Spacer()
                        .frame(height: Constant.SpaceHeight.kTopViewSpashHeight)
                    /// Middle View
                    Image("logo")
                    Spacer()
                        .frame(height: Constant.SpaceHeight.kMinimumSpaceHeight)
                    Text("エネルギーを新しい時代へ")
                        .foregroundStyle(.white)
                        .font(.custom(Constant.Font.kMedium, size: Constant.Font.kSize))
                    
                    /// Bottom View
                    Spacer()
                        .frame(height: Constant.SpaceHeight.kBottomViewSpashHeight)
                    Text("登録者リスト")
                        .foregroundStyle(.white)
                        .font(.custom(Constant.Font.kBold, size: Constant.Font.kBoldSize))
                    
                    
                }
            }
        }
        .ignoresSafeArea(.all)
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation {
                    self.shouldLoadIntro = true
                }
            }
        }
    }
}

#Preview {
    SplashView()
}
