//
//  ExploreView.swift
//  Explore
//
//  Created by Corbin Montague on 7/1/24.
//

import Core
import FlowStacks
import SwiftUI

struct ExploreView: View {
    @EnvironmentObject var navigator: FlowPathNavigator
//    @EnvironmentObject var navigator: FlowNavigator<Screen>
    @ObservedObject var viewModel = ExploreViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.songs, id: \.name) { song in
                makeSongCell(song: song)
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
            navigator.push(Destination.external(.song(song)))
        }
    }
}
