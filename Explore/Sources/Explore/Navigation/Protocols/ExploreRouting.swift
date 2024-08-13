//
//  ExploreRouting.swift
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
}

/// An interface for navigating the user to a specific view.
public protocol ExploreRouting {
    
    /// Routes the user to a specific view depending on the provided `ExploreDeeplink`.
    func route(to deeplink: ExploreDeeplink, from source: DeeplinkSource)
}
public extension ExploreRouting {
    func route(to deeplink: ExploreDeeplink, from source: DeeplinkSource = .unknown) {
        self.route(to: deeplink, from: source)
    }
}
