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
                .flowDestination(for: Screen.self) { screen in
                    Globals.viewBuilder?.view(for: screen)
                }
                .flowDestination(for: SharedScreen.self) { sharedScreen in
                    Globals.viewBuilder?.view(for: .external(sharedScreen))
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

