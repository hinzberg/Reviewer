//  CheckStateChangeMenu.swift
//  Reviewer
//  Created by Holger Hinzberg on 17.10.25.

import SwiftUI

public struct CheckStateChangeMenu: View {
    
    var item : ReviewItem
    var repository : ReviewItemsRepository
    // NOTE: This will crash when you take the repository from the enviroment but it will only
    // crash when closing the tree node. This is the reason the repository is passed as a parameter
    
    init(repository: ReviewItemsRepository, item: ReviewItem) {
        self.repository = repository
        self.item = item
    }
    
    public var body: some View {
        Menu {
            ForEach(CheckState.allCases, id: \.rawValue) { caseValue in
                Button(action: { self.repository.UpdateStateAndFamily(item: item, updateState: caseValue) }) {
                    HStack {
                        CheckStateIndicatorView(state: caseValue)
                        Text("\(caseValue.description)")
                            .font(.title2)
                    }
                }
            }
        } label: {
            HStack {
                CheckStateIndicatorView(state: item.state)
                Text("\(item.state.description)")
                    .font(.title2)
            }
        }
    }
}
