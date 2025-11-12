//  ReviewItemsRepository.swift
//  Reviewer
//  Created by Holger Hinzberg on 16.10.25.

import SwiftUI
import Observation

@Observable
public class ReviewItemsRepository {
    
    public var items : [ReviewItem]
    public var okItemsCount = 0;
    public var reviewItemsCount = 0;
    public var failedtemsCount = 0;
    public var uncheckedItemsCount = 0;
    public var chartDatas = [ReviewChartData]()
    private let checkManager = CheckStateManager()
    
    init () {
        items = []
                
        let item1 = ReviewItem(name: "Onboarding", userComment:  "You have to love this!", description: "It all starts here", image: "clock.badge.airplane.fill")
        item1.addChild(item: ReviewItem(name: "Onboarding Sub 1", userComment:  "", description: "More of the same"))
        item1.addChild(item: ReviewItem(name: "Onboarding Sub 2", userComment:  "", description: "Here we go"))
        items.append(item1)
        
        let item2  = ReviewItem(name: "Technical Inspection", userComment: "", description: "Just do something", image: "gearshape")
        item2.addChild(item: ReviewItem(name: "Check 1", userComment: "", description:  ""))
        item2.addChild(item: ReviewItem(name: "Check 2", userComment: "", description:  ""))
  
        let subitem2 = ReviewItem(name: "Maintainance", userComment:  "This always fails!", description: "Mandatory Checks", image: "wrench.and.screwdriver.fill")
        subitem2.addChild(item: ReviewItem(name: "Maintainance 1", userComment: "", description:  "Check Wings"))
        subitem2.addChild(item: ReviewItem(name: "Maintainance 2", userComment: "", description:  "Check Engines"))
        item2.addChild(item: subitem2)
        items.append(item2)
        
        let item3  = ReviewItem(name: "Flight", userComment: "Far above the world", description: "Am I sitting in a tin can", image: "airplane")
        item3.addChild(item: ReviewItem(name: "Flight Sub 1", userComment: "", description:  ""))
        item3.addChild(item: ReviewItem(name: "Flight Sub 2", userComment: "", description:  ""))
        items.append(item3)
        
        let item4  = ReviewItem(name: "Arrival", userComment: "", description: "Prepare for landing", image: "airplane.arrival")
        item4.addChild(item: ReviewItem(name: "Arrival Sub 1", userComment: "", description:  ""))
        item4.addChild(item: ReviewItem(name: "Arrival Sub 2", userComment: "", description:  ""))
        items.append(item4)
        
        updateItemsCount()
        updateChartData()
    }
    
    private func updateItemsCount()  {
        self.failedtemsCount = items.flatMap { $0.itemsRecursively(matching: .Failed)}.count
        self.okItemsCount = items.flatMap { $0.itemsRecursively(matching: .Ok)}.count
        self.reviewItemsCount = items.flatMap { $0.itemsRecursively(matching: .Review)}.count
        self.uncheckedItemsCount = items.flatMap { $0.itemsRecursively(matching: .Unchecked)}.count
    }
    
    private func updateChartData() {
        
        let okPercent = Double(self.items.count) / 100.0 * Double(self.okItemsCount)
        let failedPercent = Double(self.items.count) / 100.0 * Double(self.failedtemsCount)
        let reviewPercent = Double(self.items.count) / 100.0 * Double(self.reviewItemsCount)
        let uncheckedPercent = Double(self.items.count) / 100.0 * Double(self.uncheckedItemsCount)
        
        self.chartDatas = [
            .init(title: "Ok", value: okPercent),
            .init(title: "Review", value: reviewPercent),
            .init(title: "Failed", value: failedPercent),
            .init(title: "Unchecked", value: uncheckedPercent)
        ]
    }
    
    public func UpdateStateAndFamily(item : ReviewItem,  updateState : CheckState) {
        self.checkManager.UpdateStateAndFamily(item: item, updateState: updateState)
        self.updateItemsCount( )
        self.updateChartData()
    }
}
