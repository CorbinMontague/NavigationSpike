//
//  PlaylistViewModel.swift
//  Playlists
//
//  Created by Corbin Montague on 7/1/24.
//

import Core
import Foundation
import SwiftUI

class PlaylistViewModel: ObservableObject {
    
    @Published var playlist: Playlist {
        didSet {
            print("Playlist: \(playlist)")
        }
    }
    var onDeletePlaylist: ((Playlist) -> Void)
    var onRemoveSongFromPlaylist: ((Song, Playlist) -> Void)
    
    init(playlist: Playlist,
         onDeletePlaylist: @escaping ((Playlist) -> Void),
         onRemoveSongFromPlaylist: @escaping ((Song, Playlist) -> Void)) {
        self.playlist = playlist
        self.onDeletePlaylist = onDeletePlaylist
        self.onRemoveSongFromPlaylist = onRemoveSongFromPlaylist
    }
    
    func onDeleteSong(at offsets: IndexSet) {
        // remove song locally from playlist
        playlist.songs =
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
