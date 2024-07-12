//
//  PlaylistsRouter.swift
//  Playlists
//
//  Created by Corbin Montague on 7/5/24.
//

import Core
import Foundation

public final class PlaylistsRouter {
    
    private var coordinator = PlaylistsCoordinator.shared
    private weak var appCoordinator: AppCoordinating?
    
    public init(appCoordinator: AppCoordinating?) {
        self.appCoordinator = appCoordinator
    }
    
    public func route(to deeplink: Deeplink) {
        switch deeplink {
            // internal routes
        case .playlists:
            routeToPlaylists()
        case .playlist(let playlistName):
            routeToPlaylist(playlistName: playlistName)
            
            // external routes
        default:
            appCoordinator?.route(to: deeplink)
        }
    }
}

extension PlaylistsRouter {
    
    private func routeToPlaylists() {
        print("routeToPlaylists")
        // select playlists tab
        appCoordinator?.selectedTab = .playlists
        
        // dismiss all sheets/fullscreencovers
        coordinator.path.dismissAll()
        
        // go back to root view
        coordinator.path.goBackToRoot()
    }
    
    private func routeToPlaylist(playlistName: String) {
        print("routeToPlaylist: \(playlistName)")
        routeToPlaylists()
        
        // TODO: Push PlaylistView
        let store = PlaylistStore(playlistName: "Foo") { _ in
            
        } onRemoveSongFromPlaylist: { _, _ in
            
        }
        let destination = Destination.playlist(store: store)
        coordinator.path.push(destination)
    }
}
