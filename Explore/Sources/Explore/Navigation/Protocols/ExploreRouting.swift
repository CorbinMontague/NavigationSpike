//
//  ExploreRouting.swift
//
//
//  Created by Corbin Montague on 8/13/24.
//

import Core
import Foundation

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
