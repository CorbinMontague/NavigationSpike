//
//  Artist.swift
//  Music
//
//  Created by Corbin Montague on 7/1/24.
//

import Foundation

public struct Artist {
    public var name: String
    public var songs: [Song]
    
    public init(name: String,
                songs: [Song] = []) {
        self.name = name
        self.songs = songs
    }
}

/// Helps build dummy data
public enum SupportedArtist: CaseIterable {
    case snoop
    case kendrick
    case daftPunk
    case blink182
    case michaelJackson
    
    var artist: Artist {
        var artist: Artist
        switch self {
        case .kendrick:
            artist = Artist(name: "Kendrick Lamar")
        case .snoop:
            artist = Artist(name: "Snoop Dogg")
        case .daftPunk:
            artist = Artist(name: "Daft Punk")
        case .blink182:
            artist = Artist(name: "blink-182")
        case .michaelJackson:
            artist = Artist(name: "Michael Jackson")
        }
        
        artist.songs = makeSongs(for: artist)
        return artist
    }
    
    private func makeSongs(for artist: Artist) -> [Song] {
        switch self {
        case .kendrick:
            return [Song(name: "DNA", artist: artist),
                    Song(name: "Not Like Us", artist: artist)]
        case .snoop:
            return [Song(name: "Gin and Juice", artist: artist),
                    Song(name: "Doggy Dogg World", artist: artist),
                    Song(name: "Drop It Like It's Hot", artist: artist)]
        case .daftPunk:
            return [Song(name: "One More Time", artist: artist),
                    Song(name: "Harder, Better, Faster, Stronger", artist: artist),
                    Song(name: "Get Lucky", artist: artist),
                    Song(name: "Around the World", artist: artist)]
        case .blink182:
            return [Song(name: "All The Small Things", artist: artist),
                    Song(name: "What's My Age Again?", artist: artist),
                    Song(name: "I Miss You", artist: artist),
                    Song(name: "First Date", artist: artist),
                    Song(name: "Adam's Song", artist: artist)]
        case .michaelJackson:
            return [Song(name: "Billie Jean", artist: artist),
                    Song(name: "Beat It", artist: artist),
                    Song(name: "Smooth Criminal", artist: artist)]
        }
    }
}
