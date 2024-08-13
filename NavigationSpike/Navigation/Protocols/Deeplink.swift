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
        // there aren't any deeplinks in this project isolated to the `NavigationSpike` module, but if
        // there were, we would handle them here
        return nil
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
