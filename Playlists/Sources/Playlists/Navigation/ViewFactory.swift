//
//  ViewFactory.swift
//  Playlists
//
//  Created by Corbin Montague on 7/1/24.
//

import Core
import Foundation
import SwiftUI

public struct ViewFactory {
    public static func makePlaylistsCoordinatorView() -> AnyView {
        let coordinator = Globals.coordinator
        let viewModel = PlaylistsViewModel(coordinator: coordinator)
        return AnyView(PlaylistsCoordinatorView(coordinator: coordinator,
                                                viewModel: viewModel))
    }
    
    public static func makeCreatePlaylistCoordinatorView(onCreatePlaylist: @escaping ((Playlist) -> Void)) -> AnyView {
        let coordinator = CreatePlaylistCoordinator()
        let viewModel = CreatePlaylistViewModel(coordinator: coordinator,
                                                onCreatePlaylist: onCreatePlaylist)
        return AnyView(CreatePlaylistCoordinatorView(coordinator: coordinator,
                                                     viewModel: viewModel))
    }
    
    public static func makePlaylistView(store: PlaylistStore) -> AnyView {
        let viewModel = PlaylistViewModel(store: store)
        return AnyView(PlaylistView(viewModel: viewModel))
    }
}
