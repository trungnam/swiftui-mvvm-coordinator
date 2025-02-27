//
//  RemoteSource.swift
//  cryptoNews
//
//  Created by trungnam on 17/7/24.
//

import Combine
import Foundation

protocol RemoteSourceProtocol {
    func fetchNews() -> Future<[News], Error>
    func fetchPrice() -> AnyPublisher<[TopCoin], Error>
}

class RemoteSource: RemoteSourceProtocol {
    private var timer: AnyPublisher<Date, Never> {
        Timer
            .publish(every: 5.0, on: .main, in: .common)
            .autoconnect()
            .eraseToAnyPublisher()
    }
    
    func fetchNews() -> Future<[News], Error> {
        return Future { promise in
            Task {
                do {
                    let result = try await self.fetchTopNews()
                    promise(.success(result))
                } catch {
                    promise(.failure(error))
                }
            }
        }
    }
    
    func fetchPrice() -> AnyPublisher<[TopCoin], any Error> {
        timer.map { _ in
            return [
            TopCoin(name: "Bitcoin", displayPrice: Double.random(in: 50000...100000)),
            TopCoin(name: "Ethereum", displayPrice: Double.random(in: 3000...10000)),
            TopCoin(name: "LiteCoin", displayPrice: Double.random(in: 70...500)),
            TopCoin(name: "Ton", displayPrice: Double.random(in: 7...50)),
            TopCoin(name: "Xrp", displayPrice: Double.random(in: 0.5...5))]
        }
        .mapError { _ in NSError() as Error } // Just a placeholder error
        .eraseToAnyPublisher()
    }
    
    func simulateNetworkDelay() async throws {
        try await Task.sleep(nanoseconds: 2 * 1_000_000_000) // 2 seconds
    }

    func fetchTopNews() async throws -> [News] {
        try await simulateNetworkDelay()
        
        return [
            News(
                title: "Philippines adopts Tether’s USDT for social security payments",
                url: ""
            ),
            News(
                title: "German, US govt's move $150M in crypto",
                url: ""
            ),
            News(
                title: "History suggests Bitcoin poised for rebound in July",
                url: ""
            ),
            News(
                title: "SEC sues Consensys over MetaMask’s brokerage, staking services",
                url: ""
            ),
            News(
                title: "Was sub-$60K a bear trap? 5 things to know in Bitcoin this week",
                url: ""
            )
        ]
    }
}
