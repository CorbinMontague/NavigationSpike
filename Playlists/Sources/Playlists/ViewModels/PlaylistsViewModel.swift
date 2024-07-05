//
//  PlaylistsViewModel.swift
//  Playlists
//
//  Created by Corbin Montague on 7/1/24.
//

import Core
import Foundation
import FlowStacks
import SwiftUI

class PlaylistsViewModel: ObservableObject {
    
    enum State {
        case none
        case loading
        case playlistsLoaded
        case empty
    }
    @Published var state: State = .none
    
    @Published var playlists: [Playlist] {
        didSet {
            state = playlists.isEmpty ? .empty : .playlistsLoaded
        }
    }
    
    @Published var navigator: PlaylistsCoordinator
    
    init(navigator: PlaylistsCoordinator,
         playlists: [Playlist] = []) {
        self.navigator = navigator
        self.playlists = playlists
    }
    
    @MainActor
    func fetchPlaylists() async {
        state = .loading
        
        // pretend we hit the network to fetch song data
        return await withCheckedContinuation { continuation in
            Task {
                // Delay the task by 1 second to simulate waiting on a network request
                try await Task.sleep(nanoseconds: 1_000_000_000)
                
                self.playlists = []
                continuation.resume()
            }
        }
    }
    
    func onCreatePlaylistTapped() {
        let destination = Destination.createPlaylist { newPlaylist in
            self.playlists.append(newPlaylist)
            self.navigator.path.dismiss()
        }
        navigator.path.presentSheet(destination)
    }
    
    func onPlaylistCellTapped(playlist: Playlist) {
        let destination = Destination.playlist(playlist) { playlistToDelete in
            for i in 0..<self.playlists.count {
                let playlist = self.playlists[i]
                if playlist.name == playlistToDelete.name {
                    self.playlists.remove(at: i)
                    break
                }
            }
            self.navigator.path.dismiss()
        }
        navigator.path.push(destination)
    }
    
    func onDeletePlaylistTapped() {
        
    }
}
