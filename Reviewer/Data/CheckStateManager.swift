//  CheckStateManager.swift
//  Reviewer
//  Created by Holger Hinzberg on 17.10.25.

// This class will mange the check state of an item an its siblings and parent
// If a parent is set all the children will get the same state as the parent
// If a child is set the parent will get the highest state of the child and its siblings

import Foundation

public struct CheckStateManager {
    
    public func UpdateStateAndFamily(item : ReviewItem,  updateState : CheckState) {
        item.state = updateState
        UpdateChildren(item: item, updateState: item.state)
        UpdateParent(item: item, updateState: item.state)
    }
    
    private func UpdateChildren(item : ReviewItem,  updateState : CheckState) {
        
        item.state = updateState
        
        if item.children != nil {
            for child in item.children! {
                UpdateChildren(item: child, updateState: updateState)
            }
        }
    }
    
    private func UpdateParent(item : ReviewItem,  updateState : CheckState) {
       
        if item.parent != nil {
            let siblings = item.parent!.children
            // print("siblings: \(siblings!.count)")
            
            let siblingsState: [CheckState] = siblings?.compactMap { $0.state } ?? []
            let highestState = siblingsState.max() ?? .Unchecked
            
            // print("highestState: \(highestState)")
            item.parent!.state = highestState
            
            if item.parent?.parent != nil {
                UpdateParent(item: item.parent!, updateState: highestState)
            }
        }
    }
}
