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
    
    // MARK: - Internal Views
    
    static func makePlaylistsCoordinatorView() -> PlaylistsCoordinatorView {
        let viewModel = ViewModelFactory.makePlaylistsViewModel()
        return PlaylistsCoordinatorView(coordinator: Globals.coordinator,
                                        viewModel: viewModel)
    }
    
    static func makeCreatePlaylistCoordinatorView(onCreatePlaylist: @escaping ((Playlist) -> Void)) -> CreatePlaylistCoordinatorView {
        let coordinator = CreatePlaylistCoordinator()
        let viewModel = ViewModelFactory.makeCreatePlaylistViewModel(coordinator: coordinator,
                                                                     onCreatePlaylist: onCreatePlaylist)
        return CreatePlaylistCoordinatorView(coordinator: coordinator,
                                             viewModel: viewModel)
    }
    
    static func makePlaylistView(store: PlaylistStore) -> PlaylistView {
        let viewModel = ViewModelFactory.makePlaylistViewModel(store: store)
        return PlaylistView(viewModel: viewModel)
    }
    
    // MARK: - Cross-Module Views
    
    public static func makePlaylistsCoordinatorAnyView() -> AnyView {
        let view = makePlaylistsCoordinatorView()
        return AnyView(view)
    }
    
    public static func makeCreatePlaylistCoordinatorAnyView(onCreatePlaylist: @escaping ((Playlist) -> Void)) -> AnyView {
        let view = makeCreatePlaylistCoordinatorView(onCreatePlaylist: onCreatePlaylist)
        return AnyView(view)
    }
    
    public static func makePlaylistAnyView(store: PlaylistStore) -> AnyView {
        let view = makePlaylistView(store: store)
        return AnyView(view)
    }
}
