//
//  News.swift
//  cryptoNews
//
//  Created by trungnam on 1/7/24.
//

import Foundation

class News: Identifiable {
    let id = UUID()
    var title: String
    var url: String
    init(title: String, url: String) {
        self.title = title
        self.url = url
    }
}
