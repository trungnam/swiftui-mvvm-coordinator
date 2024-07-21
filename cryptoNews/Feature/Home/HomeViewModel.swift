//
//  HomeViewModel.swift
//  cryptoNews
//
//  Created by trungnam on 1/7/24.
//
import Combine
import Foundation
import SwiftData
import SwiftUI
protocol HomeViewModelProtocol: BaseViewModelProtocol {

}

final class HomeViewModel: BaseViewModel, HomeViewModelProtocol {
    
    @Published private(set) var topListPrices: [TopCoin] = []
    @Published private(set) var topNewsList: [News] = []
    @Published private(set) var lastViewCoins: [LastViewCoin] = []

    private var cancellables = Set<AnyCancellable>()
    private var apiService: ApiServiceProtocol
    
    weak var delegate: (any AppCoordinatorDelegate)?
        
    init(
        delegate: (any AppCoordinatorDelegate)? = nil,
        apiService: ApiServiceProtocol = ApiService()
    ) {
        self.delegate = delegate
        self.apiService = apiService
        super.init()
        transform()
    }
    
    func transform() {
        fetchingTopListPrices()
        fetchingNewsList()
    }
    
    func goToCoinDetail() {
        if let delegate = delegate {
            delegate.naviToDetailCoin()
        }
    }
    
    func fetchingTopListPrices() {
        apiService.fetchPrice()
            .throttle(for: .seconds(5),
                      scheduler: DispatchQueue.main,
                      latest: false)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(_):
                    break
                }
            } receiveValue: { [weak self] coins in
                self?.topListPrices = coins
            }
            .store(in: &cancellables)
    }
    
    func fetchingNewsList() {
        apiService.fetchNews()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished: break
                case .failure(_): break
                }
            } receiveValue: { [weak self] listNews in
                self?.topNewsList = listNews
            }
            .store(in: &cancellables)
    }
    
    func saveToHistory(coin: TopCoin) {
        apiService.saveToHistory(coin: coin)
    }
    
    func fetchHistory() {
        apiService.fetchHistory()
            .subscribe(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case.finished: break
                case.failure(let error):
                    print(error)
                }
            } receiveValue: { [weak self] coins in
                self?.lastViewCoins = coins
            }
            .store(in: &cancellables)
    }
}
