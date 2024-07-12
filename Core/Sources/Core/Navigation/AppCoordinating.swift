//
//  AppCoordinating.swift
//  Core
//
//  Created by Corbin Montague on 7/5/24.
//

import Foundation
import SwiftUI

public enum Tab: Hashable {
    case explore
    case playlists
}

/// Stores app-level navigation state (like selected tab) and supports cross-module navigation.
public protocol AppCoordinating: AnyObject {
    var selectedTab: Tab { get set }
    
    @discardableResult func handle(url: URL) -> Bool
    func navigate(to deeplink: Deeplink)
}
