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
        Group {
            if let playlist = viewModel.playlist {
                List {
                    Section(header: Text("Playlist")) {
                        Text("\(playlist.name)")
                    }
                    
                    Section(header: Text("Songs")) {
                        ForEach(playlist.songs, id: \.name) { song in
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
            } else {
                Text("Playlist Unavailable")
            }
        }
        .navigationTitle("Playlist Details")
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                BackButton { navigator.goBack() }
            }
            
            if let playlist = viewModel.playlist {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        navigator.dismiss()
                        viewModel.onDeletePlaylist(playlist)
                    } label: {
                        Text("Delete")
                            .foregroundStyle(.red)
                    }
                }
            }
        }
    }
}
