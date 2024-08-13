//
//  AppCoordinating.swift
//  Core
//
//  Created by Corbin Montague on 7/5/24.
//

import Combine
import Foundation
import SwiftUI

/// Supported tabs in the app.
public enum Tab: Hashable {
    case explore
    case playlists
}

/// Stores app-level navigation state.
public protocol AppCoordinating: AnyObject {
    
    /// The currently selected tab
    var selectedTab: Tab { get set }
    
    /// Publisher for listening to `selectedTab` changes.
    var selectedTabPublisher: AnyPublisher<Tab, Never> { get }
    
    /// Dismiss all modals (covers and sheets)
    func dismissAll()
}
