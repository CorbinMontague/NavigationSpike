//
//  File.swift
//  
//
//  Created by Corbin Montague on 8/13/24.
//

import Core
import Foundation

/// Supported deeplink routes within `Playlists`.
public enum PlaylistsDeeplink: Identifiable, Equatable {
    
    public var id: String {
        return String(reflecting: self)
    }
    
    public static func == (lhs: PlaylistsDeeplink, rhs: PlaylistsDeeplink) -> Bool {
        lhs.id == rhs.id
    }
    
    // MARK: - Internal Deeplinks
    
    case playlists
    case playlist(_ playlistId: String)
    
    // MARK: - External Deeplinks
    
    case external(deeplink: SharedDeeplink)
    
    // MARK: - Init
    
    public init?(url: URL) {
        guard url.scheme == "navigationspike" else { return nil }
        switch url.host {
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
