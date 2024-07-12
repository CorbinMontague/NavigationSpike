//
//  CreatePlaylistCoordinatorView.swift
//  Playlists
//
//  Created by Corbin Montague on 7/1/24.
//

import Core
import FlowStacks
import SwiftUI

struct CreatePlaylistCoordinatorView: View {
    
    @StateObject var coordinator: CreatePlaylistCoordinator
    @StateObject var viewModel: CreatePlaylistViewModel
    
    var body: some View {
        FlowStack($coordinator.path, withNavigation: true) {
            CreatePlaylistWithNameView(viewModel: viewModel)
                .navigationTitle("Create Playlist")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        DismissButton { coordinator.path.dismiss() }
                    }
                }
        }
    }
}

