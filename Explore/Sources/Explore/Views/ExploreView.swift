//
//  ExploreView.swift
//  Explore
//
//  Created by Corbin Montague on 7/1/24.
//

import Music
import SwiftUI

public struct ExploreView: View {
    
    @StateObject var viewModel = ExploreViewModel()
    @StateObject var coordinator = ExploreCoordinator()
    
    public init() { }
    public var body: some View {
        NavigationStack(path: $coordinator.path) {
            List {
                ForEach(viewModel.songs, id: \.name) { song in
                    makeSongCell(song: song)
                }
            }
            .navigationTitle("Explore")
            .navigationDestination(for: Destination.self) { destination in
                Text("Foo")
//                ModuleViewBuilder.view(for: destination)
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
            print("Tapped on \(song.name)")
        }
    }
}
