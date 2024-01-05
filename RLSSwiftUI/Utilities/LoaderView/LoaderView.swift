//
//  LoaderView.swift
//  RLSSwiftUI
//
//  Created by Hetal Mehta on 01/01/24.
//

import SwiftUI

struct LoaderView: View {
    
    var tintColor: Color = .blue
    var scaleSize: CGFloat = 3.0
    
    var body: some View {
        ProgressView()
        .scaleEffect(scaleSize, anchor: .center)
        .progressViewStyle(CircularProgressViewStyle(tint: tintColor))
    }
}

#Preview {
    LoaderView()
}
