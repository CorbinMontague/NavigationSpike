//
//  ExploreViewModel.swift
//  Music
//
//  Created by Corbin Montague on 7/1/24.
//

import Core
import SwiftUI

class ExploreViewModel: ObservableObject {
    
    enum State {
        case none
        case loading
        case songsLoaded
        case empty
    }
    @Published var state: State = .none
    
    @Published var coordinator: ExploreCoordinator
    @Published var songs: [Song] {
        didSet {
            state = songs.isEmpty ? .empty : .songsLoaded
        }
    }
    
    init(coordinator: ExploreCoordinator,
         songs: [Song] = []) {
        self.coordinator = coordinator
        self.songs = songs
    }
    
    @MainActor
    func fetchSongs() async {
        state = .loading
        
        // pretend we hit the network to fetch song data
        return await withCheckedContinuation { continuation in
            Task {
                // Delay the task by 1 second to simulate waiting on a network request
                try await Task.sleep(nanoseconds: 1_000_000_000)
                
                self.songs = Song.makeAllSongs()
                continuation.resume()
            }
        }
    }
    
    func onSongCellTapped(song: Song) {
        let destination = Destination.external(.song(song))
        coordinator.path.push(destination)
    }
}
