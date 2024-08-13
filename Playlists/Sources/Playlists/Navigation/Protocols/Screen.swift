//
//  Screen.swift
//  Playlists
//
//  Created by Corbin Montague on 7/1/24.
//

import Core
import Foundation

public enum Screen {
    
    case playlists
    case createPlaylist(_ onCreatePlaylist: ((Playlist) -> Void))
    case playlist(store: PlaylistStore)
    
    case external(_ screen: SharedScreen)
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
