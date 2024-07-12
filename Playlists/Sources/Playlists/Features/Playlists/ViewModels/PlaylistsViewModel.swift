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
            print("Playlists: \(playlists)")
        }
    }
    
    @Published var coordinator: PlaylistsCoordinator
    
    init(coordinator: PlaylistsCoordinator,
         playlists: [Playlist] = []) {
        self.coordinator = coordinator
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
    
    // MARK: - Actions
    
    func onCreatePlaylistTapped() {
        let screen = Screen.createPlaylist { newPlaylist in
            self.playlists.append(newPlaylist)
            
            // save playlists data to UserDefaults
            if let encoded = try? JSONEncoder().encode(self.playlists) {
                UserDefaults.standard.set(encoded, forKey: UserDefaultsKeys.playlists.rawValue)
            }
        }
        coordinator.path.presentSheet(screen, withNavigation: true)
    }
    
    func onPlaylistCellTapped(playlist: Playlist) {
        let store = PlaylistStore(playlist: playlist) { playlistToDelete in
            self.deletePlaylist(playlistToDelete)
        } onRemoveSongFromPlaylist: { songToDelete, editedPlaylist in
            self.delete(song: songToDelete, from: editedPlaylist)
        }

        let screen = Screen.playlist(store: store)
        coordinator.path.push(screen)
    }
    
    func deletePlaylist(_ playlistToDelete: Playlist) {
        for i in 0..<self.playlists.count {
            let playlist = self.playlists[i]
            if playlist == playlistToDelete {
                self.playlists.remove(at: i)
                break
            }
        }
        //            self.coordinator.path.dismiss() // we could dismiss from here instead of from the view that called this closure if we want
    }
    
    func delete(song songToDelete: Song, from editedPlaylist: Playlist) {
        for playlistIndex in 0..<self.playlists.count {
            let playlist = self.playlists[playlistIndex]
            if playlist == editedPlaylist {
                for songIndex in 0..<playlist.songs.count {
                    let song = playlist.songs[songIndex]
                    if song == songToDelete {
                        self.playlists[playlistIndex].songs.remove(at: songIndex)
                        break
                    }
                }
            }
        }
    }
}
