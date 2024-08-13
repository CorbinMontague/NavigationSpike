//
//  MusicDeeplink.swift
//  
//
//  Created by Corbin Montague on 8/13/24.
//

import Core
import Foundation

/// Supported deeplink routes within `Music`.
public enum MusicDeeplink: Identifiable, Equatable {
    
    public var id: String {
        return String(reflecting: self)
    }
    
    public static func == (lhs: MusicDeeplink, rhs: MusicDeeplink) -> Bool {
        lhs.id == rhs.id
    }
    
    // MARK: - Internal Deeplinks
    
    // MARK: - External Deeplinks
    
    case external(deeplink: SharedDeeplink)
    
    // MARK: - Init
    
    public init?(url: URL) {
        // there aren't any deeplinks in this project isolated to the `Music` module, but if
        // there were, we would handle them here
        return nil
    }
}
