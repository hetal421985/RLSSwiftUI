//
//  DataManager.swift
//  RLSSwiftUI
//
//  Created by Hetal Mehta on 25/12/23.
//

import SwiftUI

final class DataManager: ObservableObject  {
    
    @Published var powerplant = [PowerPlantModel]()
    
    init(){
        readPowerPlantListFromJSON()
    }
    
    /*
     This Function will read powerplant list
     */
    
    fileprivate func readPowerPlantListFromJSON()  {
        guard let url = Bundle.main.url(forResource: "powerplantlist", withExtension: "json")
            else {
                print("Json file not found")
                return
            }
        
        let data = try? Data(contentsOf: url)
        let powerplantlist = try? JSONDecoder().decode([PowerPlantModel].self, from: data!)
        self.powerplant = powerplantlist!
    }
}
