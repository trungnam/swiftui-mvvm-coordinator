//
//  cryptoNewsApp.swift
//  cryptoNews
//
//  Created by trungnam on 1/7/24.
//

import SwiftUI

@main
struct cryptoNewsApp: App {
    @StateObject private var appCoordinator = AppCoordinator(path: NavigationPath())
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $appCoordinator.path) {
                appCoordinator.createFirstModule()
            }
        }
    }
}
