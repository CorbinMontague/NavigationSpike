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
        let coordinator = PlaylistsCoordinator.shared
        let viewModel = PlaylistsViewModel(coordinator: coordinator)
        return AnyView(PlaylistsCoordinatorView(viewModel: viewModel, coordinator: coordinator))
    }
    
    public static func makeCreatePlaylistView(onCreatePlaylist: @escaping ((Playlist) -> Void)) -> AnyView {
        let viewModel = CreatePlaylistViewModel(onCreatePlaylist: onCreatePlaylist)
        return AnyView(CreatePlaylistView(viewModel: viewModel))
    }
    
    public static func makePlaylistView(store: PlaylistStore) -> AnyView {
        let viewModel = PlaylistViewModel(store: store)
        return AnyView(PlaylistView(viewModel: viewModel))
    }
}
