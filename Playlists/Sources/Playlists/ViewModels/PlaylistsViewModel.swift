//
//  PlaylistsViewModel.swift
//  Playlists
//
//  Created by Corbin Montague on 7/1/24.
//

import Core
import Foundation
import SwiftUI

class PlaylistsViewModel: ObservableObject {
    
    enum State {
        case none
        case loading
        case playlistsLoaded
        case empty
    }
    @Published var state: State = .none {
        didSet {
            print("State: \(state)")
        }
    }
    
    @Published var playlists: [Playlist]
    
    init(playlists: [Playlist] = []) {
        self.playlists = playlists
    }
    
    @MainActor
    func fetchPlaylists() async {
        print("Fetching Playlists...")
        state = .loading
        
        // pretend we hit the network to fetch song data
        return await withCheckedContinuation { continuation in
            Task {
                // Delay the task by 1 second to simulate waiting on a network request
                try await Task.sleep(nanoseconds: 1_000_000_000)
                
                print("Playlists Fetched!")
                self.playlists = []
                self.state = .empty
                continuation.resume()
            }
        }
    }
    
    func onCreatePlaylistTapped() {
        print("onCreatePlaylistTapped")
        // tell navigator to present CreatePlaylistView as a sheet
    }
}
