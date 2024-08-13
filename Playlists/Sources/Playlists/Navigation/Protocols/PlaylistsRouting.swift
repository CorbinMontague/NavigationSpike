//
//  PlaylistsRouting.swift
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
}

/// An interface for navigating the user to a specific view.
public protocol PlaylistsRouting {
    
    /// Routes the user to a specific view depending on the provided `PlaylistsDeeplink`.
    func route(to deeplink: PlaylistsDeeplink, from source: DeeplinkSource)
}
public extension PlaylistsRouting {
    func route(to deeplink: PlaylistsDeeplink, from source: DeeplinkSource = .unknown) {
        self.route(to: deeplink, from: source)
    }
}
