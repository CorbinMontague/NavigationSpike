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
    
    @StateObject var coordinator: PlaylistsCoordinator = Globals.coordinator
    @StateObject var viewModel: PlaylistsViewModel
    
    var body: some View {
        FlowStack($coordinator.path, withNavigation: true) {
            makeRootView()
                .task {
                    print("PlaylistsCoordinatorView.task")
                    if viewModel.state == .none {
                        viewModel.setupObservers()
                        await viewModel.fetchPlaylists()
                    }
                }
                .flowDestination(for: Screen.self) { screen in
                    Globals.viewBuilder?.view(for: screen)
                }
                .flowDestination(for: SharedScreen.self) { sharedScreen in
                    Globals.viewBuilder?.view(for: .external(sharedScreen))
                }
                .navigationTitle("Playlists")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        CreateButton { viewModel.onCreatePlaylistButtonTapped() }
                    }
                }
        }
    }
    
    @ViewBuilder private func makeRootView() -> some View {
        // Tip
        //
        // If the root view of your FlowStack can switch between different states like this one,
        // it's important to wrap the switch statement in another view like a VStack. Even if you
        // aren't going to use the VStack to layout views vertically, this helps avoid an issue where
        // FlowStacks would otherwise listen to changes to this view when it switches states and think it
        // needs to reset the path that is injected into the FlowStack which can cause bugs where the app backs
        // out to this root view after pushing another view from a deeplink.
        VStack {
            switch viewModel.state {
            case .playlistsLoaded:
                makePlaylistsView()
            case .empty:
                makeEmptyStateView()
            default:
                makeLoadingStateView()
            }
        }
    }
    
    @ViewBuilder private func makePlaylistsView() -> some View {
        PlaylistsView(viewModel: viewModel)
    }
    
    @ViewBuilder private func makeEmptyStateView() -> some View {
        VStack(spacing: 24) {
            Text("No Playlists")
            
            Text("Discover Songs")
                .foregroundStyle(.blue)
                .onTapGesture {
                    coordinator.navigate(to: .explore)
                }
        }
    }
    
    @ViewBuilder private func makeLoadingStateView() -> some View {
        ProgressView()
    }
}
