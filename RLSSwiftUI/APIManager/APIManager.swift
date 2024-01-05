//
//  APIManager.swift
//  RLSSwiftUI
//
//  Created by Hetal Mehta on 01/01/24.
//

import Foundation

final class APIManager: ObservableObject {
    
    static let sharedInstance = APIManager()
    
    private init(){}
    /*
     Following function will make API call to get power plant list
     */
    
    func getAPIResponse<T: Codable>(for: T.Type = T.self, aStrURL: String, bodyPerameter: [String:Any]?, methodName: String, completionHandler: @escaping(T?, Bool) -> Void){
        
        var urlRequest = URLRequest(url: URL(string:aStrURL)!)
        urlRequest.httpMethod = methodName
        
        let task = URLSession.shared.dataTask(with: urlRequest) {data, response, error in
            
            guard data != nil else {
                completionHandler(nil, false)
                return
            }
            let arrData = try? JSONDecoder().decode(T.self, from: data!)
            completionHandler(arrData, true)
        }
        task.resume()
    }
}

