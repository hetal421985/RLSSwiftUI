//
//  Constant.swift
//  RLSSwiftUI
//
//  Created by Hetal Mehta on 22/12/23.
//

import Foundation
import UIKit

class Constant: NSObject {
    
    /// Power Plant List URL
    static let kPowerPlantList = "http://demo1230814.mockable.io/powerPlantList"
    /// User List URL
    static let kUserList = "http://demo1230814.mockable.io/userList"
    
    struct SpaceHeight {
        /// Space Height
        static let kMinimumSpaceHeight: CGFloat = 20
        /// Spash Screen Top Height
        static let kTopViewSpashHeight: CGFloat = 220
        /// Spash Screen Bottom Height
        static let kBottomViewSpashHeight: CGFloat = 270
        /// Intro Screen Top View Height
        static let kTopViewIntroHeight: CGFloat = 100
        /// Intro Screen Bottom View Height
        static let kBottomViewIntroHeight: CGFloat = 50
        /// Power Plant List
        static let kPowerPlantListWidth: CGFloat = 120
    }

    /// Font
    struct Font {
        /// Regular
        static let kRegular = "IBMPlexSans-Regular"
        /// Medium
        static let kMedium = "IBMPlexSans-Medium"
        /// Bold
        static let kBold = "IBMPlexSans-Bold"
        /// Size
        static let kSize: CGFloat = 20
        /// Regular Font Size
        static let kRegularSize: CGFloat = 15
        /// Bold Font  Size
        static let kBoldSize: CGFloat = 25
    }
    /// Splash Color
    struct Color {
        static let kSplash = UIColor(red: 45.0/255.0, green: 64.0/255.0, blue: 65.0/255.0, alpha: 1.0)
        static let kSplashStrongDark = UIColor(red: 4.0/255.0, green: 31.0/255.0, blue: 30.0/255.0, alpha: 1.0)
    }
    /// Tab Bar
    struct TabBar {
        /// Tab Bar Height
        static let kTabBarHeight: CGFloat = 80
        /// Tab Bar  Button Width & Height
        static let kTabBarButtonHeightWidth: CGFloat = 200
        /// Content View Height
        static let kContentViewHeight: CGFloat = (UIScreen.main.bounds.size.height - 150)
        /// Tab Bar Button Bottom Padding
        static let kTabBarButtonBottomPaddding: CGFloat = 40
    }
}
