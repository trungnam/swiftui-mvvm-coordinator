//
//  LastViewCoin.swift
//  cryptoNews
//
//  Created by trungnam on 20/7/24.
//

import SwiftData
import Foundation

@Model class LastViewCoin: Identifiable {
    let id: UUID
    let name: String
    let timeStamp: Date
    
    init(id: UUID, name: String) {
        self.id = id
        self.name = name
        self.timeStamp = Date.now
    }
}
