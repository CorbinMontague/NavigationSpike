//
//  Destination.swift
//  Explore
//
//  Created by Corbin Montague on 7/1/24.
//

import Foundation
import Navigation

public indirect enum Destination {
    
    case explore
    
    case external(_ destination: SharedDestination)
}

extension Destination: Identifiable, Hashable {
    public var id: String {
        return String(reflecting: self)
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    public static func == (lhs: Destination, rhs: Destination) -> Bool {
        lhs.id == rhs.id
    }
}
