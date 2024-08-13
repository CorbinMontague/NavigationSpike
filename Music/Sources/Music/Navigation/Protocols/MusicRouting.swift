//
//  MusicRouting.swift
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
}

/// An interface for navigating the user to a specific view.
public protocol MusicRouting {
    
    /// Routes the user to a specific view depending on the provided `MusicDeeplink`.
    func route(to deeplink: MusicDeeplink, from source: DeeplinkSource)
}
public extension MusicRouting {
    func route(to deeplink: MusicDeeplink, from source: DeeplinkSource = .unknown) {
        self.route(to: deeplink, from: source)
    }
}
