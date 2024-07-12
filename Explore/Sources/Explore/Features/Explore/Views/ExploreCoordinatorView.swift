//
//  ExploreCoordinatorView.swift
//  Explore
//
//  Created by Corbin Montague on 7/1/24.
//

import Core
import Foundation
import FlowStacks
import SwiftUI

struct ExploreCoordinatorView: View {
    
    @StateObject var viewModel: ExploreViewModel
    
    // even though the vm already has a reference to this, we need this reference here to tell SwiftUI that PlaylistsCoordinatorView owns the strong reference to PlaylistsCoordinator
    @StateObject var coordinator: ExploreCoordinator
    
    var body: some View {
        FlowStack($coordinator.path, withNavigation: true) {
            makeRootView()
                .flowDestination(for: Screen.self) { screen in
                    Globals.viewBuilder?.view(for: screen)
                }
                .flowDestination(for: SharedScreen.self) { sharedScreen in
                    Globals.viewBuilder?.view(for: .external(sharedScreen))
                }
                .navigationTitle("Explore")
        }
    }
    
    @ViewBuilder private func makeRootView() -> some View {
        switch viewModel.state {
        case .songsLoaded:
            ExploreView(viewModel: viewModel)
        case .empty:
            Text("No Songs")
        case .loading:
            ProgressView()
                .task {
                    await viewModel.fetchSongs()
                }
        }
    }
}
