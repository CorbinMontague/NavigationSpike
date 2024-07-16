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
    
    // Tip
    // even though the vm already has a reference to this, we need this reference here to tell SwiftUI that PlaylistsCoordinatorView owns the strong reference to PlaylistsCoordinator
    @StateObject var coordinator: ExploreCoordinator
    @StateObject var viewModel: ExploreViewModel
    
    var body: some View {
        FlowStack($coordinator.path, withNavigation: true) {
            makeRootView()
                .task {
                    if viewModel.state == .none {
                        await viewModel.fetchSongs()
                    }
                }
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
        // Tip
        //
        // If the root view of your FlowStack can switch between different states like this one,
        // it's important to wrap the switch statement in another view like a VStack. Even if you
        // aren't going to use the VStack to layout views vertically, this helps avoid an issue where
        // FlowStacks would otherwise listen to changes to this view when it switches states and think it
        // needs to reset the path that is injected into the FlowStack which can cause bugs where the app backs
        // out to this root view after pushing another view from a deeplink.
        VStack {
            switch viewModel.state {
            case .songsLoaded:
                ExploreView(viewModel: viewModel)
            case .empty:
                Text("No Songs")
            default:
                ProgressView()
            }
        }
    }
}
