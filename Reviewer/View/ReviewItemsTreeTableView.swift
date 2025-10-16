//
//  ResizableTreeTableView.swift
//  Reviewer
//
//  Created by Holger Hinzberg on 16.10.25.
//

import SwiftUI

struct ResizableTreeTableView: View {
    
    let data: [ReviewItem]
    
    // Track the width of each column
    @State private var nameWidth: CGFloat = 200
    @State private var sizeWidth: CGFloat = 200
    @State private var modifiedWidth: CGFloat = 200
    
    var body: some View {
        
        VStack(alignment: .leading) {
            // MARK: Header
            HStack(spacing: 0) {
                headerCell(title: "Name", width: $nameWidth, alignment: .leading)
                headerDivider(width: $nameWidth)
                headerCell(title: "Comment", width: $sizeWidth, alignment: .leading)
                headerDivider(width: $sizeWidth)
                headerCell(title: "Note", width: $modifiedWidth, alignment: .leading)
            }
            .font(.headline)
            .background(Color.gray.opacity(0.1))
            .frame(height: 28)
            
            // MARK: Rows
            OutlineGroup(data, children: \.children) { node in
                HStack(spacing: 0) {
                    Text(node.name)
                        .frame(width: nameWidth, alignment: .leading)
                    Divider().opacity(0)
                    Text(node.comment)
                        .frame(width: sizeWidth, alignment: .leading)
                    Divider().opacity(0)
                    Text(node.note)
                        .frame(width: modifiedWidth, alignment: .leading)
                }
                .font(.body)
                .padding(.vertical, 2)
            }
        }
        .padding(4)
        .background(Color(NSColor.windowBackgroundColor))
    }
    
    // MARK: Header cell
    private func headerCell(title: String, width: Binding<CGFloat>, alignment: Alignment = .leading) -> some View {
        Text(title)
            .font(.headline)
            .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
            .frame(width: width.wrappedValue, alignment: alignment)
            .background(Color(NSColor.underPageBackgroundColor))
    }
    
    // MARK: Divider with drag gesture
    private func headerDivider(width: Binding<CGFloat>) -> some View {
        Rectangle()
            .fill(Color.gray.opacity(0.2))
            .frame(width: 2)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        width.wrappedValue += value.translation.width
                    }
            )
            .onHover { hovering in
                NSCursor.resizeLeftRight.set()
            }
    }
}
