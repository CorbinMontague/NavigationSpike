//
//  Playlist.swift
//  Music
//
//  Created by Corbin Montague on 7/1/24.
//

import Foundation

public struct Playlist {
    public var name: String
    public var songs: [Song]
    
    public init(name: String,
                songs: [Song] = []) {
        self.name = name
        self.songs = songs
    }
}
