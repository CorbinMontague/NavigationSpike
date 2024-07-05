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
    
    // even though the vm already has a reference to this, we need this reference here to tell SwiftUI that PlaylistsCoordinatorView owns the strong reference to PlaylistsCoordinator
    @StateObject var navigator: PlaylistsCoordinator
    
    var body: some View {
        FlowStack($navigator.path, withNavigation: true) {
            makeRootView()
                .flowDestination(for: Destination.self) { destination in
                    Globals.viewBuilder?.view(at: destination)
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
            PlaylistsView(viewModel: viewModel)
        case .empty:
            Text("No Playlists")
        default:
            ProgressView()
                .task {
                    await viewModel.fetchPlaylists()
                }
        }
    }
}
