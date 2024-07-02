//
//  DetailView.swift
//  cryptoNews
//
//  Created by trungnam on 2/7/24.
//
import SwiftUI

struct DetailView: View {
    @StateObject var viewmodel: DetailViewModel
    var body: some View {
        VStack {
            Text("DetailView")
            Text("go to DetailView2")
                .foregroundColor(.red)
                .onTapGesture {
                    viewmodel.delegate?.naviToDetailCoin2()
                }
            // Add other detail views for price, chart, etc.
        }
    }
}
class DetailViewModel: ObservableObject {
    weak var delegate: (any AppCoordinatorDelegate)?
    init(delegate: (any AppCoordinatorDelegate)? = nil) {
        self.delegate = delegate
    }
}
