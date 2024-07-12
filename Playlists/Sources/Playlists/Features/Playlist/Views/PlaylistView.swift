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
                    Section(header: Text("Name")) {
                        Text("\(playlist.name)")
                    }
                    
                    Section(header: Text("Songs")) {
                        ForEach(playlist.songs, id: \.id) { song in
                            // if we want to handle navigation within the shared view
                            SongCell(song: song)
                            
                            // if we want to handle navigation within the shared view, but inject a Screen so it can differ between callers
                            //                SongCell<Screen>(song: song, screen: Screen.external(.song(song)))
                            
                            // if we want to handle navigation ourselves
                            //                SongCell(song: song) {
                            //                    viewModel.onSongCellTapped(song: song)
                            //                }
                        }
                        .onDelete(perform: viewModel.onSwipeToDeleteSong)
                    }
                }
            } else {
                Text("Playlist Unavailable")
            }
        }
        .onAppear {
            viewModel.navigator = navigator
        }
        .navigationTitle("Playlist Details")
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                BackButton { navigator.pop() }
            }
            
            if let playlist = viewModel.playlist {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        viewModel.foo(playlist)
                    } label: {
                        Text("Delete")
                            .foregroundStyle(.red)
                    }
                }
            }
        }
    }
}
