//
//  ReviewItemsTreeTableView.swift
//  Reviewer
//
//  Created by Holger Hinzberg on 16.10.25.
//

import SwiftUI

public struct ReviewItemsTreeTableView: View {
    
    @State private var reviewItems : [ReviewItem]
    @State private var selection: ReviewItem.ID? = nil
    @State private var sortOrder = [KeyPathComparator(\ReviewItem.name)]
    @State private var selectedOption: CheckState = .Unchecked
    @State private var repository : ReviewItemsRepository

    public init(repository: ReviewItemsRepository) {
        self._reviewItems = State(initialValue: repository.items)
        self.repository = repository
    }
    
    public var body: some View {
        NavigationStack {
            
            Table(of: ReviewItem.self,   selection: $selection, sortOrder: $sortOrder, columns: {
                
                TableColumn("Name" , value: \.name) { item in
                    HStack {
                        if (item.imageName != "")
                        {
                            Image(systemName: item.imageName)
                                .resizable()
                                .frame(width: 20, height: 20)
                                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
                        }
                        
                        Text("\(item.name)")
                            .font(.title2)
                            .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0))
                    }
                }

                TableColumn("Description", value: \.description) { item in
                    Text("\(item.description)")
                        .font(.title2)
                }
                
                TableColumn("Comment", value: \.userComment  ) { item in
                    Text("\(item.userComment)")
                        .font(.title2)
                }
                
                TableColumn("State") { item in
                    CheckStateChangeMenu(repository: repository, item: item)
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

