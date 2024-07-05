//
//  PlaylistsView.swift
//  Playlists
//
//  Created by Corbin Montague on 7/1/24.
//

import Core
import FlowStacks
import SwiftUI

struct PlaylistsView: View {
    @EnvironmentObject var navigator: FlowPathNavigator
    
    @StateObject var viewModel: PlaylistsViewModel
    
    var body: some View {
        List {
            // List of PlaylistCell get rendered here
        }
        .flowDestination(for: Destination.self) { destination in
            Globals.viewBuilder?.view(at: destination)
        }
    }
}
