//
//  DestinationViewBuilder.swift
//  Playlists
//
//  Created by Corbin Montague on 6/30/22.
//

import Core
import Foundation
import SwiftUI

public class DestinationViewBuilder: ObservableObject {
    private var externalViewBuilder: SharedViewBuilding
    
    public init(externalViewBuilder: SharedViewBuilding) {
        self.externalViewBuilder = externalViewBuilder
    }
    
    @ViewBuilder func view(at destination: Destination) -> some View {
        switch destination {
        case .playlists:
            ViewFactory.makePlaylistsCoordinatorView()
        case .createPlaylist(let onCreatePlaylist):
            ViewFactory.makeCreatePlaylistView(onCreatePlaylist: onCreatePlaylist)
        case .playlist(let playlist):
            ViewFactory.makePlaylistView(playlist: playlist)
            
        case .external(let sharedDestination):
            externalViewBuilder.view(at: sharedDestination)
        }
    }
}
