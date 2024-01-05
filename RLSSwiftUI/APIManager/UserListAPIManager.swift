//
//  UserListAPIManager.swift
//  RLSSwiftUI
//
//  Created by Hetal Mehta on 03/01/24.
//

import SwiftUI
import SwiftData

typealias UserListModel = SchemaV2.UserListModel

final class UserListAPIManager {

   static let sharedInstance = UserListAPIManager()
    
    /*
     This function will call API to get User List
     */
    
    internal func callWebServiceToGetUserList(completionHandler:@escaping([UserListModel]?, Bool)-> Void){
        
        APIManager.sharedInstance.getAPIResponse(for: [UserListModel].self, aStrURL: Constant.kUserList, bodyPerameter: nil, methodName: "GET") { arrData, success in
            completionHandler(arrData,success)
        }
    }
}
