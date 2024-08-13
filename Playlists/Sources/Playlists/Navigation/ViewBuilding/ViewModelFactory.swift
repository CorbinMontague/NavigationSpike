//
//  ViewModelFactory.swift
//
//
//  Created by Corbin Montague on 8/13/24.
//

import Core
import Foundation
import SwiftUI

struct ViewModelFactory {
    
    static func makePlaylistsViewModel() -> PlaylistsViewModel {
        return PlaylistsViewModel(coordinator: Globals.coordinator)
    }
    
    static func makeCreatePlaylistViewModel(coordinator: CreatePlaylistCoordinator,
                                            onCreatePlaylist: @escaping ((Playlist) -> Void)) -> CreatePlaylistViewModel {
        return CreatePlaylistViewModel(coordinator: coordinator,
                                       onCreatePlaylist: onCreatePlaylist)
    }
    
    static func makePlaylistViewModel(store: PlaylistStore) -> PlaylistViewModel {
        return PlaylistViewModel(store: store)
    }
}
