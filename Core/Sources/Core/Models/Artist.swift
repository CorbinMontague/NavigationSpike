//
//  Artist.swift
//  Music
//
//  Created by Corbin Montague on 7/1/24.
//

import Foundation

public enum Artist: CaseIterable, Codable {
    case snoop
    case kendrick
    case daftPunk
    case blink182
    case michaelJackson
    
    public var name: String {
        switch self {
        case .snoop:
            return "Snoop Dogg"
        case .kendrick:
            return "Kendrick Lamar"
        case .daftPunk:
            return "Daft Punk"
        case .blink182:
            return "blink-182"
        case .michaelJackson:
            return "Michael Jackson"
        }
    }
    
    public var songs: [Song] {
        switch self {
        case .kendrick:
            return [Song(name: "DNA", artist: self),
                    Song(name: "Not Like Us", artist: self)]
        case .snoop:
            return [Song(name: "Gin and Juice", artist: self),
                    Song(name: "Doggy Dogg World", artist: self),
                    Song(name: "Drop It Like It's Hot", artist: self)]
        case .daftPunk:
            return [Song(name: "One More Time", artist: self),
                    Song(name: "Harder, Better, Faster, Stronger", artist: self),
                    Song(name: "Get Lucky", artist: self),
                    Song(name: "Around the World", artist: self)]
        case .blink182:
            return [Song(name: "All The Small Things", artist: self),
                    Song(name: "What's My Age Again?", artist: self),
                    Song(name: "I Miss You", artist: self),
                    Song(name: "First Date", artist: self),
                    Song(name: "Adam's Song", artist: self)]
        case .michaelJackson:
            return [Song(name: "Billie Jean", artist: self),
                    Song(name: "Beat It", artist: self),
                    Song(name: "Smooth Criminal", artist: self)]
        }
    }
}
