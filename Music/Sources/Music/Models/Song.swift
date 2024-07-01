//
//  Song.swift
//  Music
//
//  Created by Corbin Montague on 7/1/24.
//

import Foundation

public struct Song {
    public var name: String
    public var artist: Artist
    
    public init(name: String,
                artist: Artist) {
        self.name = name
        self.artist = artist
    }
}

/// Helps build dummy data
extension Song {
    public static func makeAllSongs() -> [Song] {
        var songs: [Song] = []
        for supportedArtist in SupportedArtist.allCases {
            songs.append(contentsOf: supportedArtist.artist.songs)
        }
        return songs
    }
}
