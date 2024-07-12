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
    var playlistName: String
    var playlist: Playlist? = nil
    var onDeletePlaylist: ((Playlist) -> Void)
    var onRemoveSongFromPlaylist: ((Song, Playlist) -> Void)
    
    public init(playlist: Playlist,
                onDeletePlaylist: @escaping (Playlist) -> Void,
                onRemoveSongFromPlaylist: @escaping (Song, Playlist) -> Void) {
        self.playlist = playlist
        self.playlistName = playlist.name
        self.onDeletePlaylist = onDeletePlaylist
        self.onRemoveSongFromPlaylist = onRemoveSongFromPlaylist
    }
    
    public init(playlistName: String,
                onDeletePlaylist: @escaping (Playlist) -> Void,
                onRemoveSongFromPlaylist: @escaping (Song, Playlist) -> Void) {
        self.playlistName = playlistName
        self.onDeletePlaylist = onDeletePlaylist
        self.onRemoveSongFromPlaylist = onRemoveSongFromPlaylist
    }
}

class PlaylistViewModel: ObservableObject {
    
    @Published var playlist: Playlist? {
        didSet {
            print("Playlist: \(String(describing: playlist))")
        }
    }
    var onDeletePlaylist: ((Playlist) -> Void)
    var onRemoveSongFromPlaylist: ((Song, Playlist) -> Void)
    var navigator: FlowPathNavigator? = nil
    
    init(store: PlaylistStore) {
        if let playlist = store.playlist {
            self.playlist = playlist
        } else {
            // We only have the playlist name to go off of, so see if we can find the playlist in our saved playlists data.
            // This is similar to if we pushed a view with only an id and then had to load the entire DTO by calling some BE API.
            if let data = UserDefaults.standard.object(forKey: UserDefaultsKeys.playlists.rawValue) as? Data {
                if let playlistsDecoded = try? JSONDecoder().decode(Array.self, from: data) as [Playlist] {
                    for playlist in playlistsDecoded {
                        if playlist.name == store.playlistName {
                            self.playlist = playlist
                        }
                    }
                }
            }
        }
        self.onDeletePlaylist = store.onDeletePlaylist
        self.onRemoveSongFromPlaylist = store.onRemoveSongFromPlaylist
    }
    
    @MainActor
    func foo(_ playlist: Playlist) {
        navigator?.dismiss()
        onDeletePlaylist(playlist)
    }
    
    func onSwipeToDeleteSong(at offsets: IndexSet) {
        // remove song locally from playlist
        guard let playlist = self.playlist else { return }
        self.playlist?.songs =
        playlist.songs.enumerated().filter { (i, song) -> Bool in
            let removed = offsets.contains(i)
            if removed {
                // tell PlaylistsView this song was deleted so it can update the appropriate PlaylistCell's count
                onRemoveSongFromPlaylist(song, playlist)
            }
            return !removed
        }.map { $0.1 }
    }
}
