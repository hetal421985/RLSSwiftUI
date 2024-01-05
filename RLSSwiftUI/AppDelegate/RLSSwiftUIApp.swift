//
//  RLSSwiftUIApp.swift
//  RLSSwiftUI
//
//  Created by Hetal Mehta on 22/12/23.
//

import SwiftUI
import SwiftData

@main
struct RLSSwiftUIApp: App {
 
    private var container: ModelContainer
    init() {
       
        let finalSchema = Schema([PowerPlantListModel.self, PowerPlantName.self, UserListModel.self])
        do {
            container = try ModelContainer(for: finalSchema, migrationPlan: MigrationPlan.self, configurations: ModelConfiguration(for: PowerPlantListModel.self, PowerPlantName.self, UserListModel.self ))

        } catch {
            fatalError("Could not initialize the container.")
        }
        
    }
    var body: some Scene {
        
        WindowGroup {
            SplashView()
                .modelContainer(container)
        }
    }
}
