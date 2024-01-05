//
//  NetworkModel.swift
//  RLSSwiftUI
//
//  Created by Hetal Mehta on 05/01/24.
//

import Foundation

struct PowerPlantListData: Codable {
    /// ID
    var id: Int
    /// Title
    var title: String
    /// Exapanded
    var expanded: Bool
    /// Data
    var data: [PowerPlantNameData]
}

struct PowerPlantNameData: Codable {
    
    /// ID
    var id: Int
    /// Name
    var name: String
}
