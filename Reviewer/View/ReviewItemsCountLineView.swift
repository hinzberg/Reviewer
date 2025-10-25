//  ReviewItemsCountLineView.swift
//  Reviewer
//  Created by Holger Hinzberg on 25.10.25.

import SwiftUI

struct ReviewItemsCountLineView: View {
    
    var value: Int
    var color : Color
    var text : String
    
    var body: some View {
        
        HStack {
            Image(systemName: "circle.fill")
                .font(.title2)
                .foregroundStyle(color)
                .frame(width: 25, height: 20)
            Text("\(text)")
                .font(.title2)
                .frame(width: 100, height: 20)
            Text("\(value)")
                .font(.title2)
                .frame(width: 30, height: 20)
        }
    }
}

#Preview {
    ReviewItemsCountLineView( value: 10, color: .red, text: "Hello" )
}
