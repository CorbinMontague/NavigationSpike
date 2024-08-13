//
//  DeeplinkSource.swift
//
//
//  Created by Corbin Montague on 8/13/24.
//

import Foundation

/// The source associated with a `Deeplink`.
public enum DeeplinkSource {
    
    // MARK: - External
    
    case pushNotification
    case deeplink
    
    // MARK: - Internal
    
    case explore
    case playlists
    case song
    case artist
    
    // MARK: - Other
    
    case unknown
}

// MARK: - Extensions
public extension DeeplinkSource {
    var isExternal: Bool {
        return self == .pushNotification || self == .deeplink
    }
}
