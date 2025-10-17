//
//  ReviewItemsTreeTableView.swift
//  Reviewer
//
//  Created by Holger Hinzberg on 16.10.25.
//

import SwiftUI

public struct ReviewItemsTreeTableView: View {
    
    public init(repository: ReviewItemsRepository) {
        self._reviewItems = State(initialValue: repository.items)
    }
    
    @State private var reviewItems : [ReviewItem]
    @State private var selection: ReviewItem.ID? = nil
    @State private var sortOrder = [KeyPathComparator(\ReviewItem.name)]
    
    @State private var selectedOption: CheckState = .Unchecked
    
    public var body: some View {
        NavigationStack {
            
            Table(of: ReviewItem.self,   selection: $selection, sortOrder: $sortOrder, columns: {
                
                TableColumn("Name" , value: \.name) { item in
                    Text("\(item.name)")
                        .font(.title2)
                        .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0))
                }
                
                TableColumn("Comment", value: \.comment  ) { item in
                    Text("\(item.comment)")
                        .font(.title2)
                }
                
                TableColumn("Note", value: \.note) { item in
                    Text("\(item.note)")
                        .font(.title2)
                }
                
                TableColumn("State") { item in
                    CheckStateChangeMenu(item: item)
                }
            }, rows: {
                OutlineGroup(reviewItems, children: \.children) { item in
                    TableRow(item)
                }
            })
            .tableStyle(InsetTableStyle(alternatesRowBackgrounds: false))
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            .onChange(of: sortOrder) { oldValue, newValue in
                reviewItems.sort(using: newValue)
            }
        }
    }
}

