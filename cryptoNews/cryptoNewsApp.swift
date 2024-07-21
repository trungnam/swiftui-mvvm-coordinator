//
//  cryptoNewsApp.swift
//  cryptoNews
//
//  Created by trungnam on 1/7/24.
//

import SwiftUI
import SwiftData

@main
struct cryptoNewsApp: App {
    @StateObject private var appCoordinator = AppCoordinator(path: NavigationPath())
    let container: ModelContainer
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $appCoordinator.path) {
                appCoordinator.createFirstModule(modelContext: container.mainContext)
            }
        }
        .modelContainer(container)
    }
    
    init() {
        do {
            container = try ModelContainer(for: LastViewCoin.self)
        } catch {
            fatalError("Failed to create ModelContainer for Movie.")
        }
    }
}
