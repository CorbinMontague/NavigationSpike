//
//  CompositeDeeplinkHandling.swift
//  NavigationSpike
//
//  Created by Corbin Montague on 8/13/24.
//

import Core
import Foundation

/// A protocol for parsing `Deeplink`s (`Universal Links`) from raw data.
public protocol CompositeDeeplinkHandling {
    
    /// Is there a `Deeplink` associated with the provided `URL` supported by this app?
    /// - Parameter url: The `URL` to check.
    /// - Returns: `True` if there is a `Deeplink` associated with the provided `URL` that can be handled.
    func canHandleFoo(url: URL) -> Bool
    
    /// Parse the provided `URL` into its associated `Deeplink` and handle it, if possible.
    /// - Parameters:
    ///   - url: The `URL` whose associated `Deeplink` should be handled.
    ///   - source: The source that is asking to handle this `URL`.
    /// - Returns: `True` if we were able to parse the provided `URL` into a valid `Deeplink` case and handle it, otherwise `False.`
    @discardableResult func handleFoo(url: URL, source: DeeplinkSource) -> Bool
}
