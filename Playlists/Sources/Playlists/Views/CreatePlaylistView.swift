//
//  CreatePlaylistView.swift
//  Playlists
//
//  Created by Corbin Montague on 7/1/24.
//

import Core
import FlowStacks
import SwiftUI

struct CreatePlaylistView: View {
    @EnvironmentObject var navigator: FlowPathNavigator
    
    @StateObject var viewModel = CreatePlaylistViewModel()
    
    var body: some View {
        Form {
            TextField(
                "Playlist Name",
                text: $viewModel.playlistName
            )
            .disableAutocorrection(true)
        }
    }
}
