//
//  SharedScreen.swift
//  Navigation
//
//  Created by Corbin Montague on 7/1/24.
//

import Foundation
import Core

public indirect enum SharedScreen {
    
    // root tab views
    case explore
    case playlists
    
    // commonly shared views
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
