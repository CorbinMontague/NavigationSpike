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
        let navigator = PlaylistsCoordinator.shared
        let viewModel = PlaylistsViewModel(navigator: navigator)
        return AnyView(PlaylistsCoordinatorView(viewModel: viewModel, navigator: navigator))
    }
    
    public static func makeCreatePlaylistView(onCreatePlaylist: @escaping ((Playlist) -> Void)) -> AnyView {
        let viewModel = CreatePlaylistViewModel(onCreatePlaylist: onCreatePlaylist)
        return AnyView(CreatePlaylistView(viewModel: viewModel))
    }
    
    public static func makePlaylistView(playlist: Playlist,
                                        onDeletePlaylist: @escaping ((Playlist) -> Void),
                                        onRemoveSongFromPlaylist: @escaping ((Song, Playlist) -> Void)) -> AnyView {
        let viewModel = PlaylistViewModel(playlist: playlist,
                                          onDeletePlaylist: onDeletePlaylist,
                                          onRemoveSongFromPlaylist: onRemoveSongFromPlaylist)
        return AnyView(PlaylistView(viewModel: viewModel))
    }
}
