//
//  PlaylistsRouter.swift
//
//
//  Created by Corbin Montague on 8/13/24.
//

import Core
import Foundation

/// Concrete `PlaylistsRouting` that implements routing the user to specific views within `Playlists`.
public final class PlaylistsRouter: PlaylistsRouting {
    
    // MARK: - Dependencies
    
    private var appCoordinator: AppCoordinating
    private var playlistsCoordinator: PlaylistsCoordinator
    private weak var externalRouter: SharedDeeplinkRouting?
    
    // MARK: - Init
    
    public init(appCoordinator: AppCoordinating,
                playlistsCoordinator: PlaylistsCoordinator = Globals.coordinator,
                externalRouter: SharedDeeplinkRouting? = nil) {
        self.appCoordinator = appCoordinator
        self.playlistsCoordinator = playlistsCoordinator
        self.externalRouter = externalRouter
    }
    
    // MARK: - PlaylistsRouting
    
    public func route(to deeplink: PlaylistsDeeplink, from source: DeeplinkSource) {
        switch deeplink {
        case .playlists:
            routeToPlaylists()
        case .playlist(let playlistId):
            routeToPlaylist(playlistId: playlistId)
            
        case .external(let sharedDeeplink):
            externalRouter?.route(to: sharedDeeplink, from: source)
        }
    }
}

// MARK: - Internal Deeplink Handlers

extension PlaylistsRouter {
    
    private func routeToPlaylists() {
        appCoordinator.selectedTab = .playlists
        appCoordinator.dismissAll()
        playlistsCoordinator.path.goBackToRoot()
    }
    
    private func routeToPlaylist(playlistId: String) {
        routeToPlaylists()
        
        let store = PlaylistStore(playlistId: playlistId)
        let screen = Screen.playlist(store: store)
        playlistsCoordinator.path.push(screen)
    }
}
