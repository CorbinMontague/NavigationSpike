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
    case song(_ songName: String)
    //    case playlist(_ playlistName: String)
    
    public init?(url: URL) {
        guard url.scheme == "navigationspike" else { return nil }
        switch url.host {
        case "explore":
            self = .explore
        case "playlists":
            self = .playlists
        case "song":
            //      guard let songDeeplink = SongDeeplink(pathComponents: url.pathComponents.dropFirst()) else {
            //        return nil
            //      }
            self = .explore
            
        default:
            return nil
        }
    }
}
