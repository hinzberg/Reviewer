//  ReviewChartData.swift
//  Reviewer
//  Created by Holger Hinzberg on 25.10.25.

import Foundation

public struct ReviewChartData: Identifiable {
    public let id = UUID()
    public let title: String
    public let value: Double
}
