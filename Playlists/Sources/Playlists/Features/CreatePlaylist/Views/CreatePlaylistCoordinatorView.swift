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
    
    @StateObject var viewModel: CreatePlaylistViewModel
    
    @State public var path = FlowPath()
    
    var body: some View {
        FlowStack($path, withNavigation: true) {
            CreatePlaylistWithNameView(viewModel: viewModel)
                .flowDestination(for: Destination.self) { destination in
                    Globals.viewBuilder?.view(at: destination)
                }
                .flowDestination(for: SharedDestination.self) { sharedDestination in
                    Globals.viewBuilder?.view(at: .external(sharedDestination))
                }
                .navigationTitle("Create Playlist")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        DismissButton { path.dismiss() }
                    }
                }
        }
    }
}

