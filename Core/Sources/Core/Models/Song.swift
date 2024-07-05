//
//  Song.swift
//  Music
//
//  Created by Corbin Montague on 7/1/24.
//

import Foundation

public struct Song: Codable, Hashable {
    public var name: String
    public var artist: Artist
    
    public init(name: String,
                artist: Artist) {
        self.name = name
        self.artist = artist
    }
    
    public static func == (lhs: Song, rhs: Song) -> Bool {
        return lhs.name == rhs.name && lhs.artist == rhs.artist
    }
    
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(artist)
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
