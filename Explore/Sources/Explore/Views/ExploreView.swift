//
//  ExploreView.swift
//  Explore
//
//  Created by Corbin Montague on 7/1/24.
//

import Core
import Navigation
import SwiftUI

struct ExploreView: View {
    @EnvironmentObject var viewBuilder: DestinationViewBuilder
    
    @StateObject var viewModel = ExploreViewModel()
    @StateObject var navigator = Navigator<Destination>()
    
    var body: some View {
        NavigationStack(path: $navigator.path) {
            List {
                ForEach(viewModel.songs, id: \.name) { song in
                    makeSongCell(song: song)
                }
            }
            .navigationTitle("Explore")
            .navigationDestination(for: Destination.self) { destination in
                viewBuilder.view(for: destination)
                    .environmentObject(navigator)
            }
        }
    }
    
    @ViewBuilder private func makeSongCell(song: Song) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(song.name)
                .font(.body.bold())
            Text(song.artist.name)
                .font(.footnote)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .contentShape(Rectangle())
        .onTapGesture {
            navigator.push(.external(.song(song)))
        }
    }
}
