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
        switch state {
        case .Review:
            return Color.Review
        case .Ok:
            return Color.Ok
        case .Failed:
            return Color.Failed
        case .Unchecked:
            return Color.Unchecked
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


