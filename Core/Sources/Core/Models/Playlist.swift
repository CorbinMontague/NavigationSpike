//
//  Playlist.swift
//  Music
//
//  Created by Corbin Montague on 7/1/24.
//

import Foundation

public struct Playlist: Hashable {
    public var name: String
    public var songs: [Song]
    
    public init(name: String,
                songs: [Song] = []) {
        self.name = name
        self.songs = songs
    }
    
    public static func == (lhs: Playlist, rhs: Playlist) -> Bool {
        return lhs.name == rhs.name && lhs.songs.count == rhs.songs.count
    }
    
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(songs)
    }
}
