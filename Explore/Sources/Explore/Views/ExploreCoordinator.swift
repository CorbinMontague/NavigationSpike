//
//  ExploreCoordinator.swift
//  Explore
//
//  Created by Corbin Montague on 7/1/24.
//

import Foundation
import FlowStacks
import SwiftUI

public struct ExploreCoordinator: View {
    @EnvironmentObject var viewBuilder: DestinationViewBuilder
    
    @StateObject var viewModel = ExploreViewModel()
    
//    @State var path = FlowPath()
    @State private var routes: [Route<Screen>] = []
    
    public init() { }
    public var body: some View {
        FlowStack($routes, withNavigation: true) {
            makeRootView()
                .flowDestination(for: Screen.self) { screen in
                    viewBuilder.view(for: screen)
                        .environmentObject(viewBuilder)
                }
                .navigationTitle("Explore")
        }
    }
    
    @ViewBuilder private func makeRootView() -> some View {
        switch viewModel.state {
        case .songsLoaded:
            ExploreView(viewModel: viewModel)
        default:
            ProgressView()
                .task {
                    await viewModel.fetchSongs()
                }
        }
    }
}
