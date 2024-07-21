//
//  LocalDataSource.swift
//  cryptoNews
//
//  Created by trungnam on 17/7/24.
//

import SwiftData
import Foundation
import Combine

protocol LocalDataSourceProtocol {
    func saveToHistory(coin: TopCoin)
    func fetchHistory() -> Future<[LastViewCoin], Error>
}

class LocalDataSource: LocalDataSourceProtocol {
    private let modelContainer: ModelContainer
    private let modelContext: ModelContext
    
    @MainActor
    static let shared = LocalDataSource()

    @MainActor
    private init() {
        self.modelContainer = try! ModelContainer(for: LastViewCoin.self)
        self.modelContext = modelContainer.mainContext
    }
    
    func saveToHistory(coin: TopCoin) {
        modelContext.insert(LastViewCoin(id: UUID(),
                                         name: coin.name))
    }
    
    func fetchHistory() -> Future<[LastViewCoin], Error> {
        return Future { promise in
            do {
                let lastViewCoins = try self.modelContext
                    .fetch(
                        FetchDescriptor<LastViewCoin>()
                    )
                promise(.success(lastViewCoins))
            } catch {
                promise(.failure(error))
            }
        }
    }
}
