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
        return AnyView(PlaylistsCoordinatorView())
    }
    
    public static func makeCreatePlaylistView() -> AnyView {
        return AnyView(CreatePlaylistView())
    }
    
    public static func makePlaylistView(playlist: Playlist) -> AnyView {
        let viewModel = PlaylistViewModel(playlist: playlist)
        return AnyView(PlaylistView(viewModel: viewModel))
    }
}
