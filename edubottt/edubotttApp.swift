//
//  edubotttApp.swift
//  edubottt
//
//  Created by Mochy on 2024-05-12.
//

import SwiftUI
import SwiftData
import Firebase
import FirebaseAuth
@main
struct edubotttApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
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
            Root()
        }
        .modelContainer(sharedModelContainer)
    }
}
class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
      print("Configured firebase")
    return true
  }
}
