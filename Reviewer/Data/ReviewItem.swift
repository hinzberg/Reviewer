//  ReviewItem.swift
//  Reviewer
//  Created by Holger Hinzberg on 16.10.25.

import SwiftUI

@Observable
public class ReviewItem: Identifiable {

    public let id = UUID()
    public var name: String = ""
    public var description: String = ""
    public var userComment: String = ""
    public var state : CheckState = .Unchecked
    public var children: [ReviewItem]? = nil
    public var parent : ReviewItem? = nil
    public var imageName : String = ""
        
    init () {
    }
    
    init(name: String, userComment: String, description: String) {
        self.name = name
        self.userComment = userComment
        self.description = description
    }
    
    init(name: String, userComment: String, description: String, image : String) {
        self.name = name
        self.userComment = userComment
        self.description = description
        self.imageName = image
    }
    
    public func addChild (item : ReviewItem) {
        if self.children == nil {
            self.children = []
        }
        item.parent = self
        self.children!.append(item)
    }

    func itemsRecursively(matching state: CheckState) -> [ReviewItem] {
        var result: [ReviewItem] = []
        if self.state == state {
            result.append(self)
        }
        if let children = self.children {
            for child in children {
                result.append(contentsOf: child.itemsRecursively(matching: state))
            }
        }
        return result
    }
}
