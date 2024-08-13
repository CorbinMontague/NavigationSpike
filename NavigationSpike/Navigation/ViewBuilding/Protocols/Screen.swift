//
//  Screen.swift
//  NavigationSpike
//
//  Created by Corbin Montague on 8/13/24.
//

import Foundation

public enum Screen {
    
    case devTools
}

extension Screen: Identifiable, Hashable {
    public var id: String {
        return String(reflecting: self)
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    public static func == (lhs: Screen, rhs: Screen) -> Bool {
        lhs.id == rhs.id
    }
}
