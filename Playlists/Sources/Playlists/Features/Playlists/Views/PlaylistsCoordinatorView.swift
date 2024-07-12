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
    
    @StateObject var viewModel: PlaylistsViewModel
    
    // even though the view model also has a reference to this, we need this @StateObject reference here to tell SwiftUI
    // that PlaylistsCoordinatorView owns the strong reference to PlaylistsCoordinator
    @StateObject var coordinator: PlaylistsCoordinator
    
    var body: some View {
        FlowStack($coordinator.path, withNavigation: true) {
            makeRootView()
                .flowDestination(for: Destination.self) { destination in
                    Globals.viewBuilder?.view(at: destination)
                }
                .flowDestination(for: SharedDestination.self) { sharedDestination in
                    Globals.viewBuilder?.view(at: .external(sharedDestination))
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
