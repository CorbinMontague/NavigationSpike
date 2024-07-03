//
//  ExploreCoordinatorView.swift
//  Explore
//
//  Created by Corbin Montague on 7/1/24.
//

import Foundation
import FlowStacks
import SwiftUI

public struct ExploreCoordinatorView: View {
    
    @StateObject var viewModel = ExploreViewModel()
    
    @State var path = FlowPath()
    
    public init() { }
    public var body: some View {
        FlowStack($path, withNavigation: true) {
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
        default:
            ProgressView()
                .task {
                    await viewModel.fetchSongs()
                }
        }
    }
}
