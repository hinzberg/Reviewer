//
//  CheckStateIndicatorView.swift
//  Reviewer
//
//  Created by Holger Hinzberg on 16.10.25.
//

import SwiftUI

struct CheckStateIndicatorView: View {
    
    private var state : CheckState
    
    init(state: CheckState) {
        self.state = state
    }
    
    private var colorForState: Color {
        
        print(self.state.description)
        
        switch state {
        case .Review:
            return .orange
        case .Ok:
            return .green
        case .Failed:
            return .red
        case .Unchecked:
            return .gray
        }
    }
        
    var body: some View {
        Image(systemName: "circle.fill")
            .font(.title2)
            .foregroundStyle(colorForState, colorForState)
    }
}

#Preview {
    CheckStateIndicatorView(state: .Failed)
}
