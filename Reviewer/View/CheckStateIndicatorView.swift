//
//  CheckStateIndicatorView.swift
//  Reviewer
//
//  Created by Holger Hinzberg on 16.10.25.
//

import SwiftUI

struct CheckStateIndicatorView: View {
    
    @State public var state : CheckState
    
    private var colorForState: Color {
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
            .foregroundColor(colorForState)
    }
}

#Preview {
    CheckStateIndicatorView(state: .Unchecked)
}
