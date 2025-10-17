//  CheckState.swift
//  Reviewer
//  Created by Holger Hinzberg on 16.10.25.

import Foundation

public enum CheckState: Int, Codable, CaseIterable, Hashable , Comparable {
    
    case Ok = 1
    case Review = 2
    case Failed = 3
    case Unchecked = 4
    
    // Implement Comparable
    public static func < (a: CheckState, b: CheckState) -> Bool {
        return a.rawValue < b.rawValue
    }
    
    var description : String {
        switch self {
        case .Ok: return "Check passed"
        case .Failed: return "Check failed"
        case .Unchecked: return "Unchecked"
        case .Review: return "Further review needed"
        }
    }
}
