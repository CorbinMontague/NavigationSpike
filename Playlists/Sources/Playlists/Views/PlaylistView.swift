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
                    Text("\(song.name)")
                        .foregroundStyle(.blue)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            let destination = Destination.external(.song(song))
                            navigator.push(destination)
                        }
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
                    viewModel.onDeletePlaylist(viewModel.playlist)
                } label: {
                    Text("Delete")
                        .foregroundStyle(.red)
                }
            }
        }
    }
    
//    func onDeleteSong(at offsets: IndexSet) {
//        viewModel.playlist.songs =
//        viewModel.playlist.songs.enumerated().filter { (i, song) -> Bool in
//            let removed = offsets.contains(i)
//            if removed {
//                print("Removing \(song.name)")
//            }
//            return !removed
//        }.map { $0.1 }
//    }
}
