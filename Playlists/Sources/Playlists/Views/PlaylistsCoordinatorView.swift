//
//  PlaylistsCoordinatorView.swift
//  Playlists
//
//  Created by Corbin Montague on 7/1/24.
//

import Core
import FlowStacks
import SwiftUI

public struct PlaylistsCoordinatorView: View {
    
    @StateObject var viewModel = PlaylistsViewModel()
    
    @State var path = FlowPath()
    
    public init() { }
    public var body: some View {
        FlowStack($path, withNavigation: true) {
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
