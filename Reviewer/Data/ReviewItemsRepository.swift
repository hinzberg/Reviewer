//  ReviewItemsRepository.swift
//  Reviewer
//  Created by Holger Hinzberg on 16.10.25.

import SwiftUI
import Observation

@Observable
public class ReviewItemsRepository {
    
    public var items : [ReviewItem]
    
    init () {
        items = []
                
        let item1 = ReviewItem(name: "Onboarding", comment:  "Comment 1", note: "Oct 10")
        item1.addChild(item: ReviewItem(name: "Report.pdf", comment:  "Comment 1.1", note: "OK"))
        item1.addChild(item: ReviewItem(name: "Notes.txt", comment:  "Comment 1.2", note: "Need update"))
       let subitem1 = ReviewItem(name: "Sales.txt", comment:  "Comment 1.3", note: "Need review")
        subitem1.addChild(item: ReviewItem(name: "Vacation.png", comment: "Comment 1.3.1", note:  "Oct 2"))
        item1.addChild(item: subitem1)
        items.append(item1)
        
        let item2  = ReviewItem(name: "Technical Validation", comment: "Comment 2", note: "Oct 8")
        item2.addChild(item: ReviewItem(name: "Vacation.png", comment: "Comment 2.1", note:  "Oct 2"))
        item2.addChild(item: ReviewItem(name: "Paris.png", comment: "Comment 2.2", note:  "Oct 2"))
        item2.addChild(item: ReviewItem(name: "London.png", comment: "Comment 2.3", note:  "Oct 2"))
        items.append(item2)
    }
    
    

    
    
}

