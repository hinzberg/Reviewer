//  CheckStateChangeMenu.swift
//  Reviewer
//  Created by Holger Hinzberg on 17.10.25.

import SwiftUI

public struct CheckStateChangeMenu: View {
    
    let checkManager = CheckStateManager()
    var item : ReviewItem
    
    public var body: some View {
        Menu {
            ForEach(CheckState.allCases, id: \.rawValue) { caseValue in
                Button(action: { checkManager.UpdateStateAndFamily(item: item, updateState: caseValue) }) {
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
