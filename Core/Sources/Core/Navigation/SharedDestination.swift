//
//  SharedDestination.swift
//  Core
//
//  Created by Corbin Montague on 7/1/24.
//

import Foundation

/// Destinations shared across modules.
/// This low-level enum helps us avoid code duplication across experience modules that want to reference cross-module destinations.
public indirect enum SharedDestination {
    
    // root tab views
    case explore
    case playlists
    
    // commonly shared views
    case song(_ song: Song)
    case artist(_ artist: Artist)
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
