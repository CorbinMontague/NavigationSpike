//
//  PlaylistsViewBuilder.swift
//  Playlists
//
//  Created by Corbin Montague on 6/30/22.
//

import Core
import Foundation
import SwiftUI

public class PlaylistsViewBuilder {
    
    private var externalViewBuilder: SharedScreenViewBuilding
    
    public init(externalViewBuilder: SharedScreenViewBuilding) {
        self.externalViewBuilder = externalViewBuilder
    }
    
    @ViewBuilder public func view(for screen: Screen) -> some View {
        switch screen {
        case .playlists:
            ViewFactory.makePlaylistsCoordinatorView()
        case .createPlaylist(let onCreatePlaylist):
            ViewFactory.makeCreatePlaylistCoordinatorView(onCreatePlaylist: onCreatePlaylist)
        case .playlist(let store):
            ViewFactory.makePlaylistView(store: store)
            
        case .external(let sharedScreen):
            externalViewBuilder.view(for: sharedScreen)
        }
    }
}
