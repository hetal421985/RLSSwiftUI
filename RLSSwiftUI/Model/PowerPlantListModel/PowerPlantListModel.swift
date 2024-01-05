//
//  PowerPlantListModel.swift
//  RLSSwiftUI
//
//  Created by Hetal Mehta on 01/01/24.
//

import SwiftUI
import SwiftData

enum SchemaV2: VersionedSchema {
    
    static var versionIdentifier = Schema.Version(2, 0, 0)
    
    static var models: [any PersistentModel.Type] {
        [PowerPlantListModel.self,PowerPlantName.self,UserListModel.self]
    }
    
    @Model
    class PowerPlantListModel: Codable, Identifiable {
        
        /// ID
        var id: Int
        /// Title
        var title: String
        /// Expanded
        var expanded: Bool
        /// Data
       var data: [PowerPlantName] 
                   
        enum CodingKeys: String, CodingKey {
            case id = "id"
            case title = "title"
            case expanded = "expanded"
            case data = "data"
        }
        
        init(id: Int, title: String, expanded: Bool) {
            self.id = id
            self.title = title
            self.expanded = expanded
            self.data = []
        }
        
        required init(from decoder:Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            id = try container.decode(Int.self, forKey: .id)
            title = try container.decode(String.self, forKey: .title)
            expanded = try container.decode(Bool.self, forKey: .expanded)
            data = try container.decode([PowerPlantName].self, forKey: .data)
        }
        
        internal func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(title, forKey: .title)
            try container.encode(id, forKey: .id)
            try container.encode(expanded, forKey: .expanded)
            try container.encode(data, forKey: .data)
        }
    }
    
    @Model
    class PowerPlantName: Codable, Identifiable {
        
        /// ID
        var id: Int
        ///Power Plant Name
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

enum MigrationPlan: SchemaMigrationPlan {
    
  static var schemas: [any VersionedSchema.Type] {
    [SchemaV1.self, SchemaV2.self]
  }

    static let migrateV1toV2 = MigrationStage.custom(
      fromVersion: SchemaV1.self,
      toVersion: SchemaV2.self,
      willMigrate: { context in
        let trips = try? context.fetch(FetchDescriptor<SchemaV1.UserListModel> ())
        try? context.save ()
      },
      didMigrate: nil
    )
  static var stages: [MigrationStage] { [migrateV1toV2] }
}
