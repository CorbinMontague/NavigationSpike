//
//  Destination.swift
//  Explore
//
//  Created by Corbin Montague on 7/1/24.
//

import Foundation
import Navigation

indirect enum Destination {
    
    case explore
    
    case sharedDestination(_ destination: SharedDestination)
}

extension Destination: Identifiable, Hashable {
    var id: String {
        return String(reflecting: self)
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Destination, rhs: Destination) -> Bool {
        lhs.id == rhs.id
    }
}
