//
//  SharedScreen.swift
//  Core
//
//  Created by Corbin Montague on 7/1/24.
//

import Foundation

/// Screens shared across modules.
/// This low-level enum helps us avoid code duplication across experience modules that want to reference cross-module screens.
public indirect enum SharedScreen {
    
    // root tab views
    case explore
    case playlists
    
    // other views shared across modules
    case song(_ song: Song)
    case artist(_ artist: Artist)
}

extension SharedScreen: Identifiable, Hashable {
    public var id: String {
        return String(reflecting: self)
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    public static func == (lhs: SharedScreen, rhs: SharedScreen) -> Bool {
        lhs.id == rhs.id
    }
}
