//  CheckState.swift
//  Reviewer
//  Created by Holger Hinzberg on 16.10.25.

import Foundation

public enum CheckState: String, Codable, CaseIterable, Hashable {
    case Unchecked
    case Review
    case Failed
    case Ok
    
    var description : String {
        switch self {
            // Use Internationalization, as appropriate.
        case .Ok: return "OK"
        case .Failed: return "Failed"
        case .Unchecked: return "Unchecked"
        case .Review: return "Review"
        }
    }
}
