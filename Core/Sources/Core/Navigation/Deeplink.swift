//
//  Deeplink.swift
//  Core
//
//  Created by Corbin Montague on 7/5/24.
//

import Foundation

public enum Deeplink {
    
    case explore
    case playlists
    case playlist(_ playlistName: String)
    
    public init?(url: URL) {
        guard url.scheme == "navigationspike" else { return nil }
        switch url.host {
        case "explore":
            self = .explore
        case "playlists":
            self = .playlists
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

extension Deeplink: Identifiable, Hashable {
    public var id: String {
        return String(reflecting: self)
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    public static func == (lhs: Deeplink, rhs: Deeplink) -> Bool {
        lhs.id == rhs.id
    }
}
