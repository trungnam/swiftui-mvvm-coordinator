//
//  Double+.swift
//  cryptoNews
//
//  Created by trungnam on 2/7/24.
//

extension Double {
    func toString(withDecimalPlaces places: Int) -> String {
        return String(format: "%.\(places)f", self)
    }
}
