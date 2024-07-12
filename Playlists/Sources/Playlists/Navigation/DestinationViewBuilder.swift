//
//  DestinationViewBuilder.swift
//  Playlists
//
//  Created by Corbin Montague on 6/30/22.
//

import Core
import Foundation
import SwiftUI

public class DestinationViewBuilder {
    private var externalViewBuilder: SharedViewBuilding
    
    public init(externalViewBuilder: SharedViewBuilding) {
        self.externalViewBuilder = externalViewBuilder
    }
    
    @ViewBuilder func view(at destination: Destination) -> some View {
        switch destination {
        case .playlists:
            ViewFactory.makePlaylistsCoordinatorView()
        case .createPlaylist(let onCreatePlaylist):
            ViewFactory.makeCreatePlaylistCoordinatorView(onCreatePlaylist: onCreatePlaylist)
        case .playlist(let store):
            ViewFactory.makePlaylistView(store: store)
            
        case .external(let sharedDestination):
            externalViewBuilder.view(at: sharedDestination)
        }
    }
}
