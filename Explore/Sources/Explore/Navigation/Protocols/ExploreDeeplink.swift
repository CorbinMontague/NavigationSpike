//
//  ExploreDeeplink.swift
//
//
//  Created by Corbin Montague on 8/13/24.
//

import Core
import Foundation

/// Supported deeplink routes within `Explore`.
public enum ExploreDeeplink: Identifiable, Equatable {
    
    public var id: String {
        return String(reflecting: self)
    }
    
    public static func == (lhs: ExploreDeeplink, rhs: ExploreDeeplink) -> Bool {
        lhs.id == rhs.id
    }
    
    // MARK: - Internal Deeplinks
    
    /// Routes to the root view of Explore.
    case explore
    
    // MARK: - External Deeplinks
    
    case external(deeplink: SharedDeeplink)
    
    // MARK: - Init
    
    public init?(url: URL) {
        guard url.scheme == "navigationspike" else { return nil }
        switch url.host {
        case "explore":
            self = .explore
            
        default:
            return nil
        }
    }
}
