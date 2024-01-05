//
//  PowerPlantList.swift
//  RLSSwiftUI
//
//  Created by Hetal Mehta on 03/01/24.
//

import SwiftUI
import SwiftData

typealias PowerPlantListModel = SchemaV2.PowerPlantListModel

final class PowerPlantListAPIManager {
    
    static let sharedInstance = PowerPlantListAPIManager()
    
    private init(){}
        
    /*
     Following function will make API call to get power plant list
     */
    
   func callWebServiceToGetPowerPlantList(completionHandler: @escaping([PowerPlantListData]?, Bool) -> Void){
        
        APIManager.sharedInstance.getAPIResponse(for: [PowerPlantListData].self, aStrURL: Constant.kPowerPlantList, bodyPerameter: nil, methodName: "GET") { arrData, success in
            
            guard success else {
                completionHandler(nil,success)
                return
            }
            completionHandler(arrData,success)
        }
    }
}

