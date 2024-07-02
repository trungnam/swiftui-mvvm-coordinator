//
//  ContentView.swift
//  cryptoNews
//
//  Created by trungnam on 1/7/24.
//

import Foundation
import SwiftUI

struct HomeView: View {

    @StateObject var viewModel : HomeViewModel

    var body: some View {
            ScrollView {
                VStack {
                    if viewModel.topListPrices.isEmpty {
                        Rectangle()
                            .foregroundColor(.white)
                            .frame(height: 100)
                            .overlay {
                                ProgressView("Loading...")
                                    .progressViewStyle(
                                        CircularProgressViewStyle()
                                    )
                                    .padding()
                            }
                    } else {
                        ScrollView(
                            .horizontal,
                            content: {
                                HStack {
                                    ForEach(viewModel.topListPrices) { coin in
                                        Rectangle().frame(
                                            width: 100, height: 100
                                        )
                                        .cornerRadius(10)
                                        .foregroundColor(.orange)
                                        .overlay {
                                            VStack {
                                                Text(coin.name)
                                                Text(
                                                    coin.displayPrice.toString(
                                                        withDecimalPlaces: 1))
                                            }
                                        }
                                        .onAppear(perform: {

                                        })
                                        .onTapGesture {
                                            //on tap
                                            viewModel.goToCoinDetail()
                                        }
                                    }
                                }
                                .padding(10)
                            })
                    }
                    Text("Market Cap Over Years")
                        .font(.title2)
                        .padding(.top, 20.0)
                    GradientChartView()
                        .padding(.all, 8.0)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(height: 200)
                    ScrollView(.horizontal) {
                        if viewModel.topNewsList.isEmpty {
                            EmptyView()
                        } else {
                            HStack {
                                ForEach(viewModel.topNewsList) { news in
                                    Rectangle().frame(
                                        width: 200, height: 100
                                    )
                                    .cornerRadius(10)
                                    .foregroundColor(.green)
                                    .overlay {
                                        VStack {
                                            Text(news.title)
                                        }
                                    }
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 8.0)
                }
            }
            .navigationTitle("Crypto news")
            .navigationBarTitleDisplayMode(.inline)
        }
    
}

#Preview {
    HomeView(viewModel: HomeViewModel())
}

