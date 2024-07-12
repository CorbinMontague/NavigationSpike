//
//  PlaylistsViewModel.swift
//  Playlists
//
//  Created by Corbin Montague on 7/1/24.
//

import Combine
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
    @Published var state: State = .none {
        didSet {
            print("PlaylistsViewModel.state: \(state)")
        }
    }
    
    @Published var playlists: [Playlist] {
        didSet {
            state = playlists.isEmpty ? .empty : .playlistsLoaded
        }
    }
    @Published var coordinator: PlaylistsCoordinator
    var playlistsManager: PlaylistsManaging
    
    // MARK: - Init
    
    init(playlists: [Playlist] = [],
         coordinator: PlaylistsCoordinator = Globals.coordinator,
         playlistsManager: PlaylistsManaging = PlaylistsManager.shared) {
        self.playlists = playlists
        self.coordinator = coordinator
        self.playlistsManager = playlistsManager
    }
    
    // MARK: - Observers
    
    private var playlistsCancellable: AnyCancellable?
    
    func setupObservers() {
        playlistsCancellable = playlistsManager.playlistsPublisher
            .receive(on: DispatchQueue.main)
            .dropFirst()
            .sink { [weak self] playlists in
                guard let self = self else { return }
                print("PlaylistsViewModel.playlists updated from publisher")
                self.playlists = playlists
            }
    }
    
    // MARK: - APIs
    
    @MainActor
    func fetchPlaylists() async {
        state = .loading
        
        // pretend we hit the network to fetch song data
        return await withCheckedContinuation { continuation in
            Task {
                // Delay the task by 1 second to simulate waiting on a network request
                try await Task.sleep(nanoseconds: 1_000_000_000)
                
                playlistsManager.loadPlaylists()
                continuation.resume()
            }
        }
    }
    
    // MARK: - Actions
    
    func onCreatePlaylistTapped() {
        let screen = Screen.createPlaylist { newPlaylist in
            self.playlistsManager.addPlaylist(playlist: newPlaylist)
        }
        coordinator.path.presentSheet(screen, withNavigation: true)
    }
    
    func onPlaylistCellTapped(playlist: Playlist) {
        let store = PlaylistStore(playlist: playlist) { playlistToDelete in
            self.playlistsManager.deletePlaylist(playlistId: playlistToDelete.id)
        } onRemoveSongFromPlaylist: { songToDelete, editedPlaylist in
            self.playlistsManager.deleteSongFromPlaylist(songId: songToDelete.id, playlistId: editedPlaylist.id)
        }
        
        let screen = Screen.playlist(store: store)
        coordinator.path.push(screen)
    }
    
    func onSwipeToDeletePlaylist(at offsets: IndexSet) {
        for (i, playlist) in playlists.enumerated() {
            if offsets.contains(i) {
                playlistsManager.deletePlaylist(playlistId: playlist.id)
            }
        }
    }
}
