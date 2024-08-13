//
//  SharedDeeplinkRouting.swift
//
//
//  Created by Corbin Montague on 8/13/24.
//

import Foundation

/// A protocol for routing to `SharedDeeplink`s.
public protocol SharedDeeplinkRouting: AnyObject {
    
    /// Route to the provided `SharedDeeplink`.
    /// - Parameters:
    ///   - deeplink: The `SharedDeeplink` to route to.
    ///   - source: The source that is asking to route to this `SharedDeeplink`.
    func route(to deeplink: SharedDeeplink, from source: DeeplinkSource)
}
public extension SharedDeeplinkRouting {
    func route(to deeplink: SharedDeeplink, from source: DeeplinkSource = .unknown) {
        self.route(to: deeplink, from: source)
    }
}
