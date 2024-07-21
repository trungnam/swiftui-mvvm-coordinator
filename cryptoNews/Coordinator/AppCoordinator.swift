//
//  AppCoordinator.swift
//  cryptoNews
//
//  Created by trungnam on 1/7/24.
//

import Foundation
import Combine
import SwiftUI
import SwiftData

final class AppCoordinator: ObservableObject, AppCoordinatorDelegate {

    @Published var path: NavigationPath { 
        didSet {
            // Log the path change after the update
            print("Navigation path changed to: \(path)")
        }
    }
    
    init(path: NavigationPath) {
        self.path = path
    }
    
    @ViewBuilder
    func createFirstModule(modelContext: ModelContext) -> some View {
        HomeView(
            viewModel: HomeViewModel(
                delegate: self
            )
        )
        .navigationDestination(
            for: NavigationDestination.self
        ) { [weak self] hash in
            self?.navigationDestination(
                hash
            )
        }
    }
    
    @ViewBuilder
    func navigationDestination(
        _ with: NavigationDestination
    ) -> some View {
        switch with {
        case .detail:
            DetailView(viewmodel:
                        DetailViewModel(delegate: self))
        case .detail2:
            DetailView2(viewmodel:
                            DetailView2Model(delegate: self))
        }
    }
    
    func naviToDetailCoin() {
        path.append(NavigationDestination.detail)
    }
    
    func naviToDetailCoin2() {
        path.append(NavigationDestination.detail2)
    }
    
    func popToHome() {
        path.removeLast(path.count)
    }
    
}


protocol AppCoordinatorDelegate: AnyObject {
    associatedtype ViewController: View

    @ViewBuilder func createFirstModule(modelContext: ModelContext) -> ViewController
    
    func naviToDetailCoin()
    
    func naviToDetailCoin2()

    func popToHome()
}

enum NavigationDestination: Hashable {
    case detail
    case detail2
}
