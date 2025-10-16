//
//  ReviewItemsTreeTableView.swift
//  Reviewer
//
//  Created by Holger Hinzberg on 16.10.25.
//

import SwiftUI

public struct ReviewItemsTreeTableView: View {
    
    public init(reviewItems: [ReviewItem]) {
        self._reviewItems = State(initialValue: reviewItems)
    }
    
    @State private var reviewItems : [ReviewItem]
    @State private var selection: ReviewItem.ID? = nil
    
    public var body: some View {
        NavigationStack {
            
            Table(of: ReviewItem.self,   selection: $selection, columns: {
                
                TableColumn("Name") { item in
                    Text("\(item.name)")
                        .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0))
                }
                
                TableColumn("Comment") { item in
                    Text("\(item.comment)")
                }
                
                TableColumn("Note") { item in
                    Text("\(item.note)")
                }
            }, rows: {
                OutlineGroup(reviewItems, children: \.children) { item in
                    TableRow(item)
                }
            })
            .tableStyle(InsetTableStyle(alternatesRowBackgrounds: true))
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

