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
            ForEach(viewModel.songs, id: \.id) { song in
                // if we want to handle navigation within the shared view
                SongCell(song: song)
                
                // if we want to handle navigation within the shared view, but inject a Screen so it can differ between callers
//                SongCell<Screen>(song: song, screen: Screen.external(.song(song)))
                
                // if we want to handle navigation ourselves
//                SongCell(song: song) {
//                    viewModel.onSongCellTapped(song: song)
//                }
            }
        }
    }
}
