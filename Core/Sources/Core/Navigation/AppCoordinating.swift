//
//  AppCoordinating.swift
//  Core
//
//  Created by Corbin Montague on 7/5/24.
//

import Foundation
import SwiftUI

/// Supported tabs in the app.
public enum Tab: Hashable {
    case explore
    case playlists
}

/// Stores app-level navigation state (like selected tab) and supports cross-module navigation.
public protocol AppCoordinating: AnyObject {
    
    /// The currently selected tab
    var selectedTab: Tab { get set }
    
    // TODO: - What about presenting modals at the app-level?
    
    /// Dismiss all modals (covers and sheets)
    func dismissAll()
    
    // TODO: - It might be better to move the routing APIs to a different protocol and implementation layer
    
    /// Parses the provided URL and navigates to the `Deeplink` associated with it if possible.
    /// - Parameter url: The URL we want to parse.
    /// - Returns: `True` if a `Deeplink` was associated with the provided URL that we can navigate to. Otherwise, `False`.
    @discardableResult func handle(url: URL) -> Bool
    
    /// Navigates the user to a specific view in the app depending on the provided `Deeplink`.
    /// - Parameter deeplink: The `Deeplink` we want to navigate to.
    func navigate(to deeplink: Deeplink)
}
