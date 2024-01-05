//
//  PowerPlantModel.swift
//  RLSSwiftUI
//
//  Created by Hetal Mehta on 25/12/23.
//

import SwiftUI

struct PowerPlantModel: Decodable, Identifiable {
    /// ID
    var id: Int
    /// Power Plant Name
    var powerplantName: String
    /// Power Plant Image
    var powerplantImage: String
    /// Selected 
    var selected: Bool
}
