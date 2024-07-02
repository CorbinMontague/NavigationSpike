//
//  SongView.swift
//  Music
//
//  Created by Corbin Montague on 7/1/24.
//

import Core
import FlowStacks
import SwiftUI

struct SongView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var navigator: FlowPathNavigator
    
    @StateObject var viewModel: SongViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(viewModel.song.name)
                .font(.title2.bold())
            
            Text(viewModel.song.artist.name)
                .font(.title3)
                .foregroundStyle(.blue)
                .onTapGesture {
                    // TODO: Push ArtistView
                    print("Tapped on artist")
                    let destination = Destination.external(.artist(viewModel.song.artist))
                    navigator.push(destination)
                }
        }
//        .flowDestination(for: Destination.self) { destination in
//            viewBuilder.view(for: destination)
//                .environmentObject(viewBuilder)
//        }
        .navigationTitle("Song Details")
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                BackButton { dismiss() }
            }
        }
    }
}