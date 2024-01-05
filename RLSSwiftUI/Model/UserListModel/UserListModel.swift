//
//  UserListModel.swift
//  RLSSwiftUI
//
//  Created by Hetal Mehta on 03/01/24.
//

import SwiftUI
import SwiftData

enum SchemaV1: VersionedSchema {
    
    static var versionIdentifier = Schema.Version(1, 0, 0)
   
    static var models: [any PersistentModel.Type] {
        [UserListModel.self]
    }
    
    @Model
    class UserListModel: Codable, Identifiable {
        
        /// ID
        var id: Int
        /// User Name
        var name: String
        
        enum CodingKeys: String, CodingKey {
            case id = "id"
            case name = "name"
        }
        
        init(id: Int, name: String) {
            self.id = id
            self.name = name
        }
        
        required init(from decoder:Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            id = try container.decode(Int.self, forKey: .id)
            name = try container.decode(String.self, forKey: .name)
        }
        
        internal func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(name, forKey: .name)
            try container.encode(id, forKey: .id)
        }
    }
}

