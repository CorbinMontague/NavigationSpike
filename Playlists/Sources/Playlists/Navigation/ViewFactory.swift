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
        let navCoordinator = PlaylistsCoordinator.shared
        let viewModel = PlaylistsViewModel(navigator: navCoordinator)
        return AnyView(PlaylistsCoordinatorView(viewModel: viewModel, navigator: navCoordinator))
    }
    
    public static func makeCreatePlaylistView(onCreatePlaylist: @escaping ((Playlist) -> Void)) -> AnyView {
        let viewModel = CreatePlaylistViewModel(onCreatePlaylist: onCreatePlaylist)
        return AnyView(CreatePlaylistView(viewModel: viewModel))
    }
    
    public static func makePlaylistView(playlist: Playlist) -> AnyView {
        let viewModel = PlaylistViewModel(playlist: playlist)
        return AnyView(PlaylistView(viewModel: viewModel))
    }
}
