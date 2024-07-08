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
//    case song(_ name: String)
    case playlist(_ playlistName: String)
    
    public init?(url: URL) {
        guard url.scheme == "navigationspike" else { return nil }
        switch url.host {
        case "explore":
            self = .explore
        case "playlists":
            self = .playlists
            
//        case "song":
//            if let songName = url.pathComponents.dropFirst().first {
//                self = .song(songName)
//            } else {
//                self = .explore
//            }
            
        case "playlist":
            if let playlistName = url.pathComponents.dropFirst().first {
                self = .playlist(playlistName)
            } else {
                self = .playlists
            }
            
        default:
            return nil
        }
    }
}
