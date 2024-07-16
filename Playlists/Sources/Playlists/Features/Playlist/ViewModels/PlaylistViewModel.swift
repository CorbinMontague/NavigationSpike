//
//  PlaylistViewModel.swift
//  Playlists
//
//  Created by Corbin Montague on 7/1/24.
//

import Core
import Foundation
import FlowStacks
import SwiftUI

public struct PlaylistStore {
    var playlistId: String
    var playlist: Playlist? = nil
    
    public init(playlist: Playlist) {
        self.playlist = playlist
        self.playlistId = playlist.id
    }
    
    public init(playlistId: String) {
        self.playlistId = playlistId
    }
}

class PlaylistViewModel: ObservableObject {
    
    @Published var playlist: Playlist?
    var navigator: FlowPathNavigator? = nil
    var playlistsManager: PlaylistsManaging
    
    init(store: PlaylistStore,
         playlistsManager: PlaylistsManaging = PlaylistsManager.shared) {
        if let playlist = store.playlist {
            self.playlist = playlist
        } else {
            // We only have the playlist's id, so see if we can find the playlist in our saved playlists data.
            // This example is similar to if we pushed a view with only an id and then had to load the entire DTO
            // over the network by calling some BE API while rendering a loading state.
            if let data = UserDefaults.standard.object(forKey: UserDefaultsKeys.playlists.rawValue) as? Data {
                if let playlistsDecoded = try? JSONDecoder().decode(Array.self, from: data) as [Playlist] {
                    for playlist in playlistsDecoded {
                        if playlist.id == store.playlistId {
                            self.playlist = playlist
                        }
                    }
                }
            }
        }
        self.playlistsManager = playlistsManager
    }
    
    @MainActor
    func onDeletePlaylist(_ playlist: Playlist) {
        navigator?.dismiss()
        playlistsManager.deletePlaylist(playlistId: playlist.id)
    }
    
    func onSwipeToDeleteSong(at offsets: IndexSet) {
        // remove song locally from playlist
        guard let playlist = self.playlist else { return }
        self.playlist?.songs =
        playlist.songs.enumerated().filter { (i, song) -> Bool in
            let removed = offsets.contains(i)
            if removed {
                // remove song globally from playlist
                self.playlistsManager.deleteSongFromPlaylist(songId: song.id, playlistId: playlist.id)
            }
            return !removed
        }.map { $0.1 }
    }
}
