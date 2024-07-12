//
//  PlaylistsView.swift
//  Playlists
//
//  Created by Corbin Montague on 7/1/24.
//

import Core
import FlowStacks
import SwiftUI

struct PlaylistsView: View {
    @EnvironmentObject var navigator: FlowPathNavigator
    
    @ObservedObject var viewModel: PlaylistsViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.playlists, id: \.id) { playlist in
                PlaylistCell(playlist: playlist) {
                    viewModel.onPlaylistCellTapped(playlist: playlist)
                }
            }
            .onDelete(perform: viewModel.onSwipeToDeletePlaylist)
        }
    }
}
