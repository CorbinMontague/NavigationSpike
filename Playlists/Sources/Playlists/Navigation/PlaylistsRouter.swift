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
    
    public func route(to destination: SharedDestination) {
        switch destination {
            // internal routes
        case .playlists:
            routeToPlaylists()
        case .playlist(let playlistName):
            routeToPlaylist(playlistName: playlistName)
            
            // external routes
        default:
            appCoordinator?.route(to: destination)
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
//        let destination = Destination.playlist(<#T##playlist: Playlist##Playlist#>,
//                                               onDeletePlaylist: <#T##((Playlist) -> Void)##((Playlist) -> Void)##(Playlist) -> Void#>,
//                                               onRemoveSongFromPlaylist: <#T##((Song, Playlist) -> Void)##((Song, Playlist) -> Void)##(Song, Playlist) -> Void#>)
//        coordinator.path.push(<#T##screen: AnyHashable##AnyHashable#>)
    }
}
