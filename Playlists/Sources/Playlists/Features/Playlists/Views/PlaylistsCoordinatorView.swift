//
//  PlaylistsCoordinatorView.swift
//  Playlists
//
//  Created by Corbin Montague on 7/1/24.
//

import Core
import FlowStacks
import SwiftUI

struct PlaylistsCoordinatorView: View {
    
    @StateObject var coordinator: PlaylistsCoordinator
    @StateObject var viewModel: PlaylistsViewModel
    
    var body: some View {
        FlowStack($coordinator.path, withNavigation: true) {
            makeRootView()
                .flowDestination(for: Screen.self) { screen in
                    Globals.viewBuilder?.view(for: screen)
                }
                .flowDestination(for: SharedScreen.self) { sharedScreen in
                    Globals.viewBuilder?.view(for: .external(sharedScreen))
                }
                .navigationTitle("Playlists")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        CreateButton { viewModel.onCreatePlaylistTapped() }
                    }
                }
        }
    }
    
    @ViewBuilder private func makeRootView() -> some View {
        switch viewModel.state {
        case .playlistsLoaded:
            makePlaylistsView()
        case .empty:
            makeEmptyStateView()
        default:
            makeLoadingStateView()
        }
    }
    
    @ViewBuilder private func makePlaylistsView() -> some View {
        PlaylistsView(viewModel: viewModel)
    }
    
    @ViewBuilder private func makeEmptyStateView() -> some View {
        Text("No Playlists")
    }
    
    @ViewBuilder private func makeLoadingStateView() -> some View {
        ProgressView()
            .task {
                await viewModel.fetchPlaylists()
            }
    }
}