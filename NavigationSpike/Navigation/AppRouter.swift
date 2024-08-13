//
//  AppRouter.swift
//  NavigationSpike
//
//  Created by Corbin Montague on 8/13/24.
//

import Foundation
import Core
import Explore
import Playlists
import Music

/// Concrete `DeeplinkRouting` that implements routing the user to specific views within the app.
final class AppRouter: DeeplinkRouting {
    
    // MARK: - Dependencies
    
    private var coordinator: AppCoordinating
    
//    private var exploreRouter: Explore.ExploreRouting
//    private var playlistsRouter: Playlists.PlaylistsRouting
//    private var musicRouter: Music.MusicRouting
    
    // MARK: - Init
    
    init(coordinator: AppCoordinating) {
        self.coordinator = coordinator
    }
    
//    init(coordinator: AppCoordinating,
//         exploreRouter: Explore.ExploreRouting,
//         playlistsRouter: Playlists.PlaylistsRouting,
//         musicRouter: Music.MusicRouting) {
//        self.coordinator = coordinator
//        self.exploreRouter = exploreRouter
//        self.playlistsRouter = playlistsRouter
//        self.musicRouter = musicRouter
//    }
    
    // MARK: - DeeplinkRouting
    
    func route(to deeplink: Deeplink, from source: DeeplinkSource) {
        
    }
}

// MARK: - SharedDeeplinkRouting

extension AppRouter: SharedDeeplinkRouting {
    
    func route(to deeplink: SharedDeeplink, from source: DeeplinkSource) {
        print("Routing to: \(deeplink)")
//        switch deeplink {
//        case .explore:
//            exploreRouter.route(to: .explore, from: source)
//        }
    }
}
