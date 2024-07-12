//
//  CreatePlaylistWithNameView.swift
//  Playlists
//
//  Created by Corbin Montague on 7/12/24.
//

import Core
import Foundation
import FlowStacks
import SwiftUI

struct CreatePlaylistWithNameView: View {
    @EnvironmentObject var navigator: FlowPathNavigator
    @ObservedObject var viewModel: CreatePlaylistViewModel
    
    @State var isPushingNextStep = false
    
    var body: some View {
        Form {
            TextField(
                "Playlist Name",
                text: $viewModel.playlistName
            )
            .disableAutocorrection(true)
            
            Section(footer: makeNextStepButton()) {
                EmptyView()
            }
        }
        // using this API to avoid needing to define additional Destination cases for each of the views within the create playlist flow
        .flowDestination(isPresented: $isPushingNextStep,
                         style: .push,
                         destination: {
            CreatePlaylistWithSongsView(viewModel: viewModel)
        })
    }
    
    @ViewBuilder private func makeNextStepButton() -> some View {
        HStack {
            Spacer()
            Button("Next") {
                isPushingNextStep = true
            }
            .disabled(viewModel.playlistName.isEmpty)
            Spacer()
        }
    }
}
