//
//  CreatePlaylistWithSongsView.swift
//  Playlists
//
//  Created by Corbin Montague on 7/12/24.
//

import Core
import Foundation
import FlowStacks
import SwiftUI

struct CreatePlaylistWithSongsView: View {
    @EnvironmentObject var navigator: FlowPathNavigator
    @ObservedObject var viewModel: CreatePlaylistViewModel
    
    var body: some View {
        Form {
            Section(header: Text("Songs")) {
                ForEach(viewModel.songsToInclude, id: \.name) { song in
                    Text("\(song.name)")
                }
            }
            
            Section(header: Text("Songs to add")) {
                ForEach(Array(viewModel.songsToAdd.enumerated()), id: \.offset) { index, song in
                    Text("\(song.name)")
                        .foregroundStyle(.blue)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            viewModel.songsToInclude.append(song)
                            viewModel.songsToAdd.remove(at: index)
                        }
                }
            }
            
            Section(footer: makeCreatePlaylistButton()) {
                EmptyView()
            }
        }
        .navigationTitle(viewModel.playlistName)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                BackButton { navigator.pop() }
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                DismissButton { navigator.dismiss() }
            }
        }
    }
    
    @ViewBuilder private func makeCreatePlaylistButton() -> some View {
        HStack {
            Spacer()
            Button("Create Playlist") {
                navigator.dismiss()
                viewModel.onCreatePlaylistTapped()
            }
            Spacer()
        }
    }
}
