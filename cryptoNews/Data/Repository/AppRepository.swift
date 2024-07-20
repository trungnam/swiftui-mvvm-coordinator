//
//  AppRepository.swift
//  cryptoNews
//
//  Created by trungnam on 17/7/24.
//

import Combine

protocol AppRepositoryProtocol: AnyObject {
    func fetchNews() -> Future<[News], Error>
    func fetchPrice() -> AnyPublisher<[TopCoin], Error>
}

class AppRepository: AppRepositoryProtocol {
    
    let local: LocalDataSourceProtocol
    let remote: RemoteSourceProtocol
    init(
        local: LocalDataSource = LocalDataSource(),
        remote: RemoteSource = RemoteSource()
    ) {
        self.local = local
        self.remote = remote
    }
    
    func fetchNews() -> Future<[News], any Error> {
        remote.fetchNews()
    }
    
    func fetchPrice() -> AnyPublisher<[TopCoin], any Error> {
        remote.fetchPrice()
    }
}
