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
                            // Tip
                            // if we want to handle navigation within the shared view
                            SongCell(song: song)
                            
                            // if we want to handle navigation within the shared view, but inject a Screen so it can differ between callers
                            //                SongCell<Screen>(song: song, screenToPush: Screen.external(.song(song)))
                            
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
            // Tip
            // we can give view models a reference to their View's FlowPathNavigator or NavigationCoordinator
            // using this approach if we don't want to pass it in through its constructor
            viewModel.navigator = navigator
            print("PlaylistView.onAppear")
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
