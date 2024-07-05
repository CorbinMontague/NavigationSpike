//
//  Deeplink.swift
//  Core
//
//  Created by Corbin Montague on 7/5/24.
//

import Foundation

public enum Deeplink {
    // root tab views
    case explore
    case playlists
    
    // commonly shared views
    case playlist(_ playlistId: Int)
    
    public init?(url: URL) {
        guard url.scheme == "navigationspike" else { return nil }
        switch url.host {
        case "explore":
            self = .explore
        case "playlists":
            self = .playlists
            
        case "playlist":
            if let playlistString = url.pathComponents.dropFirst().first,
               let playlistId = Int(playlistString),
               playlistId >= 0 {
                self = .playlist(playlistId)
            } else {
                self = .playlists
            }
            
        default:
            return nil
        }
    }
}
