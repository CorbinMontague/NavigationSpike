//
//  PlaylistView.swift
//  Playlists
//
//  Created by Corbin Montague on 7/1/24.
//

import Core
import FlowStacks
import SwiftUI

struct PlaylistView: View {
    @EnvironmentObject var navigator: FlowPathNavigator
    
    @StateObject var viewModel: PlaylistViewModel
    
    var body: some View {
        List {
            Section(header: Text("Playlist")) {
                Text("\(viewModel.playlist.name)")
            }
            
            Section(header: Text("Songs")) {
                ForEach(viewModel.playlist.songs, id: \.name) { song in
                    // if we want to handle navigation within the shared view
                    SongCell(song: song)
                    
                    // if we want to handle navigation within the shared view, but inject a destination so the destination could differ between callers
    //                SongCell<Destination>(song: song, destination: Destination.external(.song(song)))
                    
                    // if we want to handle navigation ourselves
    //                SongCell(song: song) {
    //                    viewModel.onSongCellTapped(song: song)
    //                }
                }
                .onDelete(perform: viewModel.onDeleteSong)
            }
        }
        .navigationTitle("Playlist Details")
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                BackButton { navigator.goBack() }
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    navigator.dismiss()
                    viewModel.onDeletePlaylist(viewModel.playlist)
                } label: {
                    Text("Delete")
                        .foregroundStyle(.red)
                }
            }
        }
    }
}
