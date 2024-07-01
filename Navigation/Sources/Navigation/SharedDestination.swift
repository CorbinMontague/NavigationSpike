//
//  SharedDestination.swift
//  Navigation
//
//  Created by Corbin Montague on 7/1/24.
//

import Foundation
import Music

public indirect enum SharedDestination {
    
    // root tab views
    case explore
    case playlists
    
    // commonly shared views
    case song
    case artist
}

extension SharedDestination: Identifiable, Hashable {
    public var id: String {
        return String(reflecting: self)
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    public static func == (lhs: SharedDestination, rhs: SharedDestination) -> Bool {
        lhs.id == rhs.id
    }
}
