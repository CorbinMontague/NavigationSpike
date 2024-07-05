//
//  ExploreCoordinatorView.swift
//  Explore
//
//  Created by Corbin Montague on 7/1/24.
//

import Foundation
import FlowStacks
import SwiftUI

struct ExploreCoordinatorView: View {
    
    @StateObject var viewModel: ExploreViewModel
    
    // even though the vm already has a reference to this, we need this reference here to tell SwiftUI that PlaylistsCoordinatorView owns the strong reference to PlaylistsCoordinator
    @StateObject var navigator: ExploreCoordinator
    
    var body: some View {
        FlowStack($navigator.path, withNavigation: true) {
            makeRootView()
                .flowDestination(for: Destination.self) { destination in
                    Globals.viewBuilder?.view(at: destination)
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
        default:
            ProgressView()
                .task {
                    await viewModel.fetchSongs()
                }
        }
    }
}
