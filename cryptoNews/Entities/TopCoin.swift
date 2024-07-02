//
//  TopCoin.swift
//  cryptoNews
//
//  Created by trungnam on 1/7/24.
//
import Foundation

class TopCoin: Identifiable {
    let id = UUID()
    var name: String
    var displayPrice: Double
    init(name: String, displayPrice: Double) {
        self.name = name
        self.displayPrice = displayPrice
    }
}
