//
//  ExploreView.swift
//  Explore
//
//  Created by Corbin Montague on 7/1/24.
//

import Core
import SwiftUI

struct ExploreView: View {
    @EnvironmentObject var viewBuilder: ModuleViewBuilder
    
    @StateObject var viewModel = ExploreViewModel()
    @StateObject var coordinator = ExploreCoordinator()
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            List {
                ForEach(viewModel.songs, id: \.name) { song in
                    makeSongCell(song: song)
                }
            }
            .navigationTitle("Explore")
            .navigationDestination(for: Destination.self) { destination in
                viewBuilder.view(for: destination)
                    .environmentObject(coordinator)
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
            coordinator.push(.external(.song(song)))
        }
    }
}
