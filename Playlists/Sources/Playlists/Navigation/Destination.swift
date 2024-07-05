//
//  Destination.swift
//  Playlists
//
//  Created by Corbin Montague on 7/1/24.
//

import Core
import Foundation

public indirect enum Destination {
    
    case playlists
    case createPlaylist(_ onCreatePlaylist: ((Playlist) -> Void))
    case playlist(_ playlist: Playlist, onDeletePlaylist: ((Playlist) -> Void))
    
    case external(_ screen: SharedDestination)
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
