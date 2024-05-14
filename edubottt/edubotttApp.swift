//
//  edubotttApp.swift
//  edubottt
//
//  Created by Mochy on 2024-05-12.
//

import SwiftUI
import SwiftData

@main
struct edubotttApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
     

    var body: some Scene {
        WindowGroup {
            HomePage()
        }
        .modelContainer(sharedModelContainer)
    }
}
