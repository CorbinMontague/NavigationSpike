//
//  PlaylistsCoordinatorView.swift
//  Playlists
//
//  Created by Corbin Montague on 7/1/24.
//

import Core
import FlowStacks
import SwiftUI

struct PlaylistsCoordinatorView: View {
    @EnvironmentObject var navigator: FlowPathNavigator
    
    @StateObject var viewModel = PlaylistsViewModel()
    
    var body: some View {
        Text("Playlists")
//        List {
//            Section(header: Text("Artist")) {
//                Text("\(viewModel.artist.name)")
//            }
//            
//            Section(header: Text("Songs")) {
//                ForEach(viewModel.artist.songs, id: \.name) { song in
//                    Text("\(song.name)")
//                        .foregroundStyle(.blue)
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .contentShape(Rectangle())
//                        .onTapGesture {
//                            let destination = Destination.external(.song(song))
//                            navigator.push(destination)
//                        }
//                }
//            }
//            
//            NavigationActionsView<Destination>()
//        }
        .navigationTitle("Playlists")
    }
}
