//
//  ContentView.swift
//  RLSSwiftUI
//
//  Created by Hetal Mehta on 27/12/23.
//

import SwiftUI

struct ContentView: View {
    
    /// Selected Index
    @Binding var selectedIndex: Int
    
    var body: some View {
        if selectedIndex == 0 {
            PowerPlantList()
            .navigationBarBackButtonHidden(true)
        } else {
            SettingView()
            .navigationBarBackButtonHidden(true)
        }
    }
}
