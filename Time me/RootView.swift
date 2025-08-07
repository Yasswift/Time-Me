//
//  RootView.swift
//  Time me
//
//  Created by Yassine Toutouh on 02/08/2025.
//

import SwiftData
import SwiftUI

@main
struct RootView: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            TimerModel.self,
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
            TimersView()
                .preferredColorScheme(.dark)
        }
        .modelContainer(sharedModelContainer)
    }
}
