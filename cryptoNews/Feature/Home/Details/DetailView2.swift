//
//  DetailView2.swift
//  cryptoNews
//
//  Created by trungnam on 2/7/24.
//
import Combine
import SwiftUI

struct DetailView2: View {
    @StateObject var viewmodel: DetailView2Model

    var body: some View {
        VStack {
            Text("DetailView2")
            Text("back to home")
                .foregroundColor(.red)
                .onTapGesture {
                viewmodel.delegate?.popToHome()
            }
            // Add other detail views for price, chart, etc.
        }
    }
}
class DetailView2Model: ObservableObject {
    weak var delegate: (any AppCoordinatorDelegate)?
    init(delegate: (any AppCoordinatorDelegate)? = nil) {
        self.delegate = delegate
    }
}
