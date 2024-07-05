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
    
    @StateObject var coordinator = ExploreCoordinator.shared
    @StateObject var viewModel = ExploreViewModel()
    
    var body: some View {
        FlowStack($coordinator.path, withNavigation: true) {
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
