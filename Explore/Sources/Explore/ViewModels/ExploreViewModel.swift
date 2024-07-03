//
//  ExploreViewModel.swift
//  Music
//
//  Created by Corbin Montague on 7/1/24.
//

import Core
import SwiftUI

public class ExploreViewModel: ObservableObject {
    
    enum State {
        case none
        case loading
        case songsLoaded
    }
    @Published var state: State = .none {
        didSet {
            print("State: \(state)")
        }
    }
    
    @Published var songs: [Song]
    
    public init(songs: [Song] = []) {
        self.songs = songs
    }
    
    @MainActor
    func fetchSongs() async {
        print("Fetching Songs...")
        state = .loading
        
        // pretend we hit the network to fetch song data
        return await withCheckedContinuation { continuation in
            Task {
                // Delay the task by 1 second to simulate waiting on a network request
                try await Task.sleep(nanoseconds: 1_000_000_000)
                
                print("Songs Fetched!")
                self.songs = Song.makeAllSongs()
                self.state = .songsLoaded
                continuation.resume()
            }
        }
    }
}
