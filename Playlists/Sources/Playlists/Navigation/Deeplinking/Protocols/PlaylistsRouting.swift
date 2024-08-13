//
//  PlaylistsRouting.swift
//
//
//  Created by Corbin Montague on 8/13/24.
//

import Core
import Foundation

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
