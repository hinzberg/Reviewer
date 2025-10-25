//
//  ReviewItemsCountChartView.swift
//  Reviewer
//
//  Created by Holger Hinzberg on 25.10.25.
//

import SwiftUI
import Charts

struct ReviewItemsCountChartView: View {
    
    @Environment(ReviewItemsRepository.self) private var repository
    
    var body: some View {
        Chart(repository.chartDatas) { chartData in
            SectorMark(
                angle: .value(
                    Text(verbatim: chartData.title),
                    chartData.value ),
                innerRadius: .ratio(0.65),
                angularInset: 2,
            )
            .cornerRadius(5)
            .foregroundStyle(
                by: .value(
                    Text(verbatim: chartData.title),
                    chartData.title
                )
            )
        }
        .chartForegroundStyleScale([
            "Ok" : Color.Ok,
            "Failed" : Color.Failed,
            "Unchecked" : Color.Unchecked,
            "Review": Color.Review])
        .chartLegend(.hidden)
    }
}

#Preview {
    ReviewItemsCountChartView()
}
