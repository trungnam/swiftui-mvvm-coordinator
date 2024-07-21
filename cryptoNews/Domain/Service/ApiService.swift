//
//  ApiService.swift
//  cryptoNews
//
//  Created by trungnam on 1/7/24.
//
import Foundation
import Combine

protocol ApiServiceProtocol {
    func fetchNews() -> Future<[News], Error>
    func fetchPrice() -> AnyPublisher<[TopCoin], Error>
    func saveToHistory(coin: TopCoin)
    func fetchHistory() -> Future<[LastViewCoin], Error>
}

class ApiService: ApiServiceProtocol {
        
    // Init your repository here
    let repo: AppRepositoryProtocol
    
    // TODO: fix warning
    init(repo: AppRepositoryProtocol = AppRepository(local: LocalDataSource.shared)) {
        self.repo = repo
    }
    
    func fetchNews() ->  Future<[News], Error> {
        repo.fetchNews()
    }
    
    func fetchPrice() -> AnyPublisher<[TopCoin], Error>{
        repo.fetchPrice()
    }
    
    func saveToHistory(coin: TopCoin) {
        repo.saveToHistory(coin: coin)
    }
    
    func fetchHistory() -> Future<[LastViewCoin], any Error> {
        repo.fetchHistory()
    }
}
