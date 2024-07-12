//
//  PlaylistsCoordinator.swift
//  Playlists
//
//  Created by Corbin Montague on 7/5/24.
//

import Core
import FlowStacks
import SwiftUI

public class PlaylistsCoordinator: NavigationCoordinator {
    static public let shared = PlaylistsCoordinator()
    
    @Published public var path = FlowPath()
    public weak var appCoordinator: AppCoordinating?
    
    public func navigate(to deeplink: Deeplink) {
        switch deeplink {
        case .playlists:
            navigateToPlaylists()
        case .playlist(let playlistName):
            navigateToPlaylist(playlistName: playlistName)
        default:
            appCoordinator?.navigate(to: deeplink)
        }
    }
}

extension PlaylistsCoordinator {
    
    private func navigateToPlaylists() {
        // select playlists tab
        appCoordinator?.selectedTab = .playlists
        
        // dismiss all sheets/fullscreencovers
        path.dismissAll()
        
        // go back to root view
        path.goBackToRoot()
    }
    
    private func navigateToPlaylist(playlistName: String) {
        navigateToPlaylists()
        
        // TODO: Push PlaylistView
        // iterate over all playlists contained within PlaylistsViewModel
        // if we find a playlist with a matching name, push PlaylistView
        let store = PlaylistStore(playlistName: "Foo") { _ in
            
        } onRemoveSongFromPlaylist: { _, _ in
            
        }
        let destination = Destination.playlist(store: store)
        path.push(destination)
    }
}
