//
//  Playlist.swift
//  Music
//
//  Created by Corbin Montague on 7/1/24.
//

import Foundation

public struct Playlist: Codable, Hashable {
    public var id: String
    public var name: String
    public var songs: [Song]
    
    public init(id: String = UUID().uuidString,
                name: String,
                songs: [Song] = []) {
        self.id = id
        self.name = name
        self.songs = songs
    }
    
    public static func == (lhs: Playlist, rhs: Playlist) -> Bool {
        return lhs.id == rhs.id
    }
    
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
