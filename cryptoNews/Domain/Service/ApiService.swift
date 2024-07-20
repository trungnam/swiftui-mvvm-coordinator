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
}

class ApiService: ApiServiceProtocol {
    
    // Init your repository here
    let repo: AppRepositoryProtocol
    
    init(repo: AppRepositoryProtocol = AppRepository()) {
        self.repo = repo
    }
    
    func fetchNews() ->  Future<[News], Error> {
        repo.fetchNews()
    }
    
    func fetchPrice() -> AnyPublisher<[TopCoin], Error>{
        repo.fetchPrice()
    }
    
}
