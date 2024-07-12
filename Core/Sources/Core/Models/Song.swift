//
//  Song.swift
//  Music
//
//  Created by Corbin Montague on 7/1/24.
//

import Foundation

public struct Song: Codable, Hashable {
    public var id: String
    public var name: String
    public var artist: Artist
    
    public init(id: String = UUID().uuidString,
                name: String,
                artist: Artist) {
        self.id = id
        self.name = name
        self.artist = artist
    }
    
    public static func == (lhs: Song, rhs: Song) -> Bool {
        return lhs.id == rhs.id
    }
    
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

/// Helps build dummy data
extension Song {
    public static func makeAllSongs() -> [Song] {
        var songs: [Song] = []
        for artist in Artist.allCases {
            songs.append(contentsOf: artist.songs)
        }
        return songs
    }
}
