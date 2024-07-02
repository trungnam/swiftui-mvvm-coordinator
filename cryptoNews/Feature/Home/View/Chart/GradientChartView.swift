//
//  GradientChartView.swift
//  cryptoNews
//
//  Created by trungnam on 1/7/24.
//

import SwiftUI
import Charts


struct MarketCapData: Identifiable {
    let id = UUID()
    let year: Int
    let value: Double
    
}

extension MarketCapData {
    static let exampleData: [MarketCapData] = [
        MarketCapData(year: 2014, value: 1600.0),
        MarketCapData(year: 2015, value: 2000.0),
        MarketCapData(year: 2016, value: 2500.0),
        MarketCapData(year: 2017, value: 5000.0),
        MarketCapData(year: 2018, value: 4500.0),
        MarketCapData(year: 2019, value: 5500.0),
        MarketCapData(year: 2020, value: 7000.0),
        MarketCapData(year: 2021, value: 9000.0),
        MarketCapData(year: 2022, value: 8500.0),
        MarketCapData(year: 2023, value: 10200.0)
    ]
}


struct GradientChartView: View {
    let linearGradient = LinearGradient(
        gradient: Gradient(
            colors: [
                Color.accentColor.opacity(
                    0.4
                ),
                Color.accentColor
                    .opacity(
                        0
                    )
            ]
        ),
        startPoint: .top,
        endPoint: .bottom
    )
    let marketCapData = MarketCapData.exampleData
    var body: some View {
        GeometryReader { geometry in
            Chart {
                ForEach(marketCapData) { data in
                    LineMark(x: .value("Year", data.year),
                             y: .value("Value", data.value))
                }
                .interpolationMethod(.cardinal)
                ForEach(marketCapData) { data in
                    AreaMark(x: .value("Year", data.year),
                             y: .value("Value", data.value))
                }
                .interpolationMethod(.cardinal)
                .foregroundStyle(linearGradient)
            }
            .chartXScale(domain: 2014...2023)
            .chartLegend(.hidden)
            .chartXAxis {
                AxisMarks(values: [2014, 2016, 2018, 2020, 2022]) { value in
                    AxisGridLine()
                    AxisTick()
                    if let year = value.as(Int.self) {
                        AxisValueLabel("\(year)", centered: false, anchor: .top)
                    }
                }
                
            }            
            .padding()
        }
    }
}

struct GradientChart_Previews: PreviewProvider {
    static var previews: some View {
        GradientChartView()
    }
}
