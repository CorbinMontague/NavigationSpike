//
//  Artist.swift
//  Music
//
//  Created by Corbin Montague on 7/1/24.
//

import Foundation

public enum Artist: CaseIterable, Codable {
    case kendrick
    case daftPunk
    case michaelJackson
    
    public var name: String {
        switch self {
        case .kendrick:
            return "Kendrick Lamar"
        case .daftPunk:
            return "Daft Punk"
        case .michaelJackson:
            return "Michael Jackson"
        }
    }
    
    public var songs: [Song] {
        switch self {
        case .kendrick:
            return [Song(name: "DNA", artist: self),
                    Song(name: "Not Like Us", artist: self)]
        case .daftPunk:
            return [Song(name: "One More Time", artist: self),
                    Song(name: "Harder, Better, Faster, Stronger", artist: self),
                    Song(name: "Get Lucky", artist: self),
                    Song(name: "Around the World", artist: self)]
        case .michaelJackson:
            return [Song(name: "Billie Jean", artist: self),
                    Song(name: "Beat It", artist: self),
                    Song(name: "Smooth Criminal", artist: self)]
        }
    }
}
