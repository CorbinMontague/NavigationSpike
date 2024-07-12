//
//  AppCoordinator.swift
//  NavigationSpike
//
//  Created by Corbin Montague on 7/1/24.
//

import Core
import Explore
import Foundation
import Music
import Playlists
import SwiftUI

/// Handles navigation at the app-level.
class AppCoordinator: AppCoordinating, ObservableObject {
    static let shared = AppCoordinator()
    
    // MARK: - Dependencies
    
    var exploreRouter: ExploreRouter? = nil
    var playlistsRouter: PlaylistsRouter? = nil
    
    // MARK: - Init
    
    init(selectedTab: Tab = .explore,
         exploreRouter: ExploreRouter? = nil,
         playlistsRouter: PlaylistsRouter? = nil) {
        self.selectedTab = selectedTab
        self.exploreRouter = exploreRouter
        self.playlistsRouter = playlistsRouter
    }
    
    // MARK: - AppCoordinating
    
    @Published var selectedTab: Tab {
        didSet {
            print("selectedTab: \(selectedTab)")
        }
    }
}

// This deeplinking/routing logic could live in a seperate class that depends on the module routers
extension AppCoordinator {
    @discardableResult func handle(url: URL) -> Bool {
        guard let deeplink = Deeplink(url: url) else {
            print("Warning: URL is not a supported Deeplink")
            return false
        }
        
        route(to: deeplink)
        return true
    }
    
    func route(to deeplink: Deeplink) {
        print("Routing to: \(deeplink)")
        switch deeplink {
        case .explore:
            exploreRouter?.route(to: deeplink)
        case .playlists, .playlist:
            playlistsRouter?.route(to: deeplink)
        }
    }
}
