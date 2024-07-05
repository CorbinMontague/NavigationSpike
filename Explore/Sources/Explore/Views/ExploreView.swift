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
    @ObservedObject var viewModel: ExploreViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.songs, id: \.name) { song in
                SongCell<Destination>(song: song, destination: Destination.external(.song(song)))
            }
        }
    }
}
