//
//  PlaylistsCoordinator.swift
//  Playlists
//
//  Created by Corbin Montague on 7/5/24.
//

import Core
import FlowStacks
import SwiftUI

public final class PlaylistsCoordinator: NavigationCoordinator {
    
    @Published public var path: FlowPath {
        didSet {
            print("PlaylistsCoordinator.path: \(path)")
        }
    }
    public weak var appCoordinator: AppCoordinating?
    
    public init(path: FlowPath = FlowPath(),
                appCoordinator: AppCoordinating? = nil) {
        self.path = path
        self.appCoordinator = appCoordinator
        print("PlaylistsCoordinator.init")
    }
    
    public func navigate(to deeplink: Deeplink) {
        switch deeplink {
        case .playlists:
            navigateToPlaylists()
        case .playlist(let playlistId):
            navigateToPlaylist(playlistId: playlistId)
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
    
    private func navigateToPlaylist(playlistId: String) {
        navigateToPlaylists()
        
        let store = PlaylistStore(playlistId: playlistId)
        let screen = Screen.playlist(store: store)
        path.push(screen)
    }
}
