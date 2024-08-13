//
//  Deeplink.swift
//  NavigationSpike
//
//  Created by Corbin Montague on 8/13/24.
//

import Foundation

/// All deeplink routes supported in the app.
/// These can be navigated to from an external source (e.g. push notifications or Deeplink URLs within an email/sms) or internally when we just want to navigate the user to a specific view in the app.
public enum Deeplink {
    
    case explore
    case playlists
    case playlist(_ playlistId: String)
    
    // For Example:
    // navigationspike://explore
    // navigationspike://playlist/12345
    public init?(url: URL) {
        guard url.scheme == "navigationspike" else { return nil }
        switch url.host {
        case "explore":
            self = .explore
        case "playlists":
            self = .playlists
        case "playlist":
            if let playlistId = url.pathComponents.dropFirst().first {
                self = .playlist(playlistId)
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
