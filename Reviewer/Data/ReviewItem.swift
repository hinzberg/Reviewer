//  ReviewItem.swift
//  Reviewer
//  Created by Holger Hinzberg on 16.10.25.

import SwiftUI

@Observable
public class ReviewItem: Identifiable {
    
    init () {
    }
    
    init(name: String, comment: String, note: String) {
        self.name = name
        self.comment = comment
        self.note = note
    }
    
    public let id = UUID()
    public var isChecked : Bool = false;
    public var name: String = ""
    public var comment: String = ""
    public var note: String = ""
    public var state : CheckState = .Unchecked
    public var children: [ReviewItem]? = nil
    public var parent : ReviewItem? = nil
    public var isExpanded: Bool = false
    
    public func addChild (item : ReviewItem) {
        if self.children == nil {
            self.children = []
        }
        item.parent = self
        self.children!.append(item)
    }
}
