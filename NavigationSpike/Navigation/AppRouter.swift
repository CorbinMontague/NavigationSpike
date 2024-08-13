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
    
    var exploreRouter: Explore.ExploreRouting?
    var playlistsRouter: Playlists.PlaylistsRouting?
    var musicRouter: Music.MusicRouting?
    
    // MARK: - Init
    
    init(coordinator: AppCoordinating = AppCoordinator.shared,
         exploreRouter: Explore.ExploreRouting? = Explore.Globals.router,
         playlistsRouter: Playlists.PlaylistsRouting? = Playlists.Globals.router,
         musicRouter: Music.MusicRouting? = Music.Globals.router) {
        self.coordinator = coordinator
        self.exploreRouter = exploreRouter
        self.playlistsRouter = playlistsRouter
        self.musicRouter = musicRouter
    }
    
    // MARK: - DeeplinkRouting
    
    func route(to deeplink: Deeplink, from source: DeeplinkSource) {
        switch deeplink {
        case .explore:
            exploreRouter?.route(to: .explore, from: source)
        case .playlists:
            playlistsRouter?.route(to: .playlists, from: source)
        case .playlist(let playlistId):
            playlistsRouter?.route(to: .playlist(playlistId), from: source)
            
        default:
            // some Deeplink cases are only supported from DeeplinkHandling (i.e. from a URL or Push Notification)
            break
        }
    }
}

// MARK: - SharedDeeplinkRouting

extension AppRouter: SharedDeeplinkRouting {
    
    func route(to deeplink: SharedDeeplink, from source: DeeplinkSource) {
        print("Routing to: \(deeplink)")
        switch deeplink {
        case .explore:
            exploreRouter?.route(to: .explore, from: source)
        }
    }
}
