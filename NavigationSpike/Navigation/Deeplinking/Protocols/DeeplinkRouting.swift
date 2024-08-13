//
//  DeeplinkRouting.swift
//  NavigationSpike
//
//  Created by Corbin Montague on 8/13/24.
//

import Foundation
import Core

/// A protocol for routing to `Deeplink`s anywhere in the Provider app.
public protocol DeeplinkRouting {
    
    /// Route to the provided `Deeplink`.
    /// - Parameters:
    ///   - deeplink: The `Deeplink` to route to.
    ///   - source: The source that is asking to route to this `Deeplink`.
    func route(to deeplink: Deeplink, from source: DeeplinkSource)
}
public extension DeeplinkRouting {
    func route(to deeplink: Deeplink, from source: DeeplinkSource = .unknown) {
        self.route(to: deeplink, from: source)
    }
}
