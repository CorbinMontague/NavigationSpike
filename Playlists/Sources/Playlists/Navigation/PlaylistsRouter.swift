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
    private var appCoordinator: AppCoordinating
    
    public init(appCoordinator: AppCoordinating) {
        self.appCoordinator = appCoordinator
    }
    
    public func route(to destination: SharedDestination) {
        switch destination {
            // internal routes
        case .playlists:
            routeToPlaylists()
        case .playlist(let playlistId):
            routeToPlaylist(playlistId: playlistId)
            
            // external routes
        default:
            appCoordinator.route(to: destination)
        }
    }
}

extension PlaylistsRouter {
    
    private func commonInternalRouteHandler() {
        // select explore tab
        appCoordinator.selectedTab = .explore
        
        // dismiss all sheets/fullscreencovers
        coordinator.path.dismissAll()
    }
    
    private func routeToPlaylists() {
        commonInternalRouteHandler()
        coordinator.path.goBackToRoot()
    }
    
    private func routeToPlaylist(playlistId: Int) {
        commonInternalRouteHandler()
        coordinator.path.goBackToRoot()
        
        // TODO: Push PlaylistView
//        let destination = Destination.playlist(<#T##playlist: Playlist##Playlist#>,
//                                               onDeletePlaylist: <#T##((Playlist) -> Void)##((Playlist) -> Void)##(Playlist) -> Void#>,
//                                               onRemoveSongFromPlaylist: <#T##((Song, Playlist) -> Void)##((Song, Playlist) -> Void)##(Song, Playlist) -> Void#>)
//        coordinator.path.push(<#T##screen: AnyHashable##AnyHashable#>)
    }
}
